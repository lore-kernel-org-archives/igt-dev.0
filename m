Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jul 2020 19:02:45 -0000
Message-ID: <159561736508.15335.9670788106470571115@emeril.freedesktop.org>
References: <20200724181628.5091-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200724181628.5091-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1076093922=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1076093922==
Content-Type: multipart/alternative;
 boundary="===============7615644254660433029=="

--===============7615644254660433029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev5)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8784 -> IGTPW_4801
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4801 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4801, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4801:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - fi-ilk-650:         NOTRUN -> [FAIL][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ilk-650/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-kbl-guc:         NOTRUN -> [DMESG-FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-guc/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - fi-tgl-u2:          NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * {igt@gem_read_read_speed@read-write-1024x1024} (NEW):
    - fi-snb-2520m:       NOTRUN -> [FAIL][6] +34 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@gem_read_read_speed@read-write-1024x1024.html

  * {igt@gem_read_read_speed@write-read-256x256} (NEW):
    - fi-tgl-u2:          NOTRUN -> [TIMEOUT][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_read_read_speed@write-read-256x256.html

  * {igt@gem_read_read_speed@write-write-256x256} (NEW):
    - fi-tgl-u2:          NOTRUN -> [WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_read_read_speed@write-write-256x256.html

  * igt@gem_render_tiled_blits@basic:
    - fi-gdg-551:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-gdg-551/igt@gem_render_tiled_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-gdg-551/igt@gem_render_tiled_blits@basic.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - fi-hsw-4770:        NOTRUN -> [FAIL][11] +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-cml-s:           NOTRUN -> [FAIL][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-icl-y:           NOTRUN -> [FAIL][13] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][14] +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][15] +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - fi-icl-u2:          NOTRUN -> [FAIL][16] +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - fi-elk-e7500:       NOTRUN -> [FAIL][17] +24 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-elk-e7500/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - fi-blb-e6850:       NOTRUN -> [FAIL][18] +7 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-blb-e6850/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - fi-gdg-551:         NOTRUN -> [FAIL][19] +8 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - fi-bwr-2160:        NOTRUN -> [FAIL][20] +24 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - fi-skl-6700k2:      NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6700k2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][22] +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - fi-byt-j1900:       NOTRUN -> [FAIL][23] +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][24] +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-cml-u2:          NOTRUN -> [FAIL][25] +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][26] +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][27] +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][28] +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - fi-tgl-u2:          NOTRUN -> [FAIL][29] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-skl-guc:         NOTRUN -> [FAIL][30] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][31] +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][32] +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-lmem/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][33] +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8109u/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - fi-icl-y:           NOTRUN -> [SKIP][34] +22 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - fi-cml-s:           NOTRUN -> [SKIP][35] +30 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - fi-cml-u2:          NOTRUN -> [SKIP][36] +30 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - fi-icl-u2:          NOTRUN -> [SKIP][37] +30 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * {igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][38] +81 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen.html

  * {igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][39] +117 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][40]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][42]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][43]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - fi-snb-2520m:       NOTRUN -> [CRASH][44] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - fi-skl-6600u:       NOTRUN -> [CRASH][45]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-snb-2520m:       [PASS][46] -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [CRASH][48] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [INCOMPLETE][49] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - fi-cfl-8109u:       NOTRUN -> [CRASH][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-skl-lmem:        NOTRUN -> [CRASH][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-8700k:       NOTRUN -> [CRASH][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-icl-y:           NOTRUN -> [CRASH][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-kbl-x1275:       NOTRUN -> [CRASH][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-hsw-4770:        NOTRUN -> [CRASH][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-guc:         NOTRUN -> [CRASH][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][57]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cml-s:           NOTRUN -> [CRASH][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][59]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][60] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - fi-snb-2600:        NOTRUN -> [FAIL][61] +36 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2600/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][62]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][63] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-snb-2520m:       NOTRUN -> [INCOMPLETE][64] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):
    - fi-icl-y:           NOTRUN -> [INCOMPLETE][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - fi-tgl-u2:          NOTRUN -> [INCOMPLETE][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][68]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - fi-cml-s:           NOTRUN -> [INCOMPLETE][69]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):
    - {fi-ehl-1}:         NOTRUN -> [SKIP][70] +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-bsw-kefka:       [PASS][71] -> [INCOMPLETE][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_psr@sprite_blt:
    - fi-skl-6600u:       NOTRUN -> [FAIL][73] +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_psr@sprite_blt.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       [DMESG-WARN][74] ([i915#62] / [i915#92]) -> [DMESG-WARN][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - {fi-tgl-dsi}:       NOTRUN -> [FAIL][76] +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][77] +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][78] +5 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][79] +31 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - {fi-ehl-1}:         NOTRUN -> [SKIP][80] +59 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [INCOMPLETE][81] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - {fi-tgl-dsi}:       NOTRUN -> [INCOMPLETE][82]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [CRASH][83]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][84] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8784 and IGTPW_4801:

### New IGT tests (697) ###

  * igt@api_intel_bb:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@check-canonical:
    - Statuses : 23 pass(s) 14 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@render-ccs:
    - Statuses : 21 pass(s) 16 skip(s)
    - Exec time: [0.0, 1.51] s

  * igt@api_intel_bb@render-none:
    - Statuses : 37 pass(s)
    - Exec time: [0.04, 0.42] s

  * igt@api_intel_bb@render-x:
    - Statuses : 1 fail(s) 36 pass(s)
    - Exec time: [0.04, 7.00] s

  * igt@api_intel_bb@render-y:
    - Statuses : 1 fail(s) 36 pass(s)
    - Exec time: [0.04, 6.86] s

  * igt@gem_caching:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ppgtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed@read-read-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@gem_read_read_speed@read-read-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.68] s

  * igt@gem_read_read_speed@read-read-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.39] s

  * igt@gem_read_read_speed@read-read-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@read-read-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.44] s

  * igt@gem_read_read_speed@read-read-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_read_read_speed@read-read-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 5.49] s

  * igt@gem_read_read_speed@read-write-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@gem_read_read_speed@read-write-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@read-write-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.50] s

  * igt@gem_read_read_speed@read-write-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.98] s

  * igt@gem_read_read_speed@read-write-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@gem_read_read_speed@read-write-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_read_read_speed@read-write-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 7.26] s

  * igt@gem_read_read_speed@write-read-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.58] s

  * igt@gem_read_read_speed@write-read-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_read_read_speed@write-read-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.56] s

  * igt@gem_read_read_speed@write-read-256x256:
    - Statuses : 2 fail(s) 27 pass(s) 6 skip(s) 1 timeout(s)
    - Exec time: [0.0, 92.43] s

  * igt@gem_read_read_speed@write-read-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.96] s

  * igt@gem_read_read_speed@write-read-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_read_read_speed@write-read-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 5.70] s

  * igt@gem_read_read_speed@write-write-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.32] s

  * igt@gem_read_read_speed@write-write-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_read_read_speed@write-write-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@gem_read_read_speed@write-write-256x256:
    - Statuses : 2 fail(s) 27 pass(s) 6 skip(s) 1 warn(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@write-write-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.41] s

  * igt@gem_read_read_speed@write-write-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_read_read_speed@write-write-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 19.41] s

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
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x128-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-128x42-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x256-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-256x85-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x170-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-512x512-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x21-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-64x64-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-dpms:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-size-change:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-e-cursor-suspend:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x128-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-128x42-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x256-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x85-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x85-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x85-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-256x85-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x170-offscreen:
    - Statuses :

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/index.html

--===============7615644254660433029==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8784 -&gt; IGTPW_4801</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4801 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4801, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4801:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ilk-650/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-guc/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_ppgtt@blt-vs-render-ctxn.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@read-write-1024x1024} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@gem_read_read_speed@read-write-1024x1024.html">FAIL</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@write-read-256x256} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_read_read_speed@write-read-256x256.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@write-write-256x256} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@gem_read_read_speed@write-write-256x256.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-elk-e7500/igt@kms_big_fb@linear-64bpp-rotate-270.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-blb-e6850/igt@kms_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-gdg-551:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6700k2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-lmem/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8109u/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html">SKIP</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen.html">SKIP</a> +81 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement.html">SKIP</a> +117 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2600/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-icl-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-skl-6600u/igt@kms_psr@sprite_blt.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8784/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> ([i915#62] / [i915#92]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a></li>
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
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen:</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_cursor_crc@pipe-b-cursor-512x170-onscreen.html">SKIP</a> +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-tgl-dsi/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4801/fi-ehl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8784 and IGTPW_4801:</p>
<h3>New IGT tests (697)</h3>
<ul>
<li>
<p>igt@api_intel_bb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>Statuses : 23 pass(s) 14 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 21 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 1.51] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.04, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x:</p>
<ul>
<li>Statuses : 1 fail(s) 36 pass(s)</li>
<li>Exec time: [0.04, 7.00] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y:</p>
<ul>
<li>Statuses : 1 fail(s) 36 pass(s)</li>
<li>Exec time: [0.04, 6.86] s</li>
</ul>
</li>
<li>
<p>igt@gem_caching:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
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
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.39] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.44] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 5.49] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 7.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.58] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 27 pass(s) 6 skip(s) 1 timeout(s)</li>
<li>Exec time: [0.0, 92.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.96] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 5.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.32] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 27 pass(s) 6 skip(s) 1 warn(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 19.41] s</li>
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
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x128-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-128x42-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x256-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-256x85-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x170-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-512x512-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x21-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-64x64-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-alpha-opaque:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-alpha-transparent:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-dpms:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-size-change:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-e-cursor-suspend:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x128-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-128x42-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x256-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x85-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x85-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x85-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-256x85-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x170-offscreen:</p>
<ul>
<li>Statuses :</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7615644254660433029==--

--===============1076093922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1076093922==--
