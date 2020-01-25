Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 25 Jan 2020 08:25:03 -0000
Message-ID: <157994070389.29036.9066334502573802680@emeril.freedesktop.org>
References: <20200123190029.19882-1-jose.souza@intel.com>
In-Reply-To: <20200123190029.19882-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Print_the_SU_blocks_mismatches?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_psr2_su: Print the SU blocks mismatches
URL   : https://patchwork.freedesktop.org/series/72493/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7804_full -> IGTPW_3982_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html

Known issues
------------

  Here are the changes found in IGTPW_3982_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +16 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-cleanup:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb4/igt@gem_ctx_persistence@vcs1-cleanup.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb7/igt@gem_ctx_persistence@vcs1-cleanup.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@kms:
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#82])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-snb1/igt@gem_eio@kms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-snb1/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          [PASS][9] -> [FAIL][10] ([i915#232])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-snb5/igt@gem_eio@unwedge-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-snb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +16 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#61])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw2/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw5/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#818])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw1/igt@gem_tiled_blits@normal.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870] / [i915#478]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([fdo#103665])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-kbl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#413])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb8/igt@i915_pm_rps@reset.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#140])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb7/igt@i915_selftest@mock_requests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb7/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#72])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][33] -> [FAIL][34] ([i915#49]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [PASS][37] -> [SKIP][38] ([i915#668]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([fdo#103375]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109642] / [fdo#111068])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#173])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb6/igt@kms_psr@no_drrs.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl4/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl7/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [FAIL][47] ([i915#679]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-glk3/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-glk9/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [fdo#112080]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb6/igt@gem_ctx_persistence@vcs1-queued.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-tglb:         [FAIL][51] ([i915#679]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-tglb5/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-tglb4/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][53] ([fdo#110854]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb3/igt@gem_exec_balancer@smoke.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][57] ([i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +14 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb3/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [INCOMPLETE][63] ([i915#140]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb4/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb8/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][65] ([i915#530] / [i915#61]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-glk:          [INCOMPLETE][67] ([i915#58] / [k.org#198133]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-glk7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-glk4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][69] ([i915#644]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][71] ([i915#818]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw6/igt@gem_tiled_blits@interruptible.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][73] ([i915#770]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw8/igt@i915_selftest@live_blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw5/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][75] ([i915#472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-tglb4/igt@i915_selftest@mock_requests.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-tglb8/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [INCOMPLETE][77] ([fdo#103665]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-kbl7/igt@i915_selftest@mock_requests.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-kbl6/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][81] ([i915#72]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][85] ([i915#478]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][87] ([i915#49]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][91] ([fdo#109276] / [fdo#112080]) -> [FAIL][92] ([IGT#28])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [INCOMPLETE][93] ([fdo#103927] / [i915#970]) -> [INCOMPLETE][94] ([fdo#103927] / [i915#530] / [i915#970])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-apl4/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@kms_atomic_transition@3x-modeset-transitions:
    - shard-hsw:          [SKIP][95] ([fdo#109271] / [i915#439]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7804/shard-hsw2/igt@kms_atomic_transition@3x-modeset-transitions.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/shard-hsw7/igt@kms_atomic_transition@3x-modeset-transitions.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#439]: https://gitlab.freedesktop.org/drm/intel/issues/439
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#970]: https://gitlab.freedesktop.org/drm/intel/issues/970
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3982
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7804: 74ed9d57007ab848a57ec6d785de4187b70acd9b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3982: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3982/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
