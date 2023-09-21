// ==UserScript==
// @name         Reload Flightradar24 every 20 minutes
// @namespace    https://puac.de/
// @version      0.1.0
// @description  Reloads the Flightradar24 website every 20 minutes to avoid the 30 minute timeout.
// @author       Hans Puac
// @match        https://www.flightradar24.com/*/*
// @run-at       document-end
// ==/UserScript==

(function () {
    'use strict';

    window.setTimeout(function () {
        window.location.reload();
    }, 1000 * 60 * 20);
})();
