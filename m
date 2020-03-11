Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 21:20:12 -0000
Message-ID: <158396161201.13951.14089789416592717157@emeril.freedesktop.org>
References: <20200311004235.138072-1-jose.souza@intel.com>
In-Reply-To: <20200311004235.138072-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2C1/4=5D_tests/kms=5Ffrontbuffer=5Ftrackin?=
 =?utf-8?q?g=3A_Add_tiling_to_test=5Fmode?=
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
To: "Souza, Jose" <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/74549/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8112_full -> IGTPW_4289_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4289_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4289_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4289_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@rcs0-contexts:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb2/igt@gem_exec_parallel@rcs0-contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-tglb5/igt@gem_exec_parallel@rcs0-contexts.html

  * {igt@kms_frontbuffer_tracking@fbc-tiling-linear} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-tglb:         NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
    - shard-snb:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-snb5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-kbl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl6/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt}:
    - shard-hsw:          [DMESG-WARN][10] ([i915#478]) -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8112_full and IGTPW_4289_full:

### New IGT tests (4) ###

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 3.71] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - Statuses : 1 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.95] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-linear:
    - Statuses : 2 fail(s) 5 skip(s)
    - Exec time: [0.0, 4.91] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 4.99] s

  

Known issues
------------

  Here are the changes found in IGTPW_4289_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +18 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@independent-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] ([i915#118] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk5/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][18] -> [DMESG-WARN][19] ([fdo#111870])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#111870] / [i915#478])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [PASS][22] -> [SKIP][23] ([i915#1316]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb8/igt@i915_pm_rpm@cursor.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-tglb5/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([i915#1316]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb3/igt@i915_pm_rpm@cursor.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb1/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-hsw:          [PASS][26] -> [SKIP][27] ([fdo#109271]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-glk:          [PASS][28] -> [SKIP][29] ([fdo#109271]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_cursor_crc@pipe-b-cursor-dpms:
    - shard-apl:          [PASS][30] -> [FAIL][31] ([i915#54])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#54])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-dpms.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#79])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#62] / [i915#92]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][42] -> [DMESG-WARN][43] ([i915#180]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-start-vcs1:
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#112080]) +9 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb1/igt@perf_pmu@busy-start-vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb5/igt@perf_pmu@busy-start-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [INCOMPLETE][46] ([i915#1402]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@gem_ctx_persistence@close-replace-race.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
    - shard-apl:          [INCOMPLETE][48] ([fdo#103927] / [i915#1402]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [FAIL][50] ([i915#679]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl2/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][52] ([fdo#110841]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl2/igt@gem_eio@in-flight-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][56] ([fdo#110854]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][58] ([fdo#112080]) -> [PASS][59] +15 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][60] ([fdo#109276] / [i915#677]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][62] ([i915#677]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][64] ([fdo#112146]) -> [PASS][65] +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][66] ([i915#118] / [i915#95]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][68] ([i915#413]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][70] ([i915#54]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-glk:          [FAIL][72] ([i915#52] / [i915#54]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][74] ([i915#180]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][76] ([i915#899]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [DMESG-WARN][78] ([i915#478]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw5/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][80] ([fdo#109441]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][82] ([i915#31]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl8/igt@kms_setmode@basic.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl7/igt@kms_setmode@basic.html
    - shard-glk:          [FAIL][84] ([i915#31]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-glk6/igt@kms_setmode@basic.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-glk2/igt@kms_setmode@basic.html
    - shard-hsw:          [FAIL][86] ([i915#31]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw1/igt@kms_setmode@basic.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw6/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][88] ([i915#31]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@kms_setmode@basic.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl7/igt@kms_setmode@basic.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][90] ([i915#478]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb5/igt@prime_vgem@basic-gtt.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-snb2/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][92] ([fdo#109276]) -> [PASS][93] +16 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][94] ([i915#1322]) -> [TIMEOUT][95] ([fdo#111732] / [i915#1322])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl1/igt@gem_linear_blits@normal.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl7/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][96] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][97] ([fdo#111870] / [i915#478])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][98] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][99] ([fdo#111870])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][100] ([i915#468]) -> [FAIL][101] ([i915#454])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         [SKIP][102] ([fdo#111644] / [i915#1397]) -> [SKIP][103] ([i915#1316])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         [SKIP][104] ([fdo#110892]) -> [SKIP][105] ([i915#1316])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114]) ([fdo#111870] / [i915#478]) -> ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([fdo#111870])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw1/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw5/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-hsw7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw5/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw7/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw5/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw1/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-hsw2/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][123], [FAIL][124]) ([i915#1389] / [i915#1402] / [i915#92]) -> [FAIL][125] ([i915#92])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-kbl1/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][126], [FAIL][127]) ([fdo#103927] / [i915#1402]) -> [FAIL][128] ([fdo#103927])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8112/shard-apl3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1389]: https://gitlab.freedesktop.org/drm/intel/issues/1389
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4289
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8112: 032f2fe5c92eb1db6d417738431153c001a41bcc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4289: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4289/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
