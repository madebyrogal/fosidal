/**
 * cna is shortcut from _cookie notifier auto_. "Auto" means this script will
 * automatically show msg when loaded.
 */
(function() {

    if (window.console == undefined) {
        window.console = {
            log: function() {},
            info: function() {},
            error: function() {}
        };
    }

    var el = document.getElementById('__ncnst'), // ncnst = nuorder cookie notifier script tag    
        uid = el ? getAttr(el, 'data-uid') : null;

    // Check if website identifier is defined
    if ( ! uid) {
        console.error('NUORDER_COOKIE_NOTIFIER_UID not defined.');
        return;
    }
    
    // Check if user not already allowed cookies on this website
    if (getCookie('cn'+uid) == '1') {
        return;
    }

    // Wait for DOM loaded
    var readyStateCheckInterval = setInterval(function() {
        if (document.readyState === "complete") {
            init();
            clearInterval(readyStateCheckInterval);
        }
    }, 10);

    /**
     * Create iframe.
     */
    function init() {
        var reset = 'margin: 0 !important; padding: 0 !important; border: !important; font-size: 100% !important; font: inherit !important; vertical-align: baseline !important; font-family: "Lato", "Arial", "Verdana" !important; ';

        applyStyles([
            '.___ncn-container { margin: -85px 0 0 0 !important; border: 0 !important; vertical-align: baseline !important; width: 100% !important; padding: 5px 15px !important; background: #fbfbfb !important; bottom: 0 !important; position: fixed !important; z-index: 99999 !important; left: 0 !important}',
            '.___ncn-inner-container { padding: 10px 0 10px 0 !important; border: 0!important; vertical-align: baseline !important; margin: 0 auto !important; max-width: 680px !important; position: relative !important; font-family: "Lato", "Arial", "Verdana" !important; font-size: 12px !important; }',
            '.___ncn-h1 { margin: 0px 0px 4px 0 !important; padding: 0 !important; border: 0 !important; font-size: 11px !important; font: inherit !important; vertical-align: baseline !important; text-transform: uppercase !important; color: #000 !important; font-weight: bold !important; }',
            '.___ncn-p { margin: 5px 0px 0 0 !important; padding: 0 !important; border: 0 !important; font-size: 12px !important; line-height:18px !important;  vertical-align: baseline !important; color: #3c3c3c !important; width: 90% !important; }',
            '.___ncn-cookies-more { margin: 0 !important; font: inherit !important; vertical-align: baseline !important; color: #3c3c3c !important; font-size: 12px !important;  font-family: "Lato", "Arial", "Verdana" !important; text-decoration:underline;  }',
            '.___ncn-close { margin: 0 15px 0 0 !important; border: 0 !important; font: inherit !important; vertical-align: baseline !important; padding: 20px 0px 0 20px !important;  font-size: 52px !important; font-weight: bold !important; color: #c2c2c2 !important; line-height: 27px !important; cursor: pointer !important; float: right !important; width: 10% !important }'
        ].join("\n"));

        var html = [
            '<div class="___ncn-inner-container">',
                '<a class="___ncn-close" id="___ncn-close">&times;</a>',
                '<p class="___ncn-p"><strong>Nasza witryna stosuje pliki „Cookies”.</strong> W celu świadczenia usług na najwyższym poziomie, w tym w sposób dostosowany do indywidualnych potrzeb naszych użytkowników, stosujemy narzędzia do zbierania danych. W każdym czasie można dokonać zmiany ustawień dotyczących tych narzędzi. <a class="___ncn-cookies-more" href="http://www.polpharma.pl/polityka-cookies" title="Polityka Cookies" target="_blank">Więcej szczegółów w „Polityce Cookies”.</a></p>',
            '</div>'
        ].join('');

        var body = document.getElementsByTagName('body');

        if (body) {
            body = body[0];
            var div = document.createElement('div');
            div.className = '___ncn-container';
            div.innerHTML = html;
            body.insertBefore(div, body.firstChild);
            
            var cl = document.getElementById('___ncn-close');

            listen('click', cl, function() {
                div.parentNode.removeChild(div);
                cl.parentNode.removeChild(cl);
                body.style.marginBottom = '0px';

                var date = new Date();
                // Default at 365 days.
                days = 365;
                // Get unix milliseconds at current time plus number of days
                date.setTime(+ date + (days * 86400000)); //24 * 60 * 60 * 1000

                document.cookie = 'cn'+uid+'=1; expires=' + date.toGMTString() + '; path=/';

            });
        }
    }

    /**
     * Return cookie by name.
     * 
     * @param  {String} name     Cookie name.
     * @param  {Mixed} defaults  Default value returned if cookie does not exists.
     * @return {Mixed}           Cookie value (or default value).
     */
    function getCookie(name, defaults) {
        var cookies = document.cookie.split(';'),
            len = cookies.length,
            i = 0,
            cookie;

        for (; i < len; i++) {
            cookie = cookies[i].split('=');

            if (name == cookie[0].trim()) {
                return cookie[1];
            }
        }

        return defaults || null;
    };

    /**
     * Return element attribute.
     * 
     * @param  {Element} el
     * @param  {String} attr Attribute name
     * @return {String}
     */
    function getAttr(el, attr) {
        var result = (el.getAttribute && el.getAttribute(attr)) || null;

        if ( ! result ) {
            var attrs = el.attributes,
                len = attrs.length,
                i = 0
            for (; i < len; i++) {
                if (attrs[i].nodeName === attr) {
                    result = attrs[i].nodeValue;
                }
            }
        }

        return result;
    };

    function listen(e, el, fn) {
        if (el.addEventListener) {
            el.addEventListener(e, fn, false);
        } else if (el.attachEvent) {
            return el.attachEvent('on'+e, fn);
        }
    };

    function browserWindowSize() {
        var browserWinWidth = 0, browserWinHeight = 0;
        if( typeof( window.innerWidth ) == 'number' ) {
            //Non-IE
            browserWinWidth = window.innerWidth;
            browserWinHeight = window.innerHeight;
        } else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) {
            //IE 6+ in 'standards compliant mode'
            browserWinWidth = document.documentElement.clientWidth;
            browserWinHeight = document.documentElement.clientHeight;
        } else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) {
            //IE 4 compatible
            browserWinWidth = document.body.clientWidth;
            browserWinHeight = document.body.clientHeight;
        }
        
        return { width: browserWinWidth, height: browserWinHeight };
    };

    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g, '');
    };

    function applyStyles(styles) {
        var e = document.createElement("style");
        e.setAttribute("id", "___ncn-styles");
        e.setAttribute("type", "text/css");
        e.appendChild(document.createTextNode(styles));

        if (document.head) {
            document.head.appendChild(e);
        } else {
            document.documentElement.appendChild(e);
        }
    };

})();