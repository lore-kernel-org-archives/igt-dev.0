Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jan 2020 18:49:57 -0000
Message-ID: <157920059757.12911.17701410665187730104@emeril.freedesktop.org>
References: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200114142523.10603-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/7=5D_tests/kms=5Fvrr=3A_Fix_compile?=
 =?utf-8?q?r_warn_on_32bit?=
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
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/7] tests/kms_vrr: Fix compiler warn on 32bit
URL   : https://patchwork.freedesktop.org/series/72008/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7739_full -> IGTPW_3923_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/index.html

Known issues
------------

  Here are the changes found in IGTPW_3923_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#470]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb1/igt@gem_eio@reset-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb8/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110854])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb6/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([fdo#111736] / [i915#472])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb7/igt@gem_exec_create@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb7/igt@gem_exec_create@basic.html

  * igt@gem_exec_reuse@single:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#472])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb4/igt@gem_exec_reuse@single.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb2/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +20 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-render:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111677] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-render.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#470] / [i915#472]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb5/igt@gem_exec_schedule@smoketest-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb6/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#112146]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#49]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#576])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb2/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb5/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-glk:          [PASS][37] -> [INCOMPLETE][38] ([i915#58] / [k.org#198133])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-glk8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][39] -> [DMESG-WARN][40] ([fdo#111764])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#112080]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb8/igt@gem_ctx_isolation@vcs1-none.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_eio@in-flight-1us:
    - shard-tglb:         [INCOMPLETE][45] ([i915#534] / [i915#707]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb6/igt@gem_eio@in-flight-1us.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb4/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb8/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][49] ([fdo#108838] / [i915#472]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb8/igt@gem_exec_create@forked.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb2/igt@gem_exec_create@forked.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][51] ([fdo#112080]) -> [PASS][52] +9 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-render:
    - shard-tglb:         [INCOMPLETE][55] ([fdo#111606] / [fdo#111677] / [i915#472]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb8/igt@gem_exec_schedule@preempt-queue-contexts-render.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb5/igt@gem_exec_schedule@preempt-queue-contexts-render.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [TIMEOUT][57] ([fdo#112271] / [i915#530]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][59] ([i915#707] / [i915#796]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb3/igt@gem_pipe_control_store_loop@reused-buffer.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb5/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][63] ([fdo#111870]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-hsw7/igt@gen7_exec_parse@basic-offset.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][67] ([i915#447]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][69] ([i915#413]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb8/igt@i915_pm_rps@waitboost.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][73] ([i915#72]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][75] ([i915#79]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [FAIL][77] ([i915#49]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@pixel-format-pipe-c-planes-source-clamping:
    - shard-iclb:         [FAIL][79] ([i915#576]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb4/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb6/igt@kms_plane@pixel-format-pipe-c-planes-source-clamping.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +10 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@enable-race-vecs0:
    - shard-tglb:         [INCOMPLETE][85] ([i915#470] / [i915#472]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb3/igt@perf_pmu@enable-race-vecs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb8/igt@perf_pmu@enable-race-vecs0.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][87] ([fdo#109276]) -> [PASS][88] +17 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][89] ([fdo#109276] / [fdo#112080]) -> [FAIL][90] ([IGT#28])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][91] ([fdo#111870]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][93] ([i915#468]) -> [FAIL][94] ([i915#454])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-tglb4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@i2c:
    - shard-snb:          [INCOMPLETE][95] ([i915#82]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-snb2/igt@i915_pm_rpm@i2c.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-snb4/igt@i915_pm_rpm@i2c.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][97] ([fdo#109349]) -> [DMESG-WARN][98] ([fdo#107724])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [INCOMPLETE][99] ([fdo#103927]) -> [DMESG-WARN][100] ([i915#180])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][101] ([fdo#103665]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][103] ([fdo#111093]) -> ([FAIL][104], [FAIL][105], [FAIL][106]) ([fdo#111093] / [i915#209])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7739/shard-iclb6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb4/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb6/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/shard-iclb3/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#209]: https://gitlab.freedesktop.org/drm/intel/issues/209
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#534]: https://gitlab.freedesktop.org/drm/intel/issues/534
  [i915#576]: https://gitlab.freedesktop.org/drm/intel/issues/576
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5365 -> IGTPW_3923
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7739: 757c25a357ea6e34d5eba9b6efee6f45e7961334 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3923: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/index.html
  IGT_5365: e9ec0ed63b25c86861ffac3c8601cc4d1b910b65 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3923/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
