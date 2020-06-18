Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Jun 2020 14:22:53 -0000
Message-ID: <159249017355.22462.7445400750575238321@emeril.freedesktop.org>
References: <20200618120623.6853-1-petri.latvala@intel.com>
In-Reply-To: <20200618120623.6853-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Inject_a_message_whe?=
 =?utf-8?q?n_killing_test_to_taints?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] runner: Inject a message when killing test to taints
URL   : https://patchwork.freedesktop.org/series/78526/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8641_full -> IGTPW_4683_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4683_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4683_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4683_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw6/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-hsw2/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4683_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_create@forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk1/igt@gem_exec_create@forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk5/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@implicit-read-write@bcs0:
    - shard-snb:          [PASS][5] -> [INCOMPLETE][6] ([i915#82])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb4/igt@gem_exec_schedule@implicit-read-write@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb2/igt@gem_exec_schedule@implicit-read-write@bcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
    - shard-snb:          [PASS][9] -> [DMESG-WARN][10] ([i915#42])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb5/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw8/igt@gem_shrink@reclaim.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-hsw7/igt@gem_shrink@reclaim.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1149] / [i915#402])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb7/igt@kms_color@pipe-a-ctm-red-to-blue.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb3/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#54] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#95]) +41 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#93] / [i915#95]) +50 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl1/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#402]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb1/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-iclb7/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl1/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl1/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][37] ([i915#1930]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [INCOMPLETE][39] ([i915#82]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb1/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk5/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-snb:          [TIMEOUT][43] ([i915#1958]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb1/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb4/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1602] / [i915#456]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb3/igt@i915_suspend@debugfs-reader.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb6/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - shard-hsw:          [TIMEOUT][47] ([i915#1958]) -> [PASS][48] +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw4/igt@kms_addfb_basic@bad-pitch-128.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-hsw4/igt@kms_addfb_basic@bad-pitch-128.html

  * {igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a}:
    - shard-glk:          [INCOMPLETE][49] ([i915#58] / [k.org#198133]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk8/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk2/igt@kms_atomic_transition@plane-all-transition@hdmi-a-1-pipe-a.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +39 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +9 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-dp1:
    - shard-kbl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate@a-dp1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-apl:          [DMESG-WARN][59] ([i915#95]) -> [PASS][60] +35 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl6/igt@kms_flip_tiling@flip-x-tiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl2/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][65] ([fdo#108145] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][67] ([fdo#108145] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb3/igt@kms_psr@psr2_sprite_plane_onoff.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][71] ([i915#1820] / [i915#93] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl2/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][73] ([i915#1899]) -> [FAIL][74] ([i915#454])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [SKIP][75] ([i915#468]) -> [FAIL][76] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-hsw:          [SKIP][77] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][78] ([i915#1958])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
    - shard-snb:          [SKIP][79] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][80] ([i915#1958])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb4/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][81] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][82] ([fdo#110321] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl2/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][83] ([fdo#110321]) -> [DMESG-FAIL][84] ([fdo#110321] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl4/igt@kms_content_protection@lic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-hsw:          [SKIP][85] ([fdo#109271]) -> [TIMEOUT][86] ([i915#1958]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-hsw2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-hsw6/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [DMESG-FAIL][87] ([i915#49] / [i915#95]) -> [DMESG-WARN][88] ([i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [FAIL][89] ([i915#49]) -> [DMESG-WARN][90] ([i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][93] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][94] ([fdo#108145] / [i915#95]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][95] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][96] ([fdo#108145] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          [DMESG-FAIL][97] ([i915#95]) -> [FAIL][98] ([i915#265])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#93] / [i915#95]) -> [DMESG-WARN][100] ([i915#180]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8641/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5712 -> IGTPW_4683
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8641: aac91f91c7be78f53b352237d968dfa1996b2d4b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4683: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/index.html
  IGT_5712: eba1135ddd35f9d3097ed91032aefe8f9a9f9d02 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4683/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
