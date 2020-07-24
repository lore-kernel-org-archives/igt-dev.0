Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jul 2020 07:20:59 -0000
Message-ID: <159557525993.15336.13739790926870468503@emeril.freedesktop.org>
References: <20200724064043.10172-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200724064043.10172-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1045593287=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1045593287==
Content-Type: multipart/alternative;
 boundary="===============2487266898368452417=="

--===============2487266898368452417==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev2)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8783 -> IGTPW_4797
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4797 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4797, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4797:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - fi-ilk-650:         NOTRUN -> [FAIL][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ilk-650/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][2] +7 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - fi-cfl-8700k:       NOTRUN -> [DMESG-FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * {igt@gem_read_read_speed@read-write-1024x1024} (NEW):
    - fi-snb-2520m:       NOTRUN -> [FAIL][5] +34 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@gem_read_read_speed@read-write-1024x1024.html

  * igt@gem_render_tiled_blits@basic:
    - fi-gdg-551:         [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-gdg-551/igt@gem_render_tiled_blits@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-gdg-551/igt@gem_render_tiled_blits@basic.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - fi-hsw-4770:        NOTRUN -> [FAIL][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-cml-s:           NOTRUN -> [FAIL][9] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-icl-y:           NOTRUN -> [FAIL][10] +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_big_fb@linear-64bpp-rotate-0.html
    - fi-bdw-5557u:       NOTRUN -> [FAIL][11] +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - fi-cfl-8700k:       NOTRUN -> [FAIL][12] +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - fi-icl-u2:          NOTRUN -> [FAIL][13] +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - fi-elk-e7500:       NOTRUN -> [FAIL][14] +24 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-elk-e7500/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - fi-blb-e6850:       NOTRUN -> [FAIL][15] +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-blb-e6850/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - fi-gdg-551:         NOTRUN -> [FAIL][16] +7 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - fi-bwr-2160:        NOTRUN -> [FAIL][17] +24 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - fi-skl-6700k2:      NOTRUN -> [FAIL][18] +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6700k2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][19] +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - fi-byt-j1900:       NOTRUN -> [FAIL][20] +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][21] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-cml-u2:          NOTRUN -> [FAIL][22] +5 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-bsw-kefka:       NOTRUN -> [FAIL][23] +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - fi-kbl-7500u:       NOTRUN -> [FAIL][24] +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][25] +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - fi-tgl-u2:          NOTRUN -> [FAIL][26] +38 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-skl-guc:         NOTRUN -> [FAIL][27] +5 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][28] +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-skl-lmem:        NOTRUN -> [FAIL][29] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-lmem/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][30] +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8109u/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-random:
    - fi-icl-y:           NOTRUN -> [SKIP][31] +22 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - fi-cml-s:           NOTRUN -> [SKIP][32] +30 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - fi-cml-u2:          NOTRUN -> [SKIP][33] +30 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - fi-icl-u2:          NOTRUN -> [SKIP][34] +30 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * {igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement} (NEW):
    - fi-tgl-u2:          NOTRUN -> [SKIP][35] +261 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ivb-3770:        NOTRUN -> [INCOMPLETE][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-blb-e6850:       NOTRUN -> [INCOMPLETE][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
    - fi-ilk-650:         NOTRUN -> [INCOMPLETE][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - fi-snb-2520m:       NOTRUN -> [CRASH][40] +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - fi-skl-6600u:       NOTRUN -> [CRASH][41]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-snb-2520m:       [PASS][42] -> [FAIL][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [CRASH][44] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):
    - fi-bsw-kefka:       NOTRUN -> [INCOMPLETE][45] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - fi-cfl-8109u:       NOTRUN -> [CRASH][46]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-skl-lmem:        NOTRUN -> [CRASH][47]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-8700k:       NOTRUN -> [CRASH][48]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-icl-y:           NOTRUN -> [CRASH][49]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-kbl-x1275:       NOTRUN -> [CRASH][50]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-hsw-4770:        NOTRUN -> [CRASH][51]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cfl-guc:         NOTRUN -> [CRASH][52]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-tgl-u2:          NOTRUN -> [CRASH][53]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-bdw-5557u:       NOTRUN -> [CRASH][54]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bdw-5557u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
    - fi-cml-s:           NOTRUN -> [CRASH][55]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - fi-skl-6700k2:      NOTRUN -> [INCOMPLETE][56]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - fi-skl-6600u:       NOTRUN -> [INCOMPLETE][57] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
    - fi-kbl-r:           NOTRUN -> [INCOMPLETE][58]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-r/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - fi-snb-2600:        NOTRUN -> [FAIL][59] +36 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2600/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - fi-cfl-8700k:       NOTRUN -> [INCOMPLETE][60]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-hsw-4770:        NOTRUN -> [INCOMPLETE][61] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
    - fi-snb-2520m:       NOTRUN -> [INCOMPLETE][62] +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):
    - fi-icl-y:           NOTRUN -> [INCOMPLETE][63]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - fi-tgl-u2:          NOTRUN -> [INCOMPLETE][64]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - fi-cml-u2:          NOTRUN -> [INCOMPLETE][65]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][66]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - fi-cml-s:           NOTRUN -> [INCOMPLETE][67]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):
    - {fi-ehl-1}:         NOTRUN -> [SKIP][68] +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-b:
    - fi-bsw-kefka:       [PASS][69] -> [INCOMPLETE][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html

  * igt@kms_psr@cursor_blt:
    - fi-kbl-r:           NOTRUN -> [FAIL][71] +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-r/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@sprite_blt:
    - fi-skl-6600u:       NOTRUN -> [FAIL][72] +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_psr@sprite_blt.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - fi-kbl-x1275:       [DMESG-WARN][73] ([i915#62] / [i915#92]) -> [DMESG-WARN][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - {fi-kbl-7560u}:     NOTRUN -> [FAIL][75] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - {fi-ehl-1}:         NOTRUN -> [FAIL][76] +5 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - {fi-ehl-1}:         NOTRUN -> [SKIP][77] +59 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [INCOMPLETE][78] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - {fi-kbl-7560u}:     NOTRUN -> [CRASH][79]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - {fi-ehl-1}:         NOTRUN -> [INCOMPLETE][80] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8783 and IGTPW_4797:

### New IGT tests (694) ###

  * igt@api_intel_bb@render-ccs:
    - Statuses : 1 fail(s) 20 pass(s) 16 skip(s)
    - Exec time: [0.0, 0.49] s

  * igt@api_intel_bb@render-none:
    - Statuses : 37 pass(s)
    - Exec time: [0.17, 1.35] s

  * igt@api_intel_bb@render-x:
    - Statuses : 37 pass(s)
    - Exec time: [0.17, 0.95] s

  * igt@api_intel_bb@render-y:
    - Statuses : 37 pass(s)
    - Exec time: [0.17, 0.90] s

  * igt@gem_ppgtt:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_read_read_speed@read-read-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_read_read_speed@read-read-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@gem_read_read_speed@read-read-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.30] s

  * igt@gem_read_read_speed@read-read-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@read-read-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.92] s

  * igt@gem_read_read_speed@read-read-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_read_read_speed@read-read-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 3.69] s

  * igt@gem_read_read_speed@read-write-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@gem_read_read_speed@read-write-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_read_read_speed@read-write-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@gem_read_read_speed@read-write-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@read-write-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.13] s

  * igt@gem_read_read_speed@read-write-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_read_read_speed@read-write-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 4.43] s

  * igt@gem_read_read_speed@write-read-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.65] s

  * igt@gem_read_read_speed@write-read-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_read_read_speed@write-read-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.52] s

  * igt@gem_read_read_speed@write-read-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@write-read-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.21] s

  * igt@gem_read_read_speed@write-read-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_read_read_speed@write-read-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 6.07] s

  * igt@gem_read_read_speed@write-write-1024x1024:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.38] s

  * igt@gem_read_read_speed@write-write-128x128:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_read_read_speed@write-write-2048x2048:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.29] s

  * igt@gem_read_read_speed@write-write-256x256:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_read_read_speed@write-write-4096x4096:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.04] s

  * igt@gem_read_read_speed@write-write-512x512:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_read_read_speed@write-write-8192x8192:
    - Statuses : 2 fail(s) 28 pass(s) 6 skip(s)
    - Exec time: [0.0, 18.49] s

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
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x170-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x170-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x170-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x512-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x512-random:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x512-rapid-movement:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-512x512-sliding:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-64x21-offscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-64x21-onscreen:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-f-cursor-64x21-random:
    - Statuses : 36 skip(s)
    - Exec tim

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/index.html

--===============2487266898368452417==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8783 -&gt; IGTPW_4797</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4797 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4797, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4797:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ilk-650/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-pnv-d510/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-nick/igt@gem_ppgtt@blt-vs-render-ctx0.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@gem_ppgtt@blt-vs-render-ctxn.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@gem_read_read_speed@read-write-1024x1024} (NEW):</p>
<ul>
<li>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@gem_read_read_speed@read-write-1024x1024.html">FAIL</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-gdg-551/igt@gem_render_tiled_blits@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bdw-5557u/igt@kms_big_fb@linear-64bpp-rotate-0.html">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-elk-e7500/igt@kms_big_fb@linear-64bpp-rotate-270.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-blb-e6850/igt@kms_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +7 similar issues</p>
</li>
<li>
<p>fi-gdg-551:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-gdg-551/igt@kms_big_fb@linear-8bpp-rotate-270.html">FAIL</a> +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bwr-2160/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">FAIL</a> +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6700k2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ivb-3770/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-byt-j1900:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-byt-j1900/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-n3050/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7500u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +38 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-guc/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-lmem/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8109u/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-random:</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_cursor_crc@pipe-a-cursor-512x512-random.html">SKIP</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> +30 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement} (NEW):</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_cursor_crc@pipe-e-cursor-64x64-rapid-movement.html">SKIP</a> +261 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ivb-3770/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-blb-e6850/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ilk-650/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a> +1 similar issue</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">CRASH</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render (NEW):</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8109u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-skl-lmem:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-lmem/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-guc/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bdw-5557u/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
<li>
<p>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6700k2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-r/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2600/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">FAIL</a> +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cfl-8700k/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a></p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-hsw-4770/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-snb-2520m/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">INCOMPLETE</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw (NEW):</p>
<ul>
<li>fi-icl-y:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-y/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-tgl-u2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-icl-u2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>fi-cml-s:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-cml-s/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrdrrs-2p-rte (NEW):</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_frontbuffer_tracking@psrdrrs-2p-rte.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-b:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-bsw-kefka/igt@kms_pipe_crc_basic@read-crc-pipe-b.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>fi-kbl-r:           NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-r/igt@kms_psr@cursor_blt.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-skl-6600u/igt@kms_psr@sprite_blt.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8783/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> ([i915#62] / [i915#92]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-x1275/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +6 similar issues</p>
</li>
<li>
<p>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html">SKIP</a> +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>{fi-kbl-7560u}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-kbl-7560u/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>{fi-ehl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4797/fi-ehl-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8783 and IGTPW_4797:</p>
<h3>New IGT tests (694)</h3>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 1 fail(s) 20 pass(s) 16 skip(s)</li>
<li>Exec time: [0.0, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.17, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.17, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y:</p>
<ul>
<li>Statuses : 37 pass(s)</li>
<li>Exec time: [0.17, 0.90] s</li>
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
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.30] s</li>
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
<li>Exec time: [0.0, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 3.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-128x128:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-2048x2048:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.13] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@read-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 4.43] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.65] s</li>
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
<li>Exec time: [0.0, 0.52] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-read-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 6.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-1024x1024:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.38] s</li>
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
<li>Exec time: [0.0, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-256x256:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-4096x4096:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-512x512:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_read_read_speed@write-write-8192x8192:</p>
<ul>
<li>Statuses : 2 fail(s) 28 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 18.49] s</li>
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
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x170-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x170-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x170-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x512-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x512-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x512-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x512-rapid-movement:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-512x512-sliding:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-64x21-offscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-64x21-onscreen:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-f-cursor-64x21-random:</p>
<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec tim</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2487266898368452417==--

--===============1045593287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1045593287==--
