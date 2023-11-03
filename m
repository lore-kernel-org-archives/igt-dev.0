Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0501586210210533177=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Fri, 03 Nov 2023 06:51:29 -0000
Message-ID: <169899428941.29106.14162054437273512640@emeril.freedesktop.org>
References: <20231103051438.19342-1-nidhi1.gupta@intel.com>
In-Reply-To: <20231103051438.19342-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRXh0ZW5k?=
 =?utf-8?q?_the_test_to_validate_FBC_for_each_plane?=
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

--===============0501586210210533177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend the test to validate FBC for each plane
URL   : https://patchwork.freedesktop.org/series/125940/
State : success

== Summary ==

CI Bug Log - changes from IGT_7572 -> IGTPW_10112
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html

Participating hosts (36 -> 37)
------------------------------

  Additional (2): fi-kbl-soraka bat-dg2-9 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10112:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_frontbuffer_tracking@plane-fbc-rte} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adls-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-adlp-9:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-dg2-11:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-11/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-adln-1:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adln-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-14/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-rplp-1:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rplp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-rkl-11600/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-mtlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-jsl-3:          NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-jsl-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-dg2-9:          NOTRUN -> [SKIP][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-adlp-11:        NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlp-11/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-adlm-1:         NOTRUN -> [SKIP][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlm-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-jsl-1:          NOTRUN -> [SKIP][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-jsl-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-rpls-1:         NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rpls-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  
New tests
---------

  New tests have been introduced between IGT_7572 and IGTPW_10112:

### New IGT tests (1) ###

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - Statuses : 36 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10112 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          NOTRUN -> [INCOMPLETE][16] ([i915#9275])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#2190])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][19] ([i915#4083])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][20] ([i915#4077]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][21] ([i915#4079]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-9:          NOTRUN -> [SKIP][22] ([i915#6621])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][23] ([i915#5334] / [i915#7872])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][24] ([i915#1886])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][25] ([i915#5190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][26] ([i915#4215] / [i915#5190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          NOTRUN -> [SKIP][27] ([i915#4212]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-9:          NOTRUN -> [SKIP][28] ([i915#4212] / [i915#5608])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][29] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][30] ([fdo#109271]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-9:          NOTRUN -> [SKIP][31] ([fdo#109285])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          NOTRUN -> [SKIP][32] ([i915#5274])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html

  * {igt@kms_frontbuffer_tracking@plane-fbc-rte} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][33] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-skl-6600u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-apl-guc:         NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-apl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][35] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-pnv-d510/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][36] ([fdo#109271])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-glk-j4005/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-skl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-7567u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][39] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-8700k/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][40] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-elk-e7500/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][41] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-bsw-nick/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-kbl-2:          NOTRUN -> [SKIP][42] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-kbl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - bat-atsm-1:         NOTRUN -> [SKIP][43] ([i915#6078])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-atsm-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][44] ([fdo#109271])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][45] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-x1275/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][46] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-hsw-4770/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][47] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-8109u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][48] ([fdo#109271])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-ivb-3770/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-ilk-650:         NOTRUN -> [SKIP][50] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-ilk-650/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][51] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-blb-e6850/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][52] ([fdo#109271])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-bsw-n3050/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-9:          NOTRUN -> [SKIP][53] ([i915#1072]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-9:          NOTRUN -> [SKIP][54] ([i915#3555] / [i915#4098])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-9:          NOTRUN -> [SKIP][55] ([i915#3708])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-9:          NOTRUN -> [SKIP][56] ([i915#3708] / [i915#4077]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][57] ([i915#3291] / [i915#3708]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-kbl-7567u:       [INCOMPLETE][58] ([i915#4817]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7572/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         [INCOMPLETE][60] ([i915#7443]) -> [ABORT][61] ([i915#7978] / [i915#8668])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7572/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7443]: https://gitlab.freedesktop.org/drm/intel/issues/7443
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7572 -> IGTPW_10112

  CI-20190529: 20190529
  CI_DRM_13833: b978573539a590501c843a520bfc65b830d10eba @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10112: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html
  IGT_7572: df19419afcb7200d16da662d6d1b7feabe83f12f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_frontbuffer_tracking@plane-fbc-rte

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html

--===============0501586210210533177==
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
<tr><td><b>Series:</b></td><td>Extend the test to validate FBC for each plane</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125940/">https://patchwork.freedesktop.org/series/125940/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7572 -&gt; IGTPW_10112</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html</p>
<h2>Participating hosts (36 -&gt; 37)</h2>
<p>Additional (2): fi-kbl-soraka bat-dg2-9 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10112:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_frontbuffer_tracking@plane-fbc-rte} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adls-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlp-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-11/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adln-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-14/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rplp-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-rkl-11600/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-tgl-1115g4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-mtlp-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-jsl-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlp-11/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-adlm-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-jsl-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rpls-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7572 and IGTPW_10112:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_frontbuffer_tracking@plane-fbc-rte:<ul>
<li>Statuses : 36 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10112 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_frontbuffer_tracking@plane-fbc-rte} (NEW):</p>
<ul>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-skl-6600u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-apl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-pnv-d510/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-glk-j4005/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-skl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-7567u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-8700k/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-elk-e7500/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-bsw-nick/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-kbl-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-atsm-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-x1275/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-hsw-4770/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-cfl-8109u/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-ivb-3770/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-guc/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-ilk-650/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-blb-e6850/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-bsw-n3050/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7572/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/fi-kbl-7567u/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7572/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7443">i915#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7572 -&gt; IGTPW_10112</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13833: b978573539a590501c843a520bfc65b830d10eba @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10112: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10112/index.html<br />
  IGT_7572: df19419afcb7200d16da662d6d1b7feabe83f12f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_frontbuffer_tracking@plane-fbc-rte</p>

</body>
</html>

--===============0501586210210533177==--
