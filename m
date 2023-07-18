Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3509486283461730381=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Tue, 18 Jul 2023 19:37:06 -0000
Message-ID: <168970902627.22203.10452652024777178891@emeril.freedesktop.org>
References: <20230718121136.2992608-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230718121136.2992608-1-himal.prasad.ghimiray@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/1=5D_tests/xe/xe=5Fuevent=3A_a?=
 =?utf-8?q?dd_new_test_for_uevent_gt_reset_failure?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3509486283461730381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/1] tests/xe/xe_uevent: add new test for uevent gt reset failure
URL   : https://patchwork.freedesktop.org/series/120913/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13394_full -> IGTPW_9428_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html

Participating hosts (10 -> 10)
------------------------------

  Additional (1): shard-rkl0 
  Missing    (1): pig-kbl-iris 

Known issues
------------

  Here are the changes found in IGTPW_9428_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][1] ([i915#7701])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@device_reset@cold-reset-bound.html
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#7701])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][3] -> [FAIL][4] ([i915#7742])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8414])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@feature_discovery@display-2x.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@feature_discovery@display-2x.html

  * igt@gem_create@create-ext-set-pat:
    - shard-snb:          NOTRUN -> [FAIL][8] ([i915#8621])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb2/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
    - shard-mtlp:         [PASS][10] -> [FAIL][11] ([i915#2410])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [PASS][12] -> [FAIL][13] ([i915#4475])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#2842]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#3539] / [i915#4852])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-5/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-master:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([fdo#112283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#3281]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#3281]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [PASS][29] -> [TIMEOUT][30] ([i915#8628])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#2190])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][34] -> [DMESG-WARN][35] ([i915#4936] / [i915#5493])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#284])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@gem_media_vme.html

  * igt@gem_mmap@bad-offset:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4083]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@gem_mmap@bad-offset.html

  * igt@gem_mmap_gtt@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#4077]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@gem_mmap_gtt@big-bo.html

  * igt@gem_mmap_wc@set-cache-level:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4083]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3282]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4270]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3282])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#8428]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3282]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4079])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([fdo#110542])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][49] -> [FAIL][50] ([i915#7916])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3281]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@gem_userptr_blits@relocations.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-tglu:         [PASS][52] -> [ABORT][53] ([i915#5122])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-8/igt@gem_workarounds@suspend-resume-context.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([fdo#109289]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([fdo#109289])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][56] ([i915#2527] / [i915#2856])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#2856]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#2527])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#2856])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#5978])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@i915_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][61] ([i915#3361])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [PASS][62] -> [SKIP][63] ([fdo#109289] / [i915#8403])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][64] -> [SKIP][65] ([i915#1397]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-tglu:         [PASS][66] -> [FAIL][67] ([i915#7940])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#1397])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][69] -> [SKIP][70] ([i915#1397]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#4077]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_selftest@live@gt_mocs:
    - shard-mtlp:         [PASS][72] -> [DMESG-FAIL][73] ([i915#7059])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#5190])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4212])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4212])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [PASS][77] -> [FAIL][78] ([i915#2521])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [FAIL][79] ([i915#8247]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#5286])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-mtlp:         [PASS][81] -> [DMESG-WARN][82] ([i915#2017])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#5286]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][84] ([i915#3743])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([fdo#111614])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [PASS][86] -> [FAIL][87] ([i915#3743])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#5190]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-mtlp:         NOTRUN -> [SKIP][89] ([fdo#111615]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([fdo#110723]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#4538] / [i915#5190]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([fdo#111615])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3689] / [i915#5354]) +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#5354]) +16 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#3734] / [i915#5354] / [i915#6095]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#5354] / [i915#6095]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][97] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#5354] / [i915#6095])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#6095]) +9 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#3886]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#3689] / [i915#3886] / [i915#5354]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#3886] / [i915#6095]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#5354]) +11 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4087] / [i915#7213]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-2:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4087]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#7828]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#7828])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#7828]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#7828]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3359])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][111] ([i915#3359])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8814])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#3555]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3546])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([fdo#111767] / [i915#3546])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][116] -> [FAIL][117] ([i915#2346])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#8827])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3555]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-rkl:          NOTRUN -> [SKIP][120] ([fdo#111825])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([fdo#109274] / [i915#3637])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][122] ([i915#8841]) +5 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#3637]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          [PASS][124] -> [FAIL][125] ([i915#79])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#2672])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#2672]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#2672])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#1825]) +6 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([fdo#109280]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([fdo#111825] / [i915#1825]) +9 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#3023]) +7 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#8708]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][134] ([i915#8708]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3458]) +5 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][136] ([fdo#110189])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#3555] / [i915#8228])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][138] ([fdo#109289])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][139] ([i915#4573]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [PASS][140] -> [FAIL][141] ([i915#8292])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][142] ([i915#8292])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#5176]) +3 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#5176]) +7 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#5176]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][146] ([fdo#109271]) +250 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb2/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#5235]) +5 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#5235]) +15 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([fdo#111068] / [i915#658])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][150] ([fdo#109271] / [i915#658])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@primary_page_flip:
    - shard-apl:          NOTRUN -> [SKIP][151] ([fdo#109271]) +39 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#1072])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#4235]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4235] / [i915#5190])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-rkl:          NOTRUN -> [SKIP][155] ([fdo#111615] / [i915#5289])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][156] ([fdo#109309])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_tv_load_detect@load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([fdo#109309])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-dg2:          [PASS][158] -> [FAIL][159] ([fdo#103375])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - shard-glk:          [PASS][160] -> [SKIP][161] ([fdo#109271])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-idle:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#4070] / [i915#6768]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_vblank@pipe-c-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][163] ([fdo#109271] / [i915#533])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#2437])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_writeback@writeback-check-output.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][165] -> [FAIL][166] ([i915#4349])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@testdisplay:
    - shard-apl:          [PASS][167] -> [TIMEOUT][168] ([i915#8817])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl7/igt@testdisplay.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@testdisplay.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([fdo#109307])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_submit_cl@valid-multisync-submission:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#2575]) +2 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@v3d/v3d_submit_cl@valid-multisync-submission.html

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#109315]) +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@v3d/v3d_submit_csd@job-perfmon.html

  * igt@v3d/v3d_submit_csd@multi-and-single-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#2575]) +2 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@v3d/v3d_submit_csd@multi-and-single-sync.html

  * igt@vc4/vc4_label_bo@set-kernel-name:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#7711]) +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@vc4/vc4_label_bo@set-kernel-name.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#7711]) +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@vc4/vc4_tiling@get-after-free.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#7711]) +1 similar issue
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-flags.html

  
#### Possible fixes ####

  * igt@gem_create@hog-create@smem0:
    - shard-dg2:          [FAIL][176] ([i915#5892] / [i915#8758]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-6/igt@gem_create@hog-create@smem0.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@gem_create@hog-create@smem0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][178] ([i915#6268]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_eio@kms:
    - shard-dg2:          [INCOMPLETE][180] ([i915#7892]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-3/igt@gem_eio@kms.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][182] ([i915#2842]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-snb:          [ABORT][184] -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-snb7/igt@gem_mmap_gtt@basic-small-copy-odd.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb4/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [FAIL][186] ([i915#7069]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][188] ([fdo#109271]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-dg2:          [SKIP][190] ([i915#1937]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - {shard-dg1}:        [FAIL][192] ([i915#3591]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {shard-dg1}:        [FAIL][194] ([i915#7691]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-16/igt@i915_pm_rpm@basic-pci-d3-state.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-18/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-dg1}:        [SKIP][196] ([i915#1397]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][198] ([i915#1397]) -> [PASS][199] +1 similar issue
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress@smem0:
    - shard-tglu:         [FAIL][200] ([i915#7940]) -> [PASS][201] +3 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][202] ([i915#1397]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-mtlp:         [FAIL][204] ([i915#3743]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][206] ([i915#2346]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-mtlp:         [FAIL][208] ([i915#2346]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [ABORT][210] ([i915#180]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-rkl:          [ABORT][212] ([i915#7461]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [FAIL][214] ([i915#4521]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [FAIL][216] ([i915#4521]) -> [PASS][217] +7 similar issues
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-12/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
    - shard-mtlp:         [FAIL][218] ([i915#6015]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [TIMEOUT][220] ([i915#6950]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [ABORT][222] ([i915#8131]) -> [TIMEOUT][223] ([i915#7392])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [FAIL][224] ([i915#3591]) -> [FAIL][225] ([i915#2681] / [i915#3591])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [DMESG-FAIL][226] ([i915#2017] / [i915#5954]) -> [FAIL][227] ([i915#2346])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][228] ([fdo#110189] / [i915#3955]) -> [SKIP][229] ([i915#3955])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-2/igt@kms_fbcon_fbt@psr.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][230] ([i915#3955]) -> [SKIP][231] ([fdo#110189] / [i915#3955])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][232] ([i915#4816]) -> [SKIP][233] ([i915#4070] / [i915#4816])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [CRASH][234] ([i915#7331]) -> [INCOMPLETE][235] ([i915#5493])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5892]: https://gitlab.freedesktop.org/drm/intel/issues/5892
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#5978]: https://gitlab.freedesktop.org/drm/intel/issues/5978
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7892]: https://gitlab.freedesktop.org/drm/intel/issues/7892
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/intel/issues/8428
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8621]: https://gitlab.freedesktop.org/drm/intel/issues/8621
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8758]: https://gitlab.freedesktop.org/drm/intel/issues/8758
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8817]: https://gitlab.freedesktop.org/drm/intel/issues/8817
  [i915#8827]: https://gitlab.freedesktop.org/drm/intel/issues/8827
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8889]: https://gitlab.freedesktop.org/drm/intel/issues/8889


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7392 -> IGTPW_9428
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13394: 4fab7ebb2e3675cb9fcd7a94a7b34caa0ea855cf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9428: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html
  IGT_7392: 1e7c1d677d7ba57f342486bc522ed1bb6c19bf5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html

--===============3509486283461730381==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/1] tests/xe/xe_uevent: add new test for uevent gt reset failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120913/">https://patchwork.freedesktop.org/series/120913/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13394_full -&gt; IGTPW_9428_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>Additional (1): shard-rkl0 <br />
  Missing    (1): pig-kbl-iris </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9428_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb6/igt@gem_create@create-ext-set-pat.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8621">i915#8621</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb2/igt@gem_ctx_persistence@idempotent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk9/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-5/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@gem_exec_reloc@basic-write-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-3/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-offset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@gem_mmap@bad-offset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@gem_mmap_gtt@big-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@gem_readwrite@new-obj.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8428">i915#8428</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110542">fdo#110542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-8/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@gem_workarounds@suspend-resume-context.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5978">i915#5978</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-5/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-2/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_async_flips@crc@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-9/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_cdclk@plane-scaling@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-10/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-1/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8827">i915#8827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb2/igt@kms_plane_scaling@plane-upscale-with-modifiers-factor-0-25@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +250 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-8/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk9/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk7/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-idle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_vblank@pipe-c-ts-continuation-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl7/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl6/igt@testdisplay.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8817">i915#8817</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109307">fdo#109307</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-multisync-submission:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@v3d/v3d_submit_cl@valid-multisync-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@v3d/v3d_submit_csd@job-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multi-and-single-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@v3d/v3d_submit_csd@multi-and-single-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-kernel-name:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@vc4/vc4_label_bo@set-kernel-name.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@hog-create@smem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-6/igt@gem_create@hog-create@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5892">i915#5892</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8758">i915#8758</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-11/igt@gem_create@hog-create@smem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-3/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7892">i915#7892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-12/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-snb7/igt@gem_mmap_gtt@basic-small-copy-odd.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-snb4/igt@gem_mmap_gtt@basic-small-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-10/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-16/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-18/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg1-14/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@smem0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-7/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-4/igt@i915_pm_rpm@gem-execbuf-stress@smem0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-8/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-12/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-5/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-4/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6950">i915#6950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-8/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-6/igt@gem_exec_whisper@basic-contexts-priority-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-mtlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-mtlp-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13394/shard-dg2-12/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/shard-dg2-7/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7392 -&gt; IGTPW_9428</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13394: 4fab7ebb2e3675cb9fcd7a94a7b34caa0ea855cf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9428: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9428/index.html<br />
  IGT_7392: 1e7c1d677d7ba57f342486bc522ed1bb6c19bf5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3509486283461730381==--
