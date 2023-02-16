Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7140350206902662518=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Thu, 16 Feb 2023 11:34:56 -0000
Message-ID: <167654729678.17988.13934276213745283137@emeril.freedesktop.org>
References: <20230215142738.1121229-1-mcanal@igalia.com>
In-Reply-To: <20230215142738.1121229-1-mcanal@igalia.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVjNEIE1p?=
 =?utf-8?q?xed_Job_Submission_Tests_=28rev5=29?=
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

--===============7140350206902662518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: V3D Mixed Job Submission Tests (rev5)
URL   : https://patchwork.freedesktop.org/series/112805/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12744_full -> IGTPW_8502_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8502_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@v3d/v3d_submit_csd@bad-perfmon} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][1] +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-dg1-14/igt@v3d/v3d_submit_csd@bad-perfmon.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@invalid-parameters}:
    - {shard-tglu-9}:     NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-9/igt@kms_plane_scaling@invalid-parameters.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12744_full and IGTPW_8502_full:

### New IGT tests (21) ###

  * igt@v3d/v3d_job_submission@array-job-submission:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_job_submission@threaded-job-submission:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-bo:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-extension:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-flag:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-in-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-multisync-in-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-multisync-out-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-multisync-pad:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-pad:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@bad-perfmon:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@job-perfmon:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@multi-and-single-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@multiple-job-submission:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@multisync-out-syncs:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@single-in-sync:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@v3d/v3d_submit_csd@valid-submission:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8502_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#2842])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][5] ([i915#3318])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl7/igt@gem_userptr_blits@vma-merge.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#3591])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271]) +38 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-snb4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][9] ([i915#4573]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl4/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-apl:          [PASS][10] -> [SKIP][11] ([fdo#109271])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl4/igt@kms_vblank@pipe-c-query-idle-hang.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl3/igt@kms_vblank@pipe-c-query-idle-hang.html
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk7/igt@kms_vblank@pipe-c-query-idle-hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@kms_vblank@pipe-c-query-idle-hang.html

  * {igt@v3d/v3d_submit_csd@bad-extension} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][14] ([fdo#109315] / [i915#2575]) +7 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-5/igt@v3d/v3d_submit_csd@bad-extension.html

  * {igt@v3d/v3d_submit_csd@bad-multisync-extension} (NEW):
    - {shard-tglu-9}:     NOTRUN -> [SKIP][15] ([fdo#109315] / [i915#2575]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-9/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * {igt@v3d/v3d_submit_csd@bad-multisync-pad} (NEW):
    - {shard-tglu-10}:    NOTRUN -> [SKIP][16] ([fdo#109315] / [i915#2575]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-10/igt@v3d/v3d_submit_csd@bad-multisync-pad.html

  * {igt@v3d/v3d_submit_csd@bad-pad} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271]) +27 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk3/igt@v3d/v3d_submit_csd@bad-pad.html

  * {igt@v3d/v3d_submit_csd@multi-and-single-sync} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271]) +53 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl3/igt@v3d/v3d_submit_csd@multi-and-single-sync.html

  * {igt@v3d/v3d_submit_csd@valid-multisync-submission} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][19] ([fdo#109315]) +20 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - {shard-rkl}:        [FAIL][20] ([i915#7742]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@nullptr:
    - {shard-rkl}:        [SKIP][22] ([i915#2582]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-5/igt@fbdev@nullptr.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          [ABORT][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@hang:
    - {shard-rkl}:        [SKIP][26] ([i915#6252]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-5/igt@gem_ctx_persistence@hang.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_eio@hibernate:
    - {shard-dg1}:        [ABORT][28] ([i915#7975]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-dg1-14/igt@gem_eio@hibernate.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-dg1-16/igt@gem_eio@hibernate.html

  * igt@gem_eio@in-flight-external:
    - {shard-rkl}:        [ABORT][30] ([i915#7811]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@gem_eio@in-flight-external.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-4/igt@gem_eio@in-flight-external.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][32] ([i915#2846]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - {shard-rkl}:        [FAIL][34] ([i915#2842]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_exec_fair@basic-none@vcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][36] ([i915#2842]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_reloc@basic-softpin:
    - {shard-rkl}:        [SKIP][38] ([i915#3281]) -> [PASS][39] +9 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_exec_reloc@basic-softpin.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_partial_pwrite_pread@write:
    - {shard-rkl}:        [SKIP][40] ([i915#3282]) -> [PASS][41] +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_partial_pwrite_pread@write.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][42] ([i915#5566]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - {shard-rkl}:        [SKIP][44] ([i915#2527]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - {shard-rkl}:        [SKIP][46] ([i915#1845] / [i915#4098]) -> [PASS][47] +19 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][48] ([i915#1845] / [i915#7651]) -> [PASS][49] +11 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-rkl}:        [SKIP][50] ([i915#1849] / [i915#4098]) -> [PASS][51] +11 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_plane@pixel-format@pipe-b-planes:
    - {shard-rkl}:        [SKIP][52] ([i915#1849]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-4/igt@kms_plane@pixel-format@pipe-b-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html

  * igt@kms_psr@primary_render:
    - {shard-rkl}:        [SKIP][54] ([i915#1072]) -> [PASS][55] +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@kms_psr@primary_render.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_psr@primary_render.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][56] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][58] ([i915#4349]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-6/igt@perf_pmu@idle@rcs0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@perf_pmu@idle@rcs0.html

  * igt@prime_vgem@basic-fence-flip:
    - {shard-rkl}:        [SKIP][60] ([fdo#109295] / [i915#3708] / [i915#4098]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - {shard-rkl}:        [SKIP][62] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@prime_vgem@basic-fence-read.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@prime_vgem@basic-fence-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7582]: https://gitlab.freedesktop.org/drm/intel/issues/7582
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7811]: https://gitlab.freedesktop.org/drm/intel/issues/7811
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#7984]: https://gitlab.freedesktop.org/drm/intel/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7160 -> IGTPW_8502

  CI-20190529: 20190529
  CI_DRM_12744: 2e4cac06e4de01a35626de676b9eeb474ae7ab5d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8502: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html
  IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html

--===============7140350206902662518==
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
<tr><td><b>Series:</b></td><td>V3D Mixed Job Submission Tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112805/">https://patchwork.freedesktop.org/series/112805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12744_full -&gt; IGTPW_8502_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8502_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@v3d/v3d_submit_csd@bad-perfmon} (NEW):<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-dg1-14/igt@v3d/v3d_submit_csd@bad-perfmon.html">SKIP</a> +9 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_plane_scaling@invalid-parameters}:<ul>
<li>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-9/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12744_full and IGTPW_8502_full:</p>
<h3>New IGT tests (21)</h3>
<ul>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@threaded-job-submission:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-bo:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-extension:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-flag:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-in-sync:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-in-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-out-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-pad:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-pad:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-perfmon:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@job-perfmon:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multi-and-single-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multiple-job-submission:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multisync-out-syncs:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-in-sync:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-submission:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8502_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk6/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-snb4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl4/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4573">i915#4573</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-idle-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl4/igt@kms_vblank@pipe-c-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl3/igt@kms_vblank@pipe-c-query-idle-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk7/igt@kms_vblank@pipe-c-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@kms_vblank@pipe-c-query-idle-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@bad-extension} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-5/igt@v3d/v3d_submit_csd@bad-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@bad-multisync-extension} (NEW):</p>
<ul>
<li>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-9/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@bad-multisync-pad} (NEW):</p>
<ul>
<li>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-10/igt@v3d/v3d_submit_csd@bad-multisync-pad.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@bad-pad} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk3/igt@v3d/v3d_submit_csd@bad-pad.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@multi-and-single-sync} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl3/igt@v3d/v3d_submit_csd@multi-and-single-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>{igt@v3d/v3d_submit_csd@valid-multisync-submission} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +20 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@fbdev@nullptr.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-apl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-2/igt@gem_ctx_persistence@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-dg1-16/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-external:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@gem_eio@in-flight-external.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7811">i915#7811</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-4/igt@gem_eio@in-flight-external.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_exec_reloc@basic-softpin.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_exec_reloc@basic-softpin.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gem_partial_pwrite_pread@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gem_partial_pwrite_pread@write.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-glk6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-glk4/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@kms_big_fb@linear-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-tglu-6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-tglu-5/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-4/igt@kms_plane@pixel-format@pipe-b-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_plane@pixel-format@pipe-b-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-1/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_psr@primary_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-6/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-2/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12744/shard-rkl-3/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/shard-rkl-5/igt@prime_vgem@basic-fence-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7160 -&gt; IGTPW_8502</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12744: 2e4cac06e4de01a35626de676b9eeb474ae7ab5d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8502: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8502/index.html<br />
  IGT_7160: 45da871dd2684227e93a2fc002b87dfc58bd5fd9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============7140350206902662518==--
