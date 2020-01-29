Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 22:06:38 -0000
Message-ID: <158033559808.5461.17209822439372325513@emeril.freedesktop.org>
References: <20200128114801.12282-1-petri.latvala@intel.com>
In-Reply-To: <20200128114801.12282-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Make_sure_output_is_still_collected_when_killing_test_due_t?=
 =?utf-8?q?o_taint?=
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

Series: runner: Make sure output is still collected when killing test due to taint
URL   : https://patchwork.freedesktop.org/series/72657/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5394_full -> IGTPW_4016_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4016_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4016_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4016_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@out-order-vebox:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk2/igt@gem_exec_schedule@out-order-vebox.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk1/igt@gem_exec_schedule@out-order-vebox.html

  * igt@i915_selftest@live_active:
    - shard-tglb:         [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-tglb1/igt@i915_selftest@live_active.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-tglb5/igt@i915_selftest@live_active.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb1/igt@kms_frontbuffer_tracking@psr-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12]) -> ([FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19]) ([i915#698])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb6/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb5/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb6/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb4/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb2/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb1/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb5/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb6/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb4/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb6/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb2/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb1/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb4/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4016_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112080]) +13 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb1/igt@gem_busy@busy-vcs1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][22] -> [FAIL][23] ([i915#694])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw6/igt@gem_caching@reads.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-hsw1/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-kbl:          [PASS][24] -> [SKIP][25] ([fdo#109271] / [fdo#112080])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl6/igt@gem_ctx_isolation@vcs1-reset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl6/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109276] / [fdo#112080])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#110841])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@throttle:
    - shard-kbl:          [PASS][30] -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl3/igt@gem_eio@throttle.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl6/igt@gem_eio@throttle.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([fdo#112141])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl1/igt@gem_exec_balancer@full-pulse.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl6/igt@gem_exec_balancer@full-pulse.html
    - shard-glk:          [PASS][34] -> [FAIL][35] ([fdo#112141])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk9/igt@gem_exec_balancer@full-pulse.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk1/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([i915#677])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109276]) +16 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#112146]) +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@gem_exec_schedule@wide-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb2/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][42] -> [FAIL][43] ([i915#644])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [PASS][44] -> [FAIL][45] ([i915#644])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-iclb:         [PASS][46] -> [FAIL][47] ([i915#370])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb5/igt@i915_pm_rps@min-max-config-loaded.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb7/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][48] -> [FAIL][49] ([i915#413])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb3/igt@i915_pm_rps@reset.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#117] / [i915#133])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][52] -> [INCOMPLETE][53] ([i915#61])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-hsw5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-snb:          [PASS][54] -> [DMESG-WARN][55] ([i915#478])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][58] -> [SKIP][59] ([fdo#109441]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-query-forked-hang:
    - shard-glk:          [PASS][62] -> [SKIP][63] ([fdo#109271]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk4/igt@kms_vblank@pipe-b-query-forked-hang.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk1/igt@kms_vblank@pipe-b-query-forked-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][64] ([fdo#109276] / [fdo#112080]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][66] ([fdo#110854]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][68] ([fdo#112080]) -> [PASS][69] +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][70] ([fdo#112146]) -> [PASS][71] +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_pwrite@big-cpu-fbr:
    - shard-glk:          [INCOMPLETE][72] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk3/igt@gem_pwrite@big-cpu-fbr.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk9/igt@gem_pwrite@big-cpu-fbr.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][74] ([fdo#111870] / [i915#478]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@i2c:
    - shard-glk:          [FAIL][76] ([i915#68]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk9/igt@i915_pm_rpm@i2c.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk4/igt@i915_pm_rpm@i2c.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][78] ([i915#54]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][80] ([i915#54]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][82] ([i915#96]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [DMESG-WARN][84] ([i915#478]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [FAIL][86] ([i915#49]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-apl:          [FAIL][88] ([i915#49]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][90] ([i915#49]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-kbl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][98] ([i915#31]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-apl2/igt@kms_setmode@basic.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-apl4/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][100] ([fdo#109276]) -> [PASS][101] +17 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][102] ([fdo#109276] / [fdo#112080]) -> [FAIL][103] ([IGT#28])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][104] ([IGT#28]) -> [SKIP][105] ([fdo#109276] / [fdo#112080])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@in-flight-1us:
    - shard-kbl:          [TIMEOUT][106] ([fdo#112271]) -> [SKIP][107] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@gem_eio@in-flight-1us.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl6/igt@gem_eio@in-flight-1us.html
    - shard-glk:          [TIMEOUT][108] ([fdo#112271]) -> [SKIP][109] ([fdo#109271])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-glk8/igt@gem_eio@in-flight-1us.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-glk1/igt@gem_eio@in-flight-1us.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-kbl:          [INCOMPLETE][110] ([CI#80] / [fdo#103665]) -> [TIMEOUT][111] ([fdo#112271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-kbl7/igt@gem_eio@in-flight-contexts-1us.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-kbl7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][112] ([i915#818]) -> [FAIL][113] ([i915#694])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][114] ([i915#694]) -> [FAIL][115] ([i915#818])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-hsw4/igt@gem_tiled_blits@normal.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][116] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][117] ([fdo#111870] / [i915#478])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5394/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112141]: https://bugs.freedesktop.org/show_bug.cgi?id=112141
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1074]: https://gitlab.freedesktop.org/drm/intel/issues/1074
  [i915#117]: https://gitlab.freedesktop.org/drm/intel/issues/117
  [i915#133]: https://gitlab.freedesktop.org/drm/intel/issues/133
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#370]: https://gitlab.freedesktop.org/drm/intel/issues/370
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#68]: https://gitlab.freedesktop.org/drm/intel/issues/68
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5394 -> IGTPW_4016

  CI-20190529: 20190529
  CI_DRM_7831: c40c8f70d19e5b27cffb4bb4609b1bc76fd1a58a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4016: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/index.html
  IGT_5394: 991fd07bcd7add7a5beca2c95b72a994e62fbb75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4016/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
