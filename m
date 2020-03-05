Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Mar 2020 18:17:23 -0000
Message-ID: <158343224373.17235.17696292165840995979@emeril.freedesktop.org>
References: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
In-Reply-To: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Add_support_to_validate_YUV_pixel_formats?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Add support to validate YUV pixel formats
URL   : https://patchwork.freedesktop.org/series/74283/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8066_full -> IGTPW_4259_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4259_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_chamelium@hdmi-yuv} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-tglb6/igt@kms_chamelium@hdmi-yuv.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8066_full and IGTPW_4259_full:

### New IGT tests (1) ###

  * igt@kms_chamelium@hdmi-yuv:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4259_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([i915#677])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#109276] / [i915#677]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112146]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb7/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb1/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276]) +13 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-iclb:         [PASS][10] -> [INCOMPLETE][11] ([i915#1120])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb8/igt@gem_exec_whisper@basic-queues-forked.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#454])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-hsw:          [PASS][14] -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-hsw5/igt@i915_pm_rpm@fences-dpms.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-hsw7/igt@i915_pm_rpm@fences-dpms.html
    - shard-glk:          [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-glk1/igt@i915_pm_rpm@fences-dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-glk8/igt@i915_pm_rpm@fences-dpms.html
    - shard-tglb:         [PASS][18] -> [SKIP][19] ([i915#1316])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-tglb1/igt@i915_pm_rpm@fences-dpms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-tglb5/igt@i915_pm_rpm@fences-dpms.html
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([i915#1316])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb4/igt@i915_pm_rpm@fences-dpms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb8/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#413])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([i915#478])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-apl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#899])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109441]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][34] -> [INCOMPLETE][35] ([fdo#103665])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#112080]) +9 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#110841]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][42] ([fdo#112080]) -> [PASS][43] +10 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][44] ([fdo#112146]) -> [PASS][45] +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][46] ([i915#677]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][48] ([fdo#109276]) -> [PASS][49] +16 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][50] ([fdo#111870] / [i915#478]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][52] ([i915#180]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb6/igt@kms_psr@psr2_cursor_plane_onoff.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [INCOMPLETE][58] ([i915#1381]) -> [SKIP][59] ([fdo#109276])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-hsw:          [DMESG-WARN][60] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][61] ([fdo#111870])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-hsw7/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
    - shard-snb:          [DMESG-WARN][62] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][63] ([fdo#111870] / [i915#478])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][64] ([i915#454]) -> [SKIP][65] ([i915#468])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73]) ([fdo#111870] / [i915#1077]) -> ([FAIL][74], [FAIL][75], [FAIL][76], [FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80]) ([fdo#111870] / [i915#1077] / [i915#698])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb5/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb2/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb5/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb2/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb5/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb4/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8066/shard-snb5/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb6/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb5/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb4/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb4/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb2/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb2/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/shard-snb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5491 -> IGTPW_4259
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8066: 9e1454777a07902c85ce3febcc9648837a2224fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4259: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html
  IGT_5491: d52794b426ae16630cc1e0354ae435ec98f6174b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4259/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
