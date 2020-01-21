Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 05:09:27 -0000
Message-ID: <157958336721.11478.16199810162704531229@emeril.freedesktop.org>
References: <20200120101817.5273-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200120101817.5273-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev2=29?=
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

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev2)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7777_full -> IGTPW_3949_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3949_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_persistence@legacy-vcs2-mixed} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb4/igt@gem_ctx_persistence@legacy-vcs2-mixed.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7777_full and IGTPW_3949_full:

### New IGT tests (42) ###

  * igt@gem_ctx_persistence@legacy-bcs0-cleanup:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-bcs0-hostile:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-bcs0-hostile-preempt:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@gem_ctx_persistence@legacy-bcs0-mixed:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-bcs0-mixed-process:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.26] s

  * igt@gem_ctx_persistence@legacy-bcs0-persistence:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@gem_ctx_persistence@legacy-bcs0-queued:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@gem_ctx_persistence@legacy-rcs0-cleanup:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-rcs0-hostile:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-rcs0-hostile-preempt:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@gem_ctx_persistence@legacy-rcs0-mixed:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-rcs0-mixed-process:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@gem_ctx_persistence@legacy-rcs0-persistence:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@gem_ctx_persistence@legacy-rcs0-queued:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gem_ctx_persistence@legacy-vcs0-cleanup:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-vcs0-hostile:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-vcs0-hostile-preempt:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.72] s

  * igt@gem_ctx_persistence@legacy-vcs0-mixed:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-vcs0-mixed-process:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.27] s

  * igt@gem_ctx_persistence@legacy-vcs0-persistence:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@gem_ctx_persistence@legacy-vcs0-queued:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_ctx_persistence@legacy-vcs1-cleanup:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_ctx_persistence@legacy-vcs1-hostile:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-vcs1-hostile-preempt:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@gem_ctx_persistence@legacy-vcs1-mixed:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-vcs1-mixed-process:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.25] s

  * igt@gem_ctx_persistence@legacy-vcs1-persistence:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 1.08] s

  * igt@gem_ctx_persistence@legacy-vcs1-queued:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.05] s

  * igt@gem_ctx_persistence@legacy-vcs2-cleanup:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-hostile:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-hostile-preempt:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-mixed:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-mixed-process:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-persistence:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vcs2-queued:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_persistence@legacy-vecs0-cleanup:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_ctx_persistence@legacy-vecs0-hostile:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@gem_ctx_persistence@legacy-vecs0-hostile-preempt:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@gem_ctx_persistence@legacy-vecs0-mixed:
    - Statuses : 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@gem_ctx_persistence@legacy-vecs0-mixed-process:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.28] s

  * igt@gem_ctx_persistence@legacy-vecs0-persistence:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.07] s

  * igt@gem_ctx_persistence@legacy-vecs0-queued:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.07] s

  

Known issues
------------

  Here are the changes found in IGTPW_3949_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +16 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [fdo#112080])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb4/igt@gem_ctx_isolation@vcs1-none.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb7/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#110854])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#112146]) +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([fdo#111677] / [i915#472])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb5/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([i915#463] / [i915#472])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb1/igt@gem_exec_schedule@smoketest-bsd1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [PASS][14] -> [INCOMPLETE][15] ([i915#472] / [i915#707])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb8/igt@gem_exec_schedule@smoketest-vebox.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb3/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_exec_suspend@basic:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([i915#460] / [i915#472])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb1/igt@gem_exec_suspend@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb3/igt@gem_exec_suspend@basic.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-glk:          [PASS][18] -> [TIMEOUT][19] ([fdo#112271] / [i915#530])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-glk3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-glk5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-apl:          [PASS][20] -> [TIMEOUT][21] ([fdo#112271] / [i915#530])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [PASS][22] -> [TIMEOUT][23] ([fdo#112271] / [i915#530]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-hsw:          [PASS][24] -> [INCOMPLETE][25] ([i915#530] / [i915#61])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw5/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw1/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][26] -> [INCOMPLETE][27] ([fdo#103665] / [i915#530])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#874])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw8/igt@gem_pipe_control_store_loop@reused-buffer.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw5/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#447])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@mock_requests:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#61])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw5/igt@i915_selftest@mock_requests.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw6/igt@i915_selftest@mock_requests.html
    - shard-iclb:         [PASS][34] -> [INCOMPLETE][35] ([i915#140])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb2/igt@i915_selftest@mock_requests.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb6/igt@i915_selftest@mock_requests.html

  * igt@kms_color@pipe-a-degamma:
    - shard-tglb:         [PASS][36] -> [FAIL][37] ([i915#71])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb5/igt@kms_color@pipe-a-degamma.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb3/igt@kms_color@pipe-a-degamma.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#46])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-modeset-interruptible:
    - shard-hsw:          [PASS][40] -> [DMESG-WARN][41] ([i915#44])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw6/igt@kms_flip@flip-vs-modeset-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw5/igt@kms_flip@flip-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#49])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-tglb:         [PASS][46] -> [FAIL][47] ([i915#49]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#109441]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109276]) +17 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][54] ([i915#472] / [i915#977]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb3/igt@gem_busy@close-race.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb7/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [SKIP][56] ([fdo#109276] / [fdo#112080]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb8/igt@gem_ctx_isolation@vcs1-clean.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [INCOMPLETE][58] ([fdo#111735] / [i915#472]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb7/igt@gem_ctx_shared@q-smoketest-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb8/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_shared@q-smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][60] ([i915#461] / [i915#472]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb3/igt@gem_ctx_shared@q-smoketest-bsd2.html

  * igt@gem_exec_create@forked:
    - shard-tglb:         [INCOMPLETE][62] ([fdo#108838] / [i915#472]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb1/igt@gem_exec_create@forked.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb1/igt@gem_exec_create@forked.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +18 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][66] ([i915#677]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb1/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][68] ([fdo#112146]) -> [PASS][69] +4 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][70] ([i915#463] / [i915#472]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb2/igt@gem_exec_schedule@smoketest-all.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb7/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_schedule@smoketest-bsd2:
    - shard-tglb:         [INCOMPLETE][72] ([i915#472] / [i915#707]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb4/igt@gem_exec_schedule@smoketest-bsd2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb8/igt@gem_exec_schedule@smoketest-bsd2.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-hsw:          [INCOMPLETE][76] ([i915#530] / [i915#61]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw5/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
    - shard-kbl:          [INCOMPLETE][78] ([fdo#103665] / [i915#530]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl7/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-tglb:         [TIMEOUT][80] ([fdo#112126] / [fdo#112271] / [i915#530]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb8/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][82] ([i915#644]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [INCOMPLETE][84] ([i915#470] / [i915#472]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb3/igt@gem_sync@basic-all.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb5/igt@gem_sync@basic-all.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][86] ([i915#694]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw4/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][88] ([fdo#111870] / [i915#478]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [INCOMPLETE][90] ([fdo#103665] / [i915#151]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [DMESG-WARN][92] ([fdo#111764]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb3/igt@i915_pm_rpm@system-suspend-execbuf.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][94] ([i915#82]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-snb2/igt@i915_selftest@mock_requests.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-snb4/igt@i915_selftest@mock_requests.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][96] ([i915#180]) -> [PASS][97] +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [FAIL][98] ([i915#49]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][100] ([fdo#109441]) -> [PASS][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][102] ([fdo#112080]) -> [PASS][103] +8 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][104] ([fdo#109276] / [fdo#112080]) -> [FAIL][105] ([IGT#28])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_persistence@vcs2-mixed:
    - shard-iclb:         [SKIP][106] ([fdo#109276] / [fdo#112080]) -> [SKIP][107] ([fdo#112080]) +7 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb8/igt@gem_ctx_persistence@vcs2-mixed.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb4/igt@gem_ctx_persistence@vcs2-mixed.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][108] ([i915#818]) -> [FAIL][109] ([i915#694])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-hsw7/igt@gem_tiled_blits@normal.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][110] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][111] ([fdo#111870] / [i915#478])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][112] ([i915#454]) -> [SKIP][113] ([i915#468])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#716] / [i915#997]) -> ([FAIL][117], [FAIL][118]) ([i915#997])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl6/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-kbl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl3/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         [FAIL][119] ([fdo#108654] / [fdo#111093]) -> ([FAIL][120], [FAIL][121]) ([fdo#111093])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7777/shard-iclb3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb7/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/shard-iclb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108654]: https://bugs.freedesktop.org/show_bug.cgi?id=108654
  [fdo#108838]: https://bugs.freedesktop.org/show_bug.cgi?id=108838
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112126]: https://bugs.freedesktop.org/show_bug.cgi?id=112126
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#461]: https://gitlab.freedesktop.org/drm/intel/issues/461
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.free

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3949/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
