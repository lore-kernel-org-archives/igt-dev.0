Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4769541500619067756=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Date: Thu, 30 Mar 2023 10:14:19 -0000
Message-ID: <168017125960.18843.3739935933608747508@emeril.freedesktop.org>
References: <20230329172748.21877-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329172748.21877-1-niranjana.vishwanathapura@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgeGUveGVf?=
 =?utf-8?q?vm=3A_Create_BO_in_proper_tile?=
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

--===============4769541500619067756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/xe_vm: Create BO in proper tile
URL   : https://patchwork.freedesktop.org/series/115811/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12936_full -> IGTPW_8713_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8713_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_lease@lease_unleased_connector@pipe-a-hdmi-a-4:
    - {shard-dg1}:        NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@kms_lease@lease_unleased_connector@pipe-a-hdmi-a-4.html

  * igt@kms_lease@lease_unleased_connector@pipe-b-hdmi-a-4:
    - {shard-dg1}:        NOTRUN -> [DMESG-WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@kms_lease@lease_unleased_connector@pipe-b-hdmi-a-4.html

  
Known issues
------------

  Here are the changes found in IGTPW_8713_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#3886])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][4] -> [FAIL][5] ([i915#2346])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#79])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [PASS][8] -> [ABORT][9] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271]) +13 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#658])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-glk:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk6/igt@kms_vblank@pipe-b-query-idle-hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk1/igt@kms_vblank@pipe-b-query-idle-hang.html
    - shard-apl:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl6/igt@kms_vblank@pipe-b-query-idle-hang.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl4/igt@kms_vblank@pipe-b-query-idle-hang.html

  
#### Possible fixes ####

  * {igt@gem_barrier_race@remote-request@rcs0}:
    - shard-apl:          [ABORT][16] ([i915#8211] / [i915#8234]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl7/igt@gem_barrier_race@remote-request@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html
    - {shard-tglu}:       [ABORT][18] ([i915#8211]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-2/igt@gem_barrier_race@remote-request@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-2/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - {shard-tglu}:       [TIMEOUT][20] ([i915#3778]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-10/igt@gem_exec_endless@dispatch@vecs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-9/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][22] ([i915#2842]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:
    - shard-apl:          [ABORT][24] ([i915#180]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl1/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html

  * {igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1}:
    - shard-glk:          [DMESG-FAIL][26] ([i915#118]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk7/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk4/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][28] ([i915#2346]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][30] ([i915#2346]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * {igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled}:
    - shard-glk:          [DMESG-WARN][32] ([i915#7936]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk7/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - {shard-tglu}:       [FAIL][34] ([i915#4767]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-10/igt@kms_fbcon_fbt@fbc-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@perf_pmu@busy-idle@vcs0:
    - {shard-dg1}:        [FAIL][36] ([i915#4349]) -> [PASS][37] +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-dg1-14/igt@perf_pmu@busy-idle@vcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@perf_pmu@busy-idle@vcs0.html

  * igt@sysfs_timeslice_duration@timeout@rcs0:
    - {shard-dg1}:        [FAIL][38] ([i915#1755]) -> [PASS][39] +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@rcs0.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7936]: https://gitlab.freedesktop.org/drm/intel/issues/7936
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8308]: https://gitlab.freedesktop.org/drm/intel/issues/8308


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7226 -> IGTPW_8713
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12936: 906438caae695f109636f82e2d1845a258f57d8b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html
  IGT_7226: 41be8b4ab86f9e11388c10366dfd71e5032589c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html

--===============4769541500619067756==
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
<tr><td><b>Series:</b></td><td>xe/xe_vm: Create BO in proper tile</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115811/">https://patchwork.freedesktop.org/series/115811/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12936_full -&gt; IGTPW_8713_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8713_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_lease@lease_unleased_connector@pipe-a-hdmi-a-4:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@kms_lease@lease_unleased_connector@pipe-a-hdmi-a-4.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_unleased_connector@pipe-b-hdmi-a-4:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@kms_lease@lease_unleased_connector@pipe-b-hdmi-a-4.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8713_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl3/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-idle-hang:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk6/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk1/igt@kms_vblank@pipe-b-query-idle-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl6/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl4/igt@kms_vblank@pipe-b-query-idle-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_barrier_race@remote-request@rcs0}:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl7/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8234">i915#8234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-2/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-2/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-10/igt@gem_exec_endless@dispatch@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-9/igt@gem_exec_endless@dispatch@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl1/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl6/igt@kms_cursor_crc@cursor-suspend@pipe-c-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk7/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk4/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-glk7/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7936">i915#7936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-glk8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-tglu-10/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-tglu-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-dg1-14/igt@perf_pmu@busy-idle@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-18/igt@perf_pmu@busy-idle@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12936/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/shard-dg1-16/igt@sysfs_timeslice_duration@timeout@rcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7226 -&gt; IGTPW_8713</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12936: 906438caae695f109636f82e2d1845a258f57d8b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8713: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8713/index.html<br />
  IGT_7226: 41be8b4ab86f9e11388c10366dfd71e5032589c1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4769541500619067756==--
