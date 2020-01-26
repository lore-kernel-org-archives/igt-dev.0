Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 14:06:55 -0000
Message-ID: <158004761519.5257.11764919268218031225@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjQp?=
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
To: Anna Karas <anna.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Distinguish particular engines during calculating nop calibration. (rev4)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7808_full -> IGTPW_3987_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html

Known issues
------------

  Here are the changes found in IGTPW_3987_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb7/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#140]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb4/igt@gem_exec_suspend@basic-s0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb4/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870] / [i915#478]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb5/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#49]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#331])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-kbl2/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#331])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-apl3/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#112080]) +12 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109276]) +16 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][29] ([fdo#112080]) -> [PASS][30] +10 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb7/igt@gem_busy@busy-vcs1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][31] ([fdo#109276] / [fdo#112080]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb3/igt@gem_ctx_persistence@vcs1-queued.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][33] ([fdo#110841]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][35] ([fdo#110854]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][37] ([i915#677]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][39] ([fdo#112146]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][43] ([fdo#111870] / [i915#478]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-apl6/igt@gem_workarounds@suspend-resume.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-apl2/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][47] ([i915#413]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-tglb2/igt@i915_pm_rps@waitboost.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-tglb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock_requests:
    - shard-glk:          [INCOMPLETE][49] ([i915#58] / [k.org#198133]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-glk7/igt@i915_selftest@mock_requests.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-glk1/igt@i915_selftest@mock_requests.html
    - shard-kbl:          [INCOMPLETE][51] ([fdo#103665]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-kbl4/igt@i915_selftest@mock_requests.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-kbl6/igt@i915_selftest@mock_requests.html
    - shard-hsw:          [INCOMPLETE][53] ([i915#61]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-hsw7/igt@i915_selftest@mock_requests.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-hsw6/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][57] ([i915#96]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][59] ([i915#72]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-tglb:         [FAIL][63] ([i915#49]) -> [PASS][64] +5 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][65] ([fdo#109441]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][67] ([i915#31]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-apl4/igt@kms_setmode@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-apl1/igt@kms_setmode@basic.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [SKIP][69] ([fdo#109276]) -> [PASS][70] +15 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-iclb6/igt@prime_busy@after-bsd2.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-iclb1/igt@prime_busy@after-bsd2.html

  
#### Warnings ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][71] ([i915#444]) -> [INCOMPLETE][72] ([i915#82])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb5/igt@gem_eio@kms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb5/igt@gem_eio@kms.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][73] ([i915#818]) -> [FAIL][74] ([i915#694])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][75] ([i915#694]) -> [FAIL][76] ([i915#818])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-hsw7/igt@gem_tiled_blits@normal.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][77] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][78] ([fdo#111870] / [i915#478])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][80] ([fdo#110789] / [fdo#111870] / [i915#478])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7808/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3987
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7808: 2c0cac4ed28a1f343c5a7c5c3a1c2edb382ab4dd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3987/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
