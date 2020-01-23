Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 22:59:02 -0000
Message-ID: <157982034241.1145.5716868053518773609@emeril.freedesktop.org>
References: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200122164332.11460-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcore=3A_Detect_gdb_harder?=
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

Series: lib/igt_core: Detect gdb harder
URL   : https://patchwork.freedesktop.org/series/72413/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7796_full -> IGTPW_3970_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html

Known issues
------------

  Here are the changes found in IGTPW_3970_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-tglb:         [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-tglb7/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-tglb7/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +12 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([fdo#103665] / [i915#970])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-hsw:          [PASS][11] -> [INCOMPLETE][12] ([i915#61])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-hsw5/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([i915#472]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-tglb1/igt@i915_selftest@mock_requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-tglb2/igt@i915_selftest@mock_requests.html
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103927])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl2/igt@i915_selftest@mock_requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl7/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([fdo#103665])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl2/igt@i915_selftest@mock_requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl4/igt@i915_selftest@mock_requests.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#49])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl7/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +8 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36] +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_exec_schedule@deep-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb4/igt@gem_exec_schedule@deep-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb3/igt@gem_exec_schedule@deep-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb6/igt@gem_exec_store@cachelines-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb4/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [DMESG-WARN][41] ([i915#478]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-snb2/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-snb1/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [INCOMPLETE][43] ([fdo#103665]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl3/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [INCOMPLETE][45] ([fdo#103927]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [INCOMPLETE][47] ([i915#61]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-hsw7/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-hsw2/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][49] ([i915#644]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][53] ([fdo#111870] / [i915#478]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][57] ([i915#694]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-hsw2/igt@gen7_exec_parse@basic-allocation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][59] ([i915#447]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@mock_requests:
    - shard-glk:          [INCOMPLETE][63] ([i915#58] / [k.org#198133]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-glk6/igt@i915_selftest@mock_requests.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-glk1/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-kbl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [INCOMPLETE][67] ([i915#140]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [FAIL][69] ([i915#49]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-apl3/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-apl1/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +14 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][77] ([IGT#28]) -> [SKIP][78] ([fdo#109276] / [fdo#112080])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][79] ([i915#530] / [i915#61]) -> [INCOMPLETE][80] ([i915#61])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][81] ([i915#694]) -> [FAIL][82] ([i915#818])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7796/shard-hsw2/igt@gem_tiled_blits@normal.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/shard-hsw1/igt@gem_tiled_blits@normal.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3970
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7796: 2d96f6aa93defd19024f701d05c0284034e914e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3970: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3970/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
