Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 17:40:09 -0000
Message-ID: <158006040990.5257.3989226171056312246@emeril.freedesktop.org>
References: <20200116135546.14003-1-anna.karas@intel.com>
In-Reply-To: <20200116135546.14003-1-anna.karas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRGlzdGlu?=
 =?utf-8?q?guish_particular_engines_during_calculating_nop_calibration=2E_?=
 =?utf-8?b?KHJldjUp?=
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

Series: Distinguish particular engines during calculating nop calibration. (rev5)
URL   : https://patchwork.freedesktop.org/series/72113/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7809_full -> IGTPW_3989_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html

Known issues
------------

  Here are the changes found in IGTPW_3989_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [PASS][5] -> [INCOMPLETE][6] ([i915#61])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw1/igt@gem_exec_parallel@rcs0-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw6/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +16 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb1/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb6/igt@i915_selftest@mock_requests.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb2/igt@i915_selftest@mock_requests.html
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103927])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl6/igt@i915_selftest@mock_requests.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-apl3/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#72])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#49]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [PASS][23] -> [INCOMPLETE][24] ([i915#140] / [i915#250])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - shard-snb:          [PASS][27] -> [DMESG-WARN][28] ([i915#478])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [fdo#112080]) -> [PASS][36] +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb5/igt@gem_ctx_isolation@vcs1-clean.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_persistence@vecs0-mixed-process:
    - shard-glk:          [FAIL][37] ([i915#679]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk4/igt@gem_ctx_persistence@vecs0-mixed-process.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-glk8/igt@gem_ctx_persistence@vecs0-mixed-process.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][39] ([fdo#110854]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-glk:          [INCOMPLETE][41] ([i915#58] / [k.org#198133]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk9/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-glk7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][47] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-snb:          [DMESG-WARN][49] ([fdo#111870] / [i915#478]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb2/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][53] ([i915#694]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw7/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][55] ([i915#413]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb5/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@mock_requests:
    - shard-tglb:         [INCOMPLETE][57] ([i915#472]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb7/igt@i915_selftest@mock_requests.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-tglb3/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][59] ([i915#79]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-apl8/igt@kms_flip@flip-vs-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-apl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][63] ([i915#478]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [FAIL][65] ([i915#49]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@oa-exponents:
    - shard-glk:          [FAIL][69] ([i915#84]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-glk8/igt@perf@oa-exponents.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-glk6/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][71] ([fdo#112080]) -> [PASS][72] +10 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb6/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][73] ([IGT#28]) -> [SKIP][74] ([fdo#109276] / [fdo#112080])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][75] ([i915#818]) -> [FAIL][76] ([i915#694])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][77] ([i915#694]) -> [FAIL][78] ([i915#818])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw7/igt@gem_tiled_blits@normal.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][79] ([i915#694]) -> [INCOMPLETE][80] ([i915#61])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw5/igt@gen7_exec_parse@basic-allocation.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw7/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [INCOMPLETE][82] ([i915#82])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-snb1/igt@i915_pm_rpm@pm-caching.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-snb1/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][83] ([i915#563]) -> [DMESG-FAIL][84] ([i915#553] / [i915#725])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-hsw2/igt@i915_selftest@live_blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-hsw1/igt@i915_selftest@live_blt.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][85] ([fdo#107724]) -> [SKIP][86] ([fdo#109349])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7809/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5382 -> IGTPW_3989
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3989: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html
  IGT_5382: 8dbe5ce61baa2d563d4dd7c56a018bb1e1077467 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3989/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
