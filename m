Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 08:41:38 -0000
Message-ID: <158028729862.5462.9915525481537681800@emeril.freedesktop.org>
References: <20200128081558.26688-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200128081558.26688-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev4=29?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev4)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7828_full -> IGTPW_4012_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html

Known issues
------------

  Here are the changes found in IGTPW_4012_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-kbl7/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb6/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +20 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][15] -> [DMESG-FAIL][16] ([i915#553] / [i915#725])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw2/igt@i915_selftest@live_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#96])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-snb4/igt@kms_properties@plane-properties-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-snb1/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#173])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb7/igt@kms_psr@no_drrs.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb8/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [TIMEOUT][30] ([fdo#112271] / [i915#472])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-tglb2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#112080]) +9 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#831])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][37] ([fdo#110854]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +8 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +15 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][47] ([fdo#111870] / [i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl1/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][51] ([i915#454]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [INCOMPLETE][53] ([fdo#103665] / [fdo#112219]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-kbl3/igt@i915_suspend@forcewake.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_color@pipe-a-ctm-green-to-red:
    - shard-kbl:          [FAIL][55] ([i915#129]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-kbl3/igt@kms_color@pipe-a-ctm-green-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-kbl1/igt@kms_color@pipe-a-ctm-green-to-red.html
    - shard-apl:          [FAIL][57] ([i915#129]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl7/igt@kms_color@pipe-a-ctm-green-to-red.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl7/igt@kms_color@pipe-a-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@busy-flip:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw6/igt@kms_flip@busy-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw7/igt@kms_flip@busy-flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][67] ([i915#31]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-apl2/igt@kms_setmode@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-apl4/igt@kms_setmode@basic.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [FAIL][69] ([i915#914]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw4/igt@prime_mmap_coherency@write.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw2/igt@prime_mmap_coherency@write.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [fdo#112080]) -> [FAIL][72] ([IGT#28]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][73] ([fdo#109276] / [fdo#112080]) -> [SKIP][74] ([fdo#112080]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][75] ([i915#818]) -> [FAIL][76] ([i915#694])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-hsw7/igt@gem_tiled_blits@normal.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][78] ([fdo#110789] / [fdo#111870] / [i915#478])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112219]: https://bugs.freedesktop.org/show_bug.cgi?id=112219
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5390 -> IGTPW_4012
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7828: 0af593e4d6eb72946a292a3cb80516c35c442e50 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4012: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html
  IGT_5390: b5a4fcb43909a7d1f0e9f358ed5b5ba8f3a98482 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
