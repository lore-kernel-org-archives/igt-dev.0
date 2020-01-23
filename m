Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 16:20:30 -0000
Message-ID: <157979643061.1144.18256476130332921558@emeril.freedesktop.org>
References: <20200122104710.10971-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200122104710.10971-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev2=29?=
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

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev2)
URL   : https://patchwork.freedesktop.org/series/72334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7789_full -> IGTPW_3965_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html

Known issues
------------

  Here are the changes found in IGTPW_3965_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +13 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb8/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb1/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-snb:          [PASS][7] -> [DMESG-WARN][8] ([i915#478])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb6/igt@gem_exec_reloc@basic-cpu-gtt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-snb4/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +6 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#140] / [i915#530])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103927]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-glk:          [PASS][17] -> [INCOMPLETE][18] ([i915#58] / [k.org#198133])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-glk4/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-glk5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#874])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw8/igt@gem_pipe_control_store_loop@reused-buffer.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw2/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#644])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][23] -> [FAIL][24] ([i915#694])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw6/igt@gem_tiled_blits@normal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#413])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb1/igt@i915_pm_rps@waitboost.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][29] -> [DMESG-FAIL][30] ([i915#553])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw1/igt@i915_selftest@live_blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#140]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb5/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +22 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb6/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#61]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [fdo#112080]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_eio@in-flight-1us:
    - shard-snb:          [FAIL][43] ([i915#490]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb6/igt@gem_eio@in-flight-1us.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-snb5/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][45] ([i915#140]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb1/igt@gem_exec_balancer@hang.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][49] ([i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +17 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][55] ([i915#478]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-snb1/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw1/igt@gem_persistent_relocs@forked-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][59] ([i915#694]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw7/igt@gen7_exec_parse@basic-offset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw7/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][63] ([i915#82]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb6/igt@i915_selftest@mock_requests.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-snb4/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [INCOMPLETE][65] ([fdo#103665]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl6/igt@i915_selftest@mock_requests.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-kbl3/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-apl8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b:
    - shard-hsw:          [DMESG-WARN][69] ([i915#44]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw5/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw1/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-hsw:          [SKIP][71] ([fdo#109271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-hsw8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][75] ([IGT#28]) -> [SKIP][76] ([fdo#109276] / [fdo#112080])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3965
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7789: ad538420f468637d707bae774a858da3592d823f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3965: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
