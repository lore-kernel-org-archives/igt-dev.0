Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8510181484423390995=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 06 May 2022 12:09:05 -0000
Message-ID: <165183894505.18818.5530755396082427648@emeril.freedesktop.org>
References: <20220506071104.2876292-1-jouni.hogander@intel.com>
In-Reply-To: <20220506071104.2876292-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_selective_fetch_area_calculation?=
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

--===============8510181484423390995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for selective fetch area calculation
URL   : https://patchwork.freedesktop.org/series/103661/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11616_full -> IGTPW_7050_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7050_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html
    - {shard-rkl}:        NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane_scaling@scaler-with-modifier-unity-scaling}:
    - {shard-rkl}:        NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-2/igt@kms_plane_scaling@scaler-with-modifier-unity-scaling.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@kms_vblank@pipe-d-accuracy-idle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11616_full and IGTPW_7050_full:

### New IGT tests (5) ###

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7050_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][5] ([i915#4991])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb6/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271]) +255 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb5/igt@i915_hangman@engine-engine-hang.html

  * igt@kms_color_chamelium@pipe-c-ctm-green-to-red:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb4/igt@kms_color_chamelium@pipe-c-ctm-green-to-red.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - {shard-rkl}:        ([TIMEOUT][11], [TIMEOUT][12]) ([i915#3063]) -> [PASS][13]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-4/igt@gem_eio@unwedge-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-2/igt@gem_eio@unwedge-stress.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-2/igt@gem_eio@unwedge-stress.html
    - {shard-tglu}:       [TIMEOUT][14] ([i915#3063]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-tglu-8/igt@gem_eio@unwedge-stress.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-tglu-5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][16] ([i915#2842]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [SKIP][18] ([fdo#109271]) -> [PASS][19] +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@i915_pm_rps@waitboost:
    - {shard-rkl}:        [FAIL][20] ([i915#4016]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-2/igt@i915_pm_rps@waitboost.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - {shard-rkl}:        [SKIP][22] ([i915#4070]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_cursor_legacy@pipe-c-single-move:
    - {shard-rkl}:        ([SKIP][24], [PASS][25]) ([i915#4070]) -> [PASS][26]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-2/igt@kms_cursor_legacy@pipe-c-single-move.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-single-move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@kms_cursor_legacy@pipe-c-single-move.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48], [FAIL][49], [FAIL][50], [FAIL][51]) ([i915#5917]) -> ([FAIL][52], [FAIL][53], [FAIL][54], [FAIL][55], [FAIL][56], [FAIL][57], [FAIL][58], [FAIL][59], [FAIL][60], [FAIL][61], [FAIL][62], [FAIL][63], [FAIL][64], [FAIL][65], [FAIL][66], [FAIL][67], [FAIL][68], [FAIL][69], [FAIL][70], [FAIL][71], [FAIL][72], [FAIL][73], [FAIL][74], [FAIL][75], [FAIL][76]) ([fdo#109271] / [i915#5917])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl1/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl1/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl4/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl2/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl2/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl4/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl2/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl4/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl2/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl1/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl8/igt@runner@aborted.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl8/igt@runner@aborted.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl8/igt@runner@aborted.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl3/igt@runner@aborted.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl2/igt@runner@aborted.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl3/igt@runner@aborted.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runner@aborted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runner@aborted.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl3/igt@runner@aborted.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runner@aborted.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runner@aborted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl2/igt@runner@aborted.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl2/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl7/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl7/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5917]: https://gitlab.freedesktop.org/drm/intel/issues/5917
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6467 -> IGTPW_7050
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11616: 65a5fe9ac96c60bd6dfcc44a0bb8d584912ea53d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7050: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/index.html
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/index.html

--===============8510181484423390995==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Testcases for selective fetch area calculati=
on</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103661/">https://patchwork.freedesktop.org/series/103661/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7050/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7050/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11616_full -&gt; IGTPW_7050_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/index.=
html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7050=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf} (NEW):</=
p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7050/shard-tglu-6/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-fully-sf.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-fully-sf.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane_scaling@scaler-with-modifier-unity-scaling}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-rkl-2/igt@kms_plane_scaling@scaler-with-modi=
fier-unity-scaling.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-rkl-5/igt@kms_vblank@pipe-d-accuracy-idle.ht=
ml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11616_full and IGTPW_7050_=
full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7050_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-snb6/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-snb2/igt@gem_ctx_persistence@engines-mixed.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-wb.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7050/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-snb5/igt@i915_hangman@engine-engine-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +255 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-green-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7050/shard-snb4/igt@kms_color_chamelium@pipe-c-ctm-gree=
n-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-rkl-4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-rkl-2/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3063">i915#3063</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rkl-2/igt@gem_eio@unwedg=
e-stress.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11616/shard-tglu-8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shar=
d-tglu-5/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-tglu-2/igt@gem_exec_fair@basic-none-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7050/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7050/shard-snb4/igt@gem_exec_flush@basic-wb-ro-before-default.html"=
>PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-rkl-2/igt@i915_pm_rps@waitboost.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4016">i915#4016</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-rk=
l-5/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-forked-bo:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11616/shard-rkl-1/igt@kms_cursor_legacy@pipe-c-forked-bo.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i915=
#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7050/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-forked-bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-single-move:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11616/shard-rkl-2/igt@kms_cursor_legacy@pipe-c-single-move.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/s=
hard-rkl-5/igt@kms_cursor_legacy@pipe-c-single-move.html">PASS</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-r=
kl-5/igt@kms_cursor_legacy@pipe-c-single-move.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11616/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11616/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11616/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11616/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_116=
16/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/=
shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/sha=
rd-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_11616/shard-apl4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-=
apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_11616/shard-apl2/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl=
4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_11616/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl2/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_11616/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/CI_DRM_11616/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl8/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_11616/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11616/shard-apl8/igt@runne=
r@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5917">i915#5917</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7050/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl2/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7050/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7050/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7050/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050=
/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-=
apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7050/shard-apl2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7050/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl2/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl7/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7050/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050=
/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-=
apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/shard-apl8/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7050/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5917">i915#5917=
</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6467 -&gt; IGTPW_7050</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11616: 65a5fe9ac96c60bd6dfcc44a0bb8d584912ea53d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7050: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7050/index.htm=
l<br />
  IGT_6467: 929abc51cdd48d673efa03e025b1f31b557972ed @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8510181484423390995==--
