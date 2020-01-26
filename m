Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 04:42:18 -0000
Message-ID: <158001373855.5257.16699819452590262786@emeril.freedesktop.org>
References: <20200124071246.18147-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200124071246.18147-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fcollection=3A_documentation_fix?=
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

Series: lib/igt_collection: documentation fix
URL   : https://patchwork.freedesktop.org/series/72509/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7806_full -> IGTPW_3984_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html

Known issues
------------

  Here are the changes found in IGTPW_3984_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#570])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl1/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl7/igt@gem_ctx_persistence@processes.html
    - shard-iclb:         [PASS][5] -> [FAIL][6] ([i915#570])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb4/igt@gem_ctx_persistence@processes.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb2/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#679])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb4/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb8/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +9 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][15] -> [INCOMPLETE][16] ([fdo#103927] / [i915#970])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
    - shard-iclb:         [PASS][17] -> [INCOMPLETE][18] ([i915#140])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([fdo#103665])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl6/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#644])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-snb:          [PASS][23] -> [DMESG-WARN][24] ([i915#478])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb6/igt@gem_set_tiling_vs_pwrite.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb4/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][25] -> [DMESG-WARN][26] ([fdo#111870] / [i915#478]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb2/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#447])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [PASS][29] -> [FAIL][30] ([i915#413])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-tglb6/igt@i915_pm_rps@reset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-tglb3/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][31] -> [DMESG-FAIL][32] ([i915#553] / [i915#725])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw2/igt@i915_selftest@live_blt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@mock_requests:
    - shard-apl:          [PASS][33] -> [INCOMPLETE][34] ([fdo#103927]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl7/igt@i915_selftest@mock_requests.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl1/igt@i915_selftest@mock_requests.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#71])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#71])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl8/igt@kms_color@pipe-b-legacy-gamma.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl7/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [PASS][45] -> [FAIL][46] ([i915#49]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#112080]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb7/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][53] -> [INCOMPLETE][54] ([i915#61]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw5/igt@perf_pmu@cpu-hotplug.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw6/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +16 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb3/igt@gem_busy@busy-vcs1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-persistence:
    - shard-iclb:         [SKIP][59] ([fdo#109276] / [fdo#112080]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb5/igt@gem_ctx_persistence@vcs1-persistence.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb4/igt@gem_ctx_persistence@vcs1-persistence.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [FAIL][61] ([i915#679]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk3/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk5/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][65] ([fdo#112146]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][67] ([i915#530] / [i915#61]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw7/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-apl:          [INCOMPLETE][69] ([fdo#103927]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl8/igt@gem_persistent_relocs@forked-thrashing.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl7/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-apl2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][73] ([fdo#111870] / [i915#478]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][75] ([i915#454]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@mock_requests:
    - shard-glk:          [INCOMPLETE][77] ([i915#58] / [k.org#198133]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk7/igt@i915_selftest@mock_requests.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk6/igt@i915_selftest@mock_requests.html
    - shard-tglb:         [INCOMPLETE][79] ([i915#472]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-tglb6/igt@i915_selftest@mock_requests.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-tglb3/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][81] ([i915#72]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-glk:          [FAIL][83] ([i915#407]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-glk6/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-glk1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][85] ([i915#478]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [FAIL][87] ([i915#49]) -> [PASS][88] +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - shard-hsw:          [INCOMPLETE][91] ([CI#80] / [i915#61]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw7/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw2/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][93] ([fdo#109276]) -> [PASS][94] +21 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-iclb4/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][95] ([i915#831]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][97] ([i915#61]) -> [INCOMPLETE][98] ([i915#530] / [i915#61])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw5/igt@gem_persistent_relocs@forked-thrashing.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw8/igt@gem_persistent_relocs@forked-thrashing.html
    - shard-kbl:          [INCOMPLETE][99] ([fdo#103665]) -> [INCOMPLETE][100] ([fdo#103665] / [i915#530])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-kbl1/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][101] ([i915#818]) -> [FAIL][102] ([i915#694])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw1/igt@gem_tiled_blits@interruptible.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][103] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][104] ([fdo#111870] / [i915#478])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [INCOMPLETE][106] ([i915#82])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-snb5/igt@i915_pm_rpm@pc8-residency.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-snb1/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_atomic_transition@3x-modeset-transitions:
    - shard-hsw:          [SKIP][107] ([fdo#109271] / [i915#439]) -> [SKIP][108] ([fdo#109271])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7806/shard-hsw5/igt@kms_atomic_transition@3x-modeset-transitions.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/shard-hsw6/igt@kms_atomic_transition@3x-modeset-transitions.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#439]: https://gitlab.freedesktop.org/drm/intel/issues/439
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3984
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7806: 0b551226df5e5b84044705d5fd76571da70f3163 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3984: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3984/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
