Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 16:28:19 -0000
Message-ID: <157979689982.1144.5151898192155522252@emeril.freedesktop.org>
References: <20200122110548.22838-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200122110548.22838-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcollection=3A_Adding_combinatorics_facility_=28rev4=29?=
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

Series: lib/igt_collection: Adding combinatorics facility (rev4)
URL   : https://patchwork.freedesktop.org/series/72276/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7789_full -> IGTPW_3966_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/index.html

Known issues
------------

  Here are the changes found in IGTPW_3966_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +10 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-persistence:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_ctx_persistence@vcs1-persistence.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb3/igt@gem_ctx_persistence@vcs1-persistence.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110854])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb2/igt@gem_exec_balancer@smoke.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb8/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb4/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#61])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103665]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#874])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw8/igt@gem_pipe_control_store_loop@reused-buffer.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw2/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#694])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw6/igt@gem_tiled_blits@normal.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([fdo#111870] / [i915#478]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-apl6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#96])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#57])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw8/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109276]) +19 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][41] ([fdo#109276] / [fdo#112080]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@in-flight-1us:
    - shard-snb:          [FAIL][43] ([i915#490]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb6/igt@gem_eio@in-flight-1us.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb2/igt@gem_eio@in-flight-1us.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][45] ([i915#140]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb1/igt@gem_exec_balancer@hang.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +13 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][53] ([i915#478]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb4/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-iclb:         [FAIL][55] ([i915#520]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][57] ([i915#61]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw1/igt@gem_persistent_relocs@forked-thrashing.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw8/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][61] ([fdo#111870] / [i915#478]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][63] ([i915#694]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw7/igt@gen7_exec_parse@basic-offset.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][65] ([i915#454]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][67] ([i915#82]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb6/igt@i915_selftest@mock_requests.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb6/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [INCOMPLETE][69] ([fdo#103665]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl6/igt@i915_selftest@mock_requests.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-kbl2/igt@i915_selftest@mock_requests.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b:
    - shard-hsw:          [DMESG-WARN][71] ([i915#44]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw5/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw2/igt@kms_busy@extended-modeset-hang-newfb-with-reset-render-pipe-b.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-hsw2/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-hsw7/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][79] ([fdo#109276] / [fdo#112080]) -> [FAIL][80] ([IGT#28])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][81] ([IGT#28]) -> [SKIP][82] ([fdo#109276] / [fdo#112080])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_eio@kms:
    - shard-snb:          [FAIL][83] ([i915#436]) -> [INCOMPLETE][84] ([i915#82])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/shard-snb1/igt@gem_eio@kms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/shard-snb1/igt@gem_eio@kms.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3966
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7789: ad538420f468637d707bae774a858da3592d823f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3966/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
