Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5740373121771920356=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Tue, 04 Apr 2023 17:48:45 -0000
Message-ID: <168063052546.18899.9650708591418270229@emeril.freedesktop.org>
References: <20230322173004.19545-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230322173004.19545-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fdisplay=5Fmodes=3A_Add_negative_test_for_extended_display?=
 =?utf-8?q?_=28rev2=29?=
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

--===============5740373121771920356==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_display_modes: Add negative test for extended display (rev2)
URL   : https://patchwork.freedesktop.org/series/115522/
State : success

== Summary ==

CI Bug Log - changes from IGT_7234_full -> IGTPW_8749_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8749_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_display_modes@extended-mode-negative@pipe-ab} (NEW):
    - {shard-rkl}:        NOTRUN -> [FAIL][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@kms_display_modes@extended-mode-negative@pipe-ab.html

  * {igt@kms_display_modes@extended-mode-negative@pipe-ac} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][2] +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk8/igt@kms_display_modes@extended-mode-negative@pipe-ac.html

  * {igt@kms_display_modes@extended-mode-negative@pipe-ba} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][3] +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl3/igt@kms_display_modes@extended-mode-negative@pipe-ba.html
    - shard-snb:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-snb4/igt@kms_display_modes@extended-mode-negative@pipe-ba.html

  * {igt@kms_display_modes@extended-mode-negative@pipe-ca} (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][5] +11 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-dg1-14/igt@kms_display_modes@extended-mode-negative@pipe-ca.html

  
New tests
---------

  New tests have been introduced between IGT_7234_full and IGTPW_8749_full:

### New IGT tests (13) ###

  * igt@kms_display_modes@extended-mode-negative:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_display_modes@extended-mode-negative@pipe-ab:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-ac:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-ad:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-ba:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-bc:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-bd:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-ca:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-cb:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-cd:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-da:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-db:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@kms_display_modes@extended-mode-negative@pipe-dc:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8749_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk1/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#4613])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-snb:          [PASS][11] -> [ABORT][12] ([i915#4528])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-snb2/igt@i915_selftest@perf@engine_cs.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-snb7/igt@i915_selftest@perf@engine_cs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3886]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271]) +47 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_content_protection@atomic@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][15] ([i915#7173])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@kms_content_protection@atomic@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2346])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#79])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#7810])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - {shard-rkl}:        [FAIL][22] ([i915#7742]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - {shard-rkl}:        [FAIL][24] ([i915#2842]) -> [PASS][25] +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-tglu}:       [FAIL][26] ([i915#2842]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [FAIL][28] ([i915#2842]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - {shard-tglu}:       [ABORT][30] ([i915#7975]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-tglu-6/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-rkl}:        [SKIP][32] ([i915#1937]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][34] ([i915#8011]) -> [PASS][35] +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-7/igt@kms_cursor_legacy@single-move@pipe-b.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-4/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][36] ([i915#2122]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7810]: https://gitlab.freedesktop.org/drm/intel/issues/7810
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8011]: https://gitlab.freedesktop.org/drm/intel/issues/8011
  [i915#8150]: https://gitlab.freedesktop.org/drm/intel/issues/8150
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7234 -> IGTPW_8749

  CI-20190529: 20190529
  CI_DRM_12963: 9ce564e0e7b78a777aade183f3deed30b5b83336 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8749: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html
  IGT_7234: 70802fb59c65164f3587e71376ebed1ed5e91fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html

--===============5740373121771920356==
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
<tr><td><b>Series:</b></td><td>tests/kms_display_modes: Add negative test for extended display (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115522/">https://patchwork.freedesktop.org/series/115522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7234_full -&gt; IGTPW_8749_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8749_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_display_modes@extended-mode-negative@pipe-ab} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@kms_display_modes@extended-mode-negative@pipe-ab.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_display_modes@extended-mode-negative@pipe-ac} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk8/igt@kms_display_modes@extended-mode-negative@pipe-ac.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_display_modes@extended-mode-negative@pipe-ba} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl3/igt@kms_display_modes@extended-mode-negative@pipe-ba.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-snb4/igt@kms_display_modes@extended-mode-negative@pipe-ba.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_display_modes@extended-mode-negative@pipe-ca} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-dg1-14/igt@kms_display_modes@extended-mode-negative@pipe-ca.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7234_full and IGTPW_8749_full:</p>
<h3>New IGT tests (13)</h3>
<ul>
<li>
<p>igt@kms_display_modes@extended-mode-negative:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-ab:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-ac:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-ad:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-ba:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-bc:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-bd:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-ca:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-cb:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-cd:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-da:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-db:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-negative@pipe-dc:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8749_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-apl2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-snb2/igt@i915_selftest@perf@engine_cs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-snb7/igt@i915_selftest@perf@engine_cs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl1/igt@kms_content_protection@atomic@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7810">i915#7810</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-6/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-4/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-tglu-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-tglu-10/igt@gem_exec_suspend@basic-s4-devices@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-tglu-6/igt@gem_exec_suspend@basic-s4-devices@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-rkl-7/igt@kms_cursor_legacy@single-move@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8011">i915#8011</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-rkl-4/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7234/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/shard-glk2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7234 -&gt; IGTPW_8749</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12963: 9ce564e0e7b78a777aade183f3deed30b5b83336 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8749: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8749/index.html<br />
  IGT_7234: 70802fb59c65164f3587e71376ebed1ed5e91fd1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5740373121771920356==--
