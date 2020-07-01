Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Jul 2020 19:52:13 -0000
Message-ID: <159363313348.16670.2625241612667962682@emeril.freedesktop.org>
References: <20200701121914.31034-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200701121914.31034-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev10=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev10)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8686_full -> IGTPW_4723_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4723_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb7/igt@api_intel_bb@intel-bb-blit.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw7/igt@api_intel_bb@intel-bb-blit.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8686_full and IGTPW_4723_full:

### New IGT tests (9) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 2 fail(s) 5 pass(s)
    - Exec time: [4.59, 8.25] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4723_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb3/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb2/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1899])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +44 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl2/igt@i915_pm_rpm@gem-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl6/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_selftest@mock@requests:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] ([i915#2110] / [i915#82])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-snb6/igt@i915_selftest@mock@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-snb6/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_color@pipe-c-ctm-green-to-red:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#129])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl6/igt@kms_color@pipe-c-ctm-green-to-red.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl1/igt@kms_color@pipe-c-ctm-green-to-red.html
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#129])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl1/igt@kms_color@pipe-c-ctm-green-to-red.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl1/igt@kms_color@pipe-c-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +43 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#54] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@kms_flip_tiling@flip-yf-tiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl4/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +7 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb7/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb3/igt@kms_plane_scaling@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_prop_blob@blob-prop-core:
    - shard-snb:          [PASS][33] -> [TIMEOUT][34] ([i915#1958] / [i915#2119]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-snb5/igt@kms_prop_blob@blob-prop-core.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-snb4/igt@kms_prop_blob@blob-prop-core.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk8/igt@perf@disabled-read-error.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk9/igt@perf@disabled-read-error.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([i915#405])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb3/igt@perf@rc6-disable.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb8/igt@perf@rc6-disable.html
    - shard-hsw:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw7/igt@perf@rc6-disable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw8/igt@perf@rc6-disable.html
    - shard-kbl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl2/igt@perf@rc6-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl7/igt@perf@rc6-disable.html
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@perf@rc6-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl3/igt@perf@rc6-disable.html
    - shard-tglb:         [PASS][49] -> [SKIP][50] ([fdo#111719] / [i915#405])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb6/igt@perf@rc6-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb3/igt@perf@rc6-disable.html
    - shard-glk:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk5/igt@perf@rc6-disable.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk2/igt@perf@rc6-disable.html

  * igt@perf_pmu@other-read-0:
    - shard-hsw:          [PASS][53] -> [TIMEOUT][54] ([i915#1958] / [i915#2119]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw4/igt@perf_pmu@other-read-0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw8/igt@perf_pmu@other-read-0.html

  
#### Possible fixes ####

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][55] ([i915#1436] / [i915#716]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@gen9_exec_parse@allowed-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][57] ([i915#93] / [i915#95]) -> [PASS][58] +42 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl1/igt@i915_getparams_basic@basic-eu-total.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl4/igt@i915_getparams_basic@basic-eu-total.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][59] ([i915#118] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#54] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][65] ([i915#2055]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw1/igt@kms_lease@lessee_list.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw2/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][71] ([fdo#108145] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         [DMESG-WARN][81] ([i915#402]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb8/igt@kms_psr@psr2_sprite_plane_onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb3/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-a-query-idle-hang:
    - shard-apl:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl4/igt@kms_vblank@pipe-a-query-idle-hang.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_vblank@pipe-a-query-idle-hang.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@blocking:
    - shard-glk:          [DMESG-WARN][87] ([i915#118] / [i915#95]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-glk6/igt@perf@blocking.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-glk7/igt@perf@blocking.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][89] ([i915#1542]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-iclb4/igt@perf@blocking-parameterized.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#95]) -> [PASS][92] +37 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl8/igt@perf@invalid-oa-metric-set-id.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl4/igt@perf@invalid-oa-metric-set-id.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][93] ([i915#1982]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb2/igt@perf_pmu@module-unload.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb5/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][95] ([i915#1930]) -> [TIMEOUT][96] ([i915#1958] / [i915#2119])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180]) -> [DMESG-WARN][98] ([i915#93] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][99] ([i915#454]) -> [FAIL][100] ([i915#1899])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          [SKIP][101] ([fdo#109271]) -> [SKIP][102] ([fdo#109271] / [i915#1635]) +10 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [fdo#111827]) -> [SKIP][104] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl1/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][106] ([fdo#109271] / [fdo#111827])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl8/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][107] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][108] ([i915#1319] / [i915#2119])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl2/igt@kms_content_protection@atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][110] ([i915#180])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-hsw:          [TIMEOUT][111] ([i915#1958] / [i915#2119]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958] / [i915#2119]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1635]) -> [SKIP][116] ([fdo#109271]) +10 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][117] ([i915#95]) -> [DMESG-WARN][118] ([i915#93] / [i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][119] ([i915#1635] / [i915#95]) -> [DMESG-WARN][120] ([i915#1635] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][121] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][122] ([fdo#108145] / [i915#265])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][123] ([fdo#108145] / [i915#95]) -> [FAIL][124] ([fdo#108145] / [i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-snb:          [SKIP][125] ([fdo#109271]) -> [TIMEOUT][126] ([i915#1958] / [i915#2119]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-snb6/igt@kms_vblank@pipe-d-query-idle-hang.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-snb4/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][127] ([i915#1820]) -> [FAIL][128] ([i915#1820] / [i915#93] / [i915#95])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][129], [FAIL][130], [FAIL][131]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#716]) -> [FAIL][132] ([i915#1635])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl4/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8686/shard-apl3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4723
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8686: 7ac6088487e9ffebed115a6447371087b07b784c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4723: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4723/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
