Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Feb 2020 14:08:49 -0000
Message-ID: <158134372912.3100.4784366359236149231@emeril.freedesktop.org>
References: <20200207125941.22974-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200207125941.22974-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX2N0?=
 =?utf-8?q?x=5Fcreate=3AAdjusted_test_to_use_=5F=5Ffor=5Feach=5Fphysical?=
 =?utf-8?q?=5Fengine_to_utilize_all_available_engines_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: gem_ctx_create:Adjusted test to use __for_each_physical_engine to utilize all available engines (rev3)
URL   : https://patchwork.freedesktop.org/series/72889/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5425_full -> IGTPW_4112_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4112_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4112_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4112_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-tglb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb1/igt@kms_color@pipe-a-legacy-gamma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb2/igt@kms_color@pipe-a-legacy-gamma.html

  
Known issues
------------

  Here are the changes found in IGTPW_4112_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@read-writes:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw6/igt@gem_caching@read-writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-hsw6/igt@gem_caching@read-writes.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110854])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb7/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +7 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +15 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#716])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk1/igt@gen9_exec_parse@allowed-single.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-glk9/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#454])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#189])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@i915_pm_rpm@system-suspend-modeset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb8/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#129])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-apl1/igt@kms_color@pipe-b-ctm-green-to-red.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-apl3/igt@kms_color@pipe-b-ctm-green-to-red.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#129])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@kms_color@pipe-b-ctm-green-to-red.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-kbl3/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([fdo#111703])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#70])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb8/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-tglb:         [PASS][33] -> [DMESG-FAIL][34] ([i915#402])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#668]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#1184])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][43] -> [FAIL][44] ([i915#899])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][45] -> [FAIL][46] ([i915#173])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb8/igt@kms_psr@no_drrs.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#110841]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-vebox:
    - shard-glk:          [FAIL][53] ([i915#859]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-glk9/igt@gem_exec_schedule@pi-distinct-iova-vebox.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-glk3/igt@gem_exec_schedule@pi-distinct-iova-vebox.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [DMESG-WARN][59] ([i915#402]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb5/igt@i915_pm_dc@dc5-psr.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb3/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][61] ([i915#413]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-kbl:          [TIMEOUT][63] ([fdo#112271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl3/igt@i915_selftest@live_gtt.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-kbl3/igt@i915_selftest@live_gtt.html
    - shard-apl:          [TIMEOUT][65] ([fdo#112271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-apl3/igt@i915_selftest@live_gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-apl2/igt@i915_selftest@live_gtt.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-tglb:         [DMESG-FAIL][67] ([i915#402]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-tglb:         [FAIL][69] ([fdo#111703]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - shard-tglb:         [FAIL][71] ([i915#559]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-hsw:          [DMESG-WARN][73] ([i915#44]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-hsw5/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-hsw2/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-tglb:         [FAIL][77] ([i915#1183]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-tglb:         [FAIL][79] ([i915#1171]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb5/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-tglb:         [FAIL][81] ([i915#1184]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb2/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-tglb:         [FAIL][83] ([i915#1139]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         [FAIL][85] ([i915#899]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-tglb6/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb3/igt@kms_psr@psr2_suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][89] ([fdo#103665]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-wait-forked:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb2/igt@kms_vblank@pipe-b-wait-forked.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-snb5/igt@kms_vblank@pipe-b-wait-forked.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][93] ([fdo#109276]) -> [PASS][94] +9 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb6/igt@prime_busy@hang-bsd2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][95] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][96] ([fdo#110789] / [fdo#111870] / [i915#478])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][97] ([fdo#107724]) -> [SKIP][98] ([fdo#109349])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5425/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1139]: https://gitlab.freedesktop.org/drm/intel/issues/1139
  [i915#1171]: https://gitlab.freedesktop.org/drm/intel/issues/1171
  [i915#1183]: https://gitlab.freedesktop.org/drm/intel/issues/1183
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5425 -> IGTPW_4112

  CI-20190529: 20190529
  CI_DRM_7885: fc2806bc441bfc6b44cf4713f3c6b820d73c3534 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4112: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html
  IGT_5425: ad4542ef1adbaa1227bc9ba9e24bb0e0f6dd408d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4112/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
