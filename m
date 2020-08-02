Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 02 Aug 2020 19:29:38 -0000
Message-ID: <159639657841.1948.9143390585705356867@emeril.freedesktop.org>
References: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev21=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2074277551=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2074277551==
Content-Type: multipart/alternative;
 boundary="===============2006501207110979639=="

--===============2006501207110979639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev21)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8832_full -> IGTPW_4839_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4839_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4839_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4839_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@render-x-reloc-512} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb1/igt@api_intel_bb@render-x-reloc-512.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-glk:          [PASS][2] -> [FAIL][3] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk3/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_busy@after@vecs0:
    - shard-hsw:          [PASS][4] -> [FAIL][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@prime_busy@after@vecs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@after@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8832_full and IGTPW_4839_full:

### New IGT tests (15) ###

  * igt@api_intel_bb@check-canonical:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@render-ccs:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.46] s

  * igt@api_intel_bb@render-none-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.50] s

  * igt@api_intel_bb@render-none-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.13] s

  * igt@api_intel_bb@render-none-reloc-1024:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@api_intel_bb@render-none-reloc-512:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@api_intel_bb@render-x-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.46] s

  * igt@api_intel_bb@render-x-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@api_intel_bb@render-x-reloc-1024:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@api_intel_bb@render-x-reloc-512:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@api_intel_bb@render-y-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.25, 0.45] s

  * igt@api_intel_bb@render-y-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@api_intel_bb@render-y-reloc-1024:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@api_intel_bb@render-y-reloc-512:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@reset-flags:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4839_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [PASS][6] -> [DMESG-WARN][7] ([i915#118] / [i915#95])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk1/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#1635]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl4/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][10] -> [SKIP][11] ([i915#1904])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [PASS][12] -> [DMESG-FAIL][13] ([i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][14] -> [DMESG-WARN][15] ([i915#180]) +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] ([i915#1982]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-hsw:          [PASS][18] -> [TIMEOUT][19] ([i915#1958]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#155])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#49])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][24] -> [DMESG-WARN][25] ([i915#1982]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [PASS][26] -> [TIMEOUT][27] ([i915#1958]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb4/igt@kms_invalid_dotclock.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_invalid_dotclock.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][30] -> [FAIL][31] ([i915#31])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#1982])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_vblank@pipe-b-accuracy-idle.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl7/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@kms_vblank@pipe-b-ts-continuation-idle-hang:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#1635] / [i915#1982])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-idle-hang.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-idle-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][36] -> [FAIL][37] ([i915#1542])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb4/igt@perf@blocking-parameterized.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb6/igt@perf@blocking-parameterized.html
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#1542])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb3/igt@perf@blocking-parameterized.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb6/igt@perf@blocking-parameterized.html

  * igt@prime_busy@after@vcs0:
    - shard-hsw:          [PASS][40] -> [FAIL][41] ([i915#2258]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@prime_busy@after@vcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@after@vcs0.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][42] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl2/igt@gen9_exec_parse@allowed-all.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl6/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_addfb_basic@small-bo:
    - shard-snb:          [TIMEOUT][44] ([i915#1958]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb6/igt@kms_addfb_basic@small-bo.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_addfb_basic@small-bo.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][46] ([i915#118] / [i915#95]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][48] ([i915#78]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_color@pipe-c-ctm-blue-to-red.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl2/igt@kms_color@pipe-c-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-hsw:          [TIMEOUT][50] ([i915#1958]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-glk:          [FAIL][52] ([i915#54]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [INCOMPLETE][54] ([i915#1635]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-iclb:         [DMESG-WARN][56] ([i915#128]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb5/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb5/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [FAIL][58] ([i915#57]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1:
    - shard-kbl:          [DMESG-WARN][60] -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1:
    - shard-kbl:          [DMESG-WARN][62] ([i915#165]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][64] ([i915#1982]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +6 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][68] ([i915#1982]) -> [PASS][69] +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][70] ([i915#1982]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][72] ([fdo#109642] / [fdo#111068]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb6/igt@kms_psr2_su@frontbuffer.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][74] ([fdo#109441]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb6/igt@kms_psr@psr2_dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@prime_busy@hang@bcs0:
    - shard-hsw:          [FAIL][76] ([i915#2258]) -> [PASS][77] +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@prime_busy@hang@bcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@hang@bcs0.html

  
#### Warnings ####

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-snb:          [SKIP][78] ([fdo#109271]) -> [TIMEOUT][79] ([i915#1958]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb2/igt@kms_color@pipe-c-ctm-green-to-red.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][80] ([i915#1319] / [i915#1958]) -> [TIMEOUT][81] ([i915#1319])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_content_protection@atomic.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl4/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-snb:          [TIMEOUT][82] ([i915#1958]) -> [SKIP][83] ([fdo#109271])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][84] ([fdo#109271]) -> [TIMEOUT][85] ([i915#1958])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5757 -> IGTPW_4839
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8832: 00b9a4b2331e1dceef8994e3b144e2c5e8c55003 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4839: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html

--===============2006501207110979639==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev21)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8832_full -&gt; IGTPW_4839_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4839_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4839_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4839_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@api_intel_bb@render-x-reloc-512} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb1/igt@api_intel_bb@render-x-reloc-512.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk3/igt@perf@gen8-unprivileged-single-ctx-counters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk4/igt@perf@gen8-unprivileged-single-ctx-counters.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@prime_busy@after@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@after@vecs0.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8832_full and IGTPW_4839_full:</p>
<h3>New IGT tests (15)</h3>
<ul>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.50] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.26, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.25, 0.45] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-reloc-512:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@reset-flags:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4839_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk1/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl1/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl4/igt@gem_ppgtt@blt-vs-render-ctxn.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl7/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb4/igt@kms_invalid_dotclock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_invalid_dotclock.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl7/igt@kms_vblank@pipe-b-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-idle-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-idle-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb6/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb3/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb6/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@prime_busy@after@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@after@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl6/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@small-bo:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb6/igt@kms_addfb_basic@small-bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_addfb_basic@small-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_color@pipe-c-ctm-blue-to-red.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl2/igt@kms_color@pipe-c-ctm-blue-to-red.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-random:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@all-pipes-torture-bo:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb5/igt@kms_cursor_legacy@all-pipes-torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/128">i915#128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb5/igt@kms_cursor_legacy@all-pipes-torture-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl2/igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_flip@flip-vs-dpms-off-vs-modeset@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb4/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-iclb6/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw8/igt@prime_busy@hang@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw2/igt@prime_busy@hang@bcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_color@pipe-c-ctm-green-to-red:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb2/igt@kms_color@pipe-c-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_color@pipe-c-ctm-green-to-red.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-kbl6/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-kbl4/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8832/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5757 -&gt; IGTPW_4839</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8832: 00b9a4b2331e1dceef8994e3b144e2c5e8c55003 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4839: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4839/index.html<br />
  IGT_5757: d78c7fd293cb228fe03ccff730202b033e25ff18 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2006501207110979639==--

--===============2074277551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2074277551==--
