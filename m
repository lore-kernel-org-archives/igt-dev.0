Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 14:35:46 -0000
Message-ID: <159300934657.19236.1151995234368723253@emeril.freedesktop.org>
References: <20200624105448.26583-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200624105448.26583-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev5=29?=
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

Series: Add api_intel_bb test (rev5)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8661_full -> IGTPW_4701_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8661_full and IGTPW_4701_full:

### New IGT tests (8) ###

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

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 7 pass(s)
    - Exec time: [0.06, 0.20] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 2 dmesg-warn(s) 5 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4701_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk6/igt@gem_exec_create@madvise.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-glk9/igt@gem_exec_create@madvise.html

  * igt@gem_render_linear_blits@basic:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw5/igt@gem_render_linear_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw2/igt@gem_render_linear_blits@basic.html
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb4/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-snb5/igt@gem_render_linear_blits@basic.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +36 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl3/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-kbl:          [PASS][13] -> [DMESG-FAIL][14] ([i915#95]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl4/igt@kms_color@pipe-a-ctm-green-to-red.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl4/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#95]) +33 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-sliding.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#2055])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#83])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#83])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-iclb8/igt@kms_panel_fitting@atomic-fastset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-iclb3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#402]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb7/igt@kms_psr@psr2_basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb1/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl3/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([IGT#2])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl7/igt@kms_sysfs_edid_timing.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl2/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([IGT#2])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl4/igt@kms_sysfs_edid_timing.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-b-query-busy:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb2/igt@kms_vblank@pipe-b-query-busy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb8/igt@kms_vblank@pipe-b-query-busy.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][37] -> [FAIL][38] ([i915#1542])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb8/igt@perf@polling-parameterized.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb3/igt@perf@polling-parameterized.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#1732])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl2/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         [DMESG-WARN][45] ([i915#402]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb1/igt@gem_userptr_blits@access-control.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb6/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw8/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][49] ([i915#1904]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][51] ([i915#118] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +39 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][55] ([i915#54] / [i915#95]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-hsw:          [INCOMPLETE][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge:
    - shard-apl:          [TIMEOUT][59] ([i915#1635] / [i915#1958]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl8/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-left-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-apl:          [FAIL][61] ([IGT#5]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-apl:          [DMESG-FAIL][65] ([i915#1635] / [i915#95]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][69] ([i915#1958]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb2/igt@kms_invalid_dotclock.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-snb6/igt@kms_invalid_dotclock.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-apl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl3/igt@kms_vblank@pipe-c-accuracy-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl8/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@perf@low-oa-exponent-permissions:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#95]) -> [PASS][74] +30 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl4/igt@perf@low-oa-exponent-permissions.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl1/igt@perf@low-oa-exponent-permissions.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-apl:          [TIMEOUT][75] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][76] ([i915#1635] / [i915#1958])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][77] ([i915#1958]) -> [SKIP][78] ([fdo#109271]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-hsw:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-hsw5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-hsw2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [TIMEOUT][82] ([i915#1958])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-snb5/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][83] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-apl:          [SKIP][85] ([fdo#109271]) -> [SKIP][86] ([fdo#109271] / [i915#1635]) +20 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][87] ([i915#1958]) -> [SKIP][88] ([fdo#109271]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [DMESG-WARN][90] ([i915#180] / [i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#93] / [i915#95]) -> [DMESG-WARN][92] ([i915#180] / [i915#93] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [i915#1635]) -> [SKIP][94] ([fdo#109271]) +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8661/shard-apl6/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4701
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8661: 64cab0b9f9bfeb14d3ec2452d76b56915cdeb09f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4701: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4701/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
