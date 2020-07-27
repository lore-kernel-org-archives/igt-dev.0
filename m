Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jul 2020 12:46:59 -0000
Message-ID: <159585401988.26749.15790015342550654137@emeril.freedesktop.org>
References: <20200727114412.5101-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200727114412.5101-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev8=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0534294640=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0534294640==
Content-Type: multipart/alternative;
 boundary="===============2675093529710791839=="

--===============2675093529710791839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev8)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5749 -> IGTPW_4805
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4805 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4805, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4805:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - fi-pnv-d510:        NOTRUN -> [FAIL][1] +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - fi-bsw-kefka:       NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * {igt@gem_read_read_speed@read-read-2048x2048} (NEW):
    - fi-snb-2520m:       NOTRUN -> [FAIL][4] +34 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@gem_read_read_speed@read-read-2048x2048.html

  * {igt@gem_read_read_speed@read-read-8192x8192} (NEW):
    - fi-snb-2600:        NOTRUN -> [FAIL][5] +36 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2600/igt@gem_read_read_speed@read-read-8192x8192.html

  * {igt@gem_read_read_speed@read-write-512x512} (NEW):
    - fi-icl-u2:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@gem_read_read_speed@read-write-512x512.html

  * {igt@gem_read_read_speed@write-read-512x512} (NEW):
    - fi-icl-u2:          NOTRUN -> [WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@gem_read_read_speed@write-read-512x512.html

  * igt@gem_render_tiled_blits@basic:
    - fi-gdg-551:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-gdg-551/igt@gem_render_tiled_blits@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-gdg-551/igt@gem_render_tiled_blits@basic.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - fi-cml-s:           NOTRUN -> [FAIL][10] +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-ilk-650:         NOTRUN -> [FAIL][11] +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ilk-650/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-lmem/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][13] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - fi-icl-u2:          NOTRUN -> [FAIL][14] +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][15] +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][16] +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - fi-gdg-551:         NOTRUN -> [FAIL][17] +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - fi-bwr-2160:        NOTRUN -> [FAIL][18] +24 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - fi-elk-e7500:       NOTRUN -> [FAIL][19] +24 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-elk-e7500/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - fi-tgl-y:           NOTRUN -> [FAIL][20] +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8109u/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][22] +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - fi-kbl-soraka:      NOTRUN -> [FAIL][23] +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-soraka/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - fi-hsw-4770:        NOTRUN -> [FAIL][24] +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-byt-j1900:       NOTRUN -> [FAIL][25] +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][26] +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-cml-u2:          NOTRUN -> [FAIL][27] +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][28] +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - fi-blb-e6850:       NOTRUN -> [FAIL][29] +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-blb-e6850/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][30] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - fi-skl-6700k2:      NOTRUN -> [FAIL][31] +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6700k2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - fi-tgl-u2:          NOTRUN -> [FAIL][32] +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-skl-guc:         NOTRUN -> [FAIL][33] +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][34] +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-icl-y:           NOTRUN -> [FAIL][35] +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - fi-tgl-y:           NOTRUN -> [SKIP][36] +26 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - fi-cml-u2:          NOTRUN -> [SKIP][37] +30 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - fi-icl-y:           NOTRUN -> [SKIP][38] +22 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - fi-icl-u2:          NOTRUN -> [SKIP][39] +30 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - fi-tgl-y:           NOTRUN -> [INCOMPLETE][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * {igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][41] +84 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen.html

  * {igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][42] +264 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][44]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - fi-snb-2520m:       NOTRUN -> [CRASH][47] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - fi-skl-6600u:       NOTRUN -> [CRASH][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-snb-2520m:       [PASS][49] -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [CRASH][51] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [INCOMPLETE][52] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - fi-skl-lmem:        NOTRUN -> [CRASH][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-kbl-x1275:       NOTRUN -> [CRASH][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-bdw-5557u:       NOTRUN -> [CRASH][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bdw-5557u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-8109u:       NOTRUN -> [CRASH][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-8700k:       NOTRUN -> [CRASH][57]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-icl-y:           NOTRUN -> [CRASH][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-hsw-4770:        NOTRUN -> [CRASH][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-guc:         NOTRUN -> [CRASH][60]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][61]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cml-s:           NOTRUN -> [CRASH][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][64] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
    - fi-kbl-r:           NOTRUN -> [INCOMPLETE][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-r/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][67] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-snb-2520m:       NOTRUN -> [INCOMPLETE][68] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte (NEW):
    - fi-cml-s:           NOTRUN -> [SKIP][69] +30 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):
    - fi-icl-y:           NOTRUN -> [INCOMPLETE][70]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - fi-tgl-u2:          NOTRUN -> [INCOMPLETE][71]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][72]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - fi-cml-s:           NOTRUN -> [INCOMPLETE][73]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):
    - {fi-ehl-1}:         NOTRUN -> [SKIP][74] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-bsw-kefka:       [PASS][75] -> [INCOMPLETE][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_psr@primary_blt:
    - fi-kbl-r:           NOTRUN -> [FAIL][77] +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-r/igt@kms_psr@primary_blt.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][78] +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - {fi-ehl-1}:         NOTRUN -> [FAIL][79] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][80] +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][81] +31 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - {fi-ehl-1}:         NOTRUN -> [SKIP][82] +59 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [INCOMPLETE][83] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][84]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [CRASH][85]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][86] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  
New tests
---------

  New tests have been introduced between IGT_5749 and IGTPW_4805:

### New IGT tests (698) ###

  * igt@api_intel_bb@check-canonical:
    - Statuses : 26 pass(s) 14 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@api_intel_bb@render-ccs:
    - Statuses : 1 dmesg-warn(s) 23 pass(s) 16 skip(s)
    - Exec time: [0.0, 1.53] s

  * igt@api_intel_bb@render-none:
    - Statuses : 40 pass(s)
    - Exec time: [0.18, 1.61] s

  * igt@api_intel_bb@render-none-reloc:
    - Statuses : 37 pass(s) 3 skip(s)
    - Exec time: [0.0, 1.60] s

  * igt@api_intel_bb@render-x:
    - Statuses : 1 fail(s) 39 pass(s)
    - Exec time: [0.17, 9.16] s

  * igt@api_intel_bb@render-x-reloc:
    - Statuses : 1 fail(s) 36 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.42] s

  * igt@api_intel_bb@render-y:
    - Statuses : 1 fail(s) 39 pass(s)
    - Exec time: [0.17, 3.47] s

  * igt@api_intel_bb@render-y-reloc:
    - Statuses : 1 fail(s) 36 pass(s) 3 skip(s)
    - Exec time: [0.0, 3.50] s

  * igt@gem_ppgtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed@read-read-1024x1024:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.12] s

  * igt@gem_read_read_speed@read-read-128x128:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.67] s

  * igt@gem_read_read_speed@read-read-2048x2048:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.45] s

  * igt@gem_read_read_speed@read-read-256x256:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_read_read_speed@read-read-4096x4096:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.59] s

  * igt@gem_read_read_speed@read-read-512x512:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.28] s

  * igt@gem_read_read_speed@read-read-8192x8192:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 6.34] s

  * igt@gem_read_read_speed@read-write-1024x1024:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.20] s

  * igt@gem_read_read_speed@read-write-128x128:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@read-write-2048x2048:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@gem_read_read_speed@read-write-256x256:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.57] s

  * igt@gem_read_read_speed@read-write-4096x4096:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 5.66] s

  * igt@gem_read_read_speed@read-write-512x512:
    - Statuses : 2 fail(s) 30 pass(s) 6 skip(s) 1 timeout(s)
    - Exec time: [0.0, 128.38] s

  * igt@gem_read_read_speed@read-write-8192x8192:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 7.02] s

  * igt@gem_read_read_speed@write-read-1024x1024:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.55] s

  * igt@gem_read_read_speed@write-read-128x128:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@write-read-2048x2048:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.60] s

  * igt@gem_read_read_speed@write-read-256x256:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.03] s

  * igt@gem_read_read_speed@write-read-4096x4096:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.79] s

  * igt@gem_read_read_speed@write-read-512x512:
    - Statuses : 2 fail(s) 30 pass(s) 6 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_read_read_speed@write-read-8192x8192:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 7.27] s

  * igt@gem_read_read_speed@write-write-1024x1024:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.37] s

  * igt@gem_read_read_speed@write-write-128x128:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@write-write-2048x2048:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@gem_read_read_speed@write-write-256x256:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 9.98] s

  * igt@gem_read_read_speed@write-write-4096x4096:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.62] s

  * igt@gem_read_read_speed@write-write-512x512:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_read_read_speed@write-write-8192x8192:
    - Statuses : 2 fail(s) 31 pass(s) 6 skip(s)
    - Exec time: [0.0, 15.39] s

  * igt@gem_render_copy:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-dpms:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-size-change:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-suspend:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-sliding:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-offscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-onscreen:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-random:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-rapid-movement:
    - Statuses : 38 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/index.html

--===============2675093529710791839==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5749 -&gt; IGTPW_4805</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4805 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4805, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4805:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@read-read-2048x2048} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@gem_read_read_speed@read-read-2048x2048.html">FAIL</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@read-read-8192x8192} (NEW):</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2600/igt@gem_read_read_speed@read-read-8192x8192.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@read-write-512x512} (NEW):</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@gem_read_read_speed@read-write-512x512.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@write-read-512x512} (NEW):</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@gem_read_read_speed@write-read-512x512.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ilk-650/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-lmem/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>fi-gdg-551:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-elk-e7500/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8109u/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-soraka/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-blb-e6850/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6700k2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html">SKIP</a> +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:</p>
<ul>
<li>fi-tgl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-y/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen.html">SKIP</a> +84 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen.html">SKIP</a> +264 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bdw-5557u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-r/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte (NEW):</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@fbcdrrs-2p-rte.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5749/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-r/igt@kms_psr@primary_blt.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-tgl-dsi/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4805/fi-ehl-1/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5749 and IGTPW_4805:</p>
<h3>New IGT tests (698)</h3>
<ul>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>Statuses : 26 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 23 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none:</p>
<ul>
<li>Statuses : 40 pass(s)</li>
<li>Exec time: [0.18, 1.61] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-reloc:</p>
<ul>
<li>Statuses : 37 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.60] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x:</p>
<ul>
<li>Statuses : 1 fail(s) 39 pass(s)</li>
<li>Exec time: [0.17, 9.16] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-reloc:</p>
<ul>
<li>Statuses : 1 fail(s) 36 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.42] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y:</p>
<ul>
<li>Statuses : 1 fail(s) 39 pass(s)</li>
<li>Exec time: [0.17, 3.47] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-reloc:</p>
<ul>
<li>Statuses : 1 fail(s) 36 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 3.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.59] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.28] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 6.34] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.57] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 5.66] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 30 pass(s) 6 skip(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 128.38] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 7.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.60] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 30 pass(s) 6 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 7.27] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.37] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 9.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 31 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 15.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-dpms:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-size-change:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-suspend:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-sliding:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-offscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-onscreen:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-random:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-rapid-movement:</p>
<ul>
<li>Statuses : 38 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pip</p>
</li>
</ul>

</body>
</html>

--===============2675093529710791839==--

--===============0534294640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0534294640==--
