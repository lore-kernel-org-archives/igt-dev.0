Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Jul 2020 14:55:49 -0000
Message-ID: <159378814998.25591.16195666784444752587@emeril.freedesktop.org>
References: <20200703113102.30142-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200703113102.30142-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test?=
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

Series: Add api_intel_bb test
URL   : https://patchwork.freedesktop.org/series/79089/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8706_full -> IGTPW_4734_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8706_full and IGTPW_4734_full:

### New IGT tests (11) ###

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
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 7 pass(s)
    - Exec time: [2.70, 5.01] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 7 pass(s)
    - Exec time: [2.55, 4.72] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 7 pass(s)
    - Exec time: [2.63, 4.62] s

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

  Here are the changes found in IGTPW_4734_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk1/igt@gem_exec_whisper@basic-contexts-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-glk2/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +34 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@gem_exec_whisper@basic-fds-priority-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#71])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl6/igt@kms_color@pipe-b-legacy-gamma.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_color@pipe-invalid-ctm-matrix-sizes:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw5/igt@kms_color@pipe-invalid-ctm-matrix-sizes.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-hsw6/igt@kms_color@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][9] -> [DMESG-FAIL][10] ([i915#54] / [i915#95]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#165] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#128])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb5/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-tglb7/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#95]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#95]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw6/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-hsw2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb5/igt@kms_vblank@pipe-a-query-forked-hang.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-tglb5/igt@kms_vblank@pipe-a-query-forked-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#1542])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb3/igt@perf@blocking-parameterized.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb2/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@other-read-0:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1635] / [i915#95]) +34 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl7/igt@perf_pmu@other-read-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@perf_pmu@other-read-0.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#62] / [i915#78] / [i915#92])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl3/igt@testdisplay.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl2/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-glk4/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:
    - shard-iclb:         [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb8/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@gem_workarounds@suspend-resume-fd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb4/igt@i915_module_load@reload.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb7/igt@i915_module_load@reload.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][49] ([i915#54] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-hsw1/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - shard-apl:          [DMESG-WARN][53] ([i915#1635] / [i915#95]) -> [PASS][54] +28 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl8/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-iclb:         [FAIL][55] -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb2/igt@kms_fbcon_fbt@fbc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb6/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][57] ([i915#1525]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][59] ([i915#64]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [DMESG-FAIL][61] ([i915#1635] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [TIMEOUT][63] ([i915#1958] / [i915#2119]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@kms_frontbuffer_tracking@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-snb6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence:
    - shard-kbl:          [DMESG-WARN][65] ([i915#93] / [i915#95]) -> [PASS][66] +35 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-farfromfence.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-farfromfence.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][69] ([i915#433]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][71] ([i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_vblank@pipe-a-query-idle-hang:
    - shard-hsw:          [INCOMPLETE][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw1/igt@kms_vblank@pipe-a-query-idle-hang.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-hsw7/igt@kms_vblank@pipe-a-query-idle-hang.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [FAIL][79] ([i915#43]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [FAIL][82] ([i915#1930])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-kbl:          [INCOMPLETE][83] ([i915#1958] / [i915#95]) -> [INCOMPLETE][84] ([i915#1958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl2/igt@gem_exec_reloc@basic-concurrent16.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [DMESG-FAIL][85] ([i915#95]) -> [FAIL][86] ([i915#454])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-apl:          [SKIP][87] ([fdo#109271] / [fdo#111827]) -> [SKIP][88] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-apl:          [SKIP][89] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][90] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl4/igt@kms_color_chamelium@pipe-d-ctm-0-5.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [DMESG-FAIL][91] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][92] ([fdo#110321])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl4/igt@kms_content_protection@srm.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-snb:          [TIMEOUT][93] ([i915#1958] / [i915#2119]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-snb1/igt@kms_flip@2x-flip-vs-rmfb.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-snb4/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][95] ([fdo#109271]) -> [TIMEOUT][96] ([i915#1958] / [i915#2119]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-hsw7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][98] ([fdo#108145] / [i915#1635] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][100] ([fdo#108145] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-apl:          [SKIP][101] ([fdo#109271]) -> [SKIP][102] ([fdo#109271] / [i915#1635]) +12 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl3/igt@kms_vblank@pipe-d-wait-forked.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl7/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [i915#1635]) -> [SKIP][104] ([fdo#109271]) +14 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl6/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][105], [FAIL][106]) ([i915#2102] / [i915#2110]) -> [FAIL][107] ([i915#2110])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-iclb8/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][108], [FAIL][109]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][110] ([i915#1635] / [i915#2110])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl3/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8706/shard-apl1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/shard-apl7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2102]: https://gitlab.freedesktop.org/drm/intel/issues/2102
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5721 -> IGTPW_4734
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8706: 7839b66a1c775fce16da3297056ccee2e81bc4c0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4734: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/index.html
  IGT_5721: df9004c501b203c1b418781ad2c94dfe36892ef5 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4734/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
