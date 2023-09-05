Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2894320052926287278=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 05 Sep 2023 17:07:23 -0000
Message-ID: <169393364330.19169.6550485937807366212@emeril.freedesktop.org>
References: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230905125356.1659246-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgU2VwYXJh?=
 =?utf-8?q?te_display_PM_tests_from_Core_=28rev2=29?=
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

--===============2894320052926287278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Separate display PM tests from Core (rev2)
URL   : https://patchwork.freedesktop.org/series/122790/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13599 -> IGTPW_9720
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html

Participating hosts (38 -> 39)
------------------------------

  Additional (2): fi-kbl-soraka bat-dg2-8 
  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9720:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][1] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html
    - {bat-dg2-14}:       NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - {bat-dg2-14}:       NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@basic-rte} (NEW):
    - bat-atsm-1:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html
    - bat-dg2-9:          NOTRUN -> [SKIP][5] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-9/igt@kms_pm_rpm@basic-rte.html
    - bat-dg2-11:         NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-11/igt@kms_pm_rpm@basic-rte.html
    - bat-dg2-8:          NOTRUN -> [SKIP][7] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
    - bat-adlm-1:         NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlm-1/igt@kms_pm_rpm@basic-rte.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-tgl-1115g4/igt@kms_pm_rpm@basic-rte.html
    - bat-rpls-1:         NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-rpls-1/igt@kms_pm_rpm@basic-rte.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-mtlp-8/igt@kms_pm_rpm@basic-rte.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - bat-adls-5:         NOTRUN -> [SKIP][12] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adls-5/igt@kms_pm_rpm@module-reload.html
    - bat-dg1-5:          NOTRUN -> [SKIP][13] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg1-5/igt@kms_pm_rpm@module-reload.html
    - bat-adlp-9:         NOTRUN -> [SKIP][14] +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-9/igt@kms_pm_rpm@module-reload.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13599 and IGTPW_9720:

### New IGT tests (5) ###

  * igt@kms_pm_backlight@basic-brightness:
    - Statuses : 28 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_backlight@basic-brightness@edp-1:
    - Statuses : 2 abort(s) 6 pass(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - Statuses : 1 abort(s) 1 incomplete(s) 28 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@basic-rte:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@module-reload:
    - Statuses : 32 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9720 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#2190])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_mmap@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][17] ([i915#4083])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][18] ([i915#4077]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_tiled_pread_basic:
    - bat-dg2-8:          NOTRUN -> [SKIP][19] ([i915#4079]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-8:          NOTRUN -> [SKIP][20] ([i915#6621])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][21] -> [ABORT][22] ([i915#7911] / [i915#7913])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][23] ([i915#1886] / [i915#7913])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-dg2-8:          NOTRUN -> [SKIP][24] ([i915#6645])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][25] ([i915#5190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][26] ([i915#4215] / [i915#5190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-8:          NOTRUN -> [SKIP][27] ([i915#4212]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][28] ([fdo#109271]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-8:          NOTRUN -> [SKIP][29] ([i915#4103] / [i915#4213]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-8:          NOTRUN -> [SKIP][30] ([fdo#109285])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-8:          NOTRUN -> [SKIP][31] ([i915#5274])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * {igt@kms_pm_backlight@basic-brightness} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][32] ([fdo#109271]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html
    - bat-kbl-2:          NOTRUN -> [SKIP][33] ([fdo#109271]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html
    - bat-atsm-1:         NOTRUN -> [SKIP][34] ([i915#6078])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html

  * {igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):
    - bat-adlp-6:         NOTRUN -> [ABORT][35] ([i915#8668])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-6/igt@kms_pm_backlight@basic-brightness@edp-1.html
    - bat-rplp-1:         NOTRUN -> [ABORT][36] ([i915#8668])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html

  * {igt@kms_pm_rpm@basic-pci-d3-state} (NEW):
    - bat-adln-1:         NOTRUN -> [ABORT][37] ([i915#8668])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][38] ([fdo#109271]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][39] ([fdo#109271]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html
    - fi-ilk-650:         NOTRUN -> [SKIP][40] ([fdo#109271]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html

  * {igt@kms_pm_rpm@basic-rte} (NEW):
    - bat-jsl-3:          NOTRUN -> [SKIP][41] ([fdo#112080]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-jsl-3/igt@kms_pm_rpm@basic-rte.html
    - fi-skl-guc:         NOTRUN -> [SKIP][42] ([fdo#109271]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-skl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][43] ([fdo#109271]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-x1275/igt@kms_pm_rpm@basic-rte.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][44] ([fdo#109271]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-hsw-4770/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][45] ([fdo#109271]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][46] ([fdo#109271]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-8809g/igt@kms_pm_rpm@basic-rte.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][47] ([fdo#109271]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-bsw-nick/igt@kms_pm_rpm@basic-rte.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][48] ([fdo#109271]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][50] ([fdo#109271]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-skl-6600u/igt@kms_pm_rpm@basic-rte.html
    - bat-jsl-1:          NOTRUN -> [SKIP][51] ([fdo#112080]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-jsl-1/igt@kms_pm_rpm@basic-rte.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][52] ([fdo#109271]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html

  * {igt@kms_pm_rpm@module-reload} (NEW):
    - fi-apl-guc:         NOTRUN -> [SKIP][53] ([fdo#109271]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-apl-guc/igt@kms_pm_rpm@module-reload.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][54] ([fdo#109271]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html

  * igt@kms_psr@cursor_plane_move:
    - bat-dg2-8:          NOTRUN -> [SKIP][55] ([i915#1072]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_psr@cursor_plane_move.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-8:          NOTRUN -> [SKIP][56] ([i915#3555])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-8:          NOTRUN -> [SKIP][57] ([i915#3708])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-8:          NOTRUN -> [SKIP][58] ([i915#3708] / [i915#4077]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-8:          NOTRUN -> [SKIP][59] ([i915#3291] / [i915#3708]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - bat-adlp-11:        [FAIL][60] ([i915#6121]) -> [PASS][61] +4 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:
    - bat-adlp-11:        [DMESG-WARN][62] ([i915#6868]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7468 -> IGTPW_9720

  CI-20190529: 20190529
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9720: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html
  IGT_7468: 7468


Testlist changes
----------------

+igt@kms_pm_backlight@bad-brightness
+igt@kms_pm_backlight@basic-brightness
+igt@kms_pm_backlight@fade
+igt@kms_pm_backlight@fade-with-dpms
+igt@kms_pm_backlight@fade-with-suspend
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_pm_dc@dc5-dpms
+igt@kms_pm_dc@dc5-dpms-negative
+igt@kms_pm_dc@dc5-psr
+igt@kms_pm_dc@dc6-dpms
+igt@kms_pm_dc@dc6-psr
+igt@kms_pm_dc@dc9-dpms
+igt@kms_pm_lpsp@kms-lpsp
+igt@kms_pm_lpsp@screens-disabled
+igt@kms_pm_rpm@basic-pci-d3-state
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
+igt@kms_pm_rpm@dpms-non-lpsp
+igt@kms_pm_rpm@drm-resources-equal
+igt@kms_pm_rpm@fences-dpms
+igt@kms_pm_rpm@i2c
+igt@kms_pm_rpm@legacy-planes
+igt@kms_pm_rpm@legacy-planes-dpms
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-non-lpsp
+igt@kms_pm_rpm@modeset-non-lpsp-stress
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@kms_pm_rpm@modeset-pc8-residency-stress
+igt@kms_pm_rpm@modeset-stress-extra-wait
+igt@kms_pm_rpm@system-suspend-modeset
+igt@kms_pm_rpm@universal-planes
+igt@kms_pm_rpm@universal-planes-dpms
-igt@i915_pm_backlight@bad-brightness
-igt@i915_pm_backlight@basic-brightness
-igt@i915_pm_backlight@fade
-igt@i915_pm_backlight@fade-with-dpms
-igt@i915_pm_backlight@fade-with-suspend
-igt@i915_pm_dc@dc3co-vpb-simulation
-igt@i915_pm_dc@dc5-dpms
-igt@i915_pm_dc@dc5-dpms-negative
-igt@i915_pm_dc@dc5-psr
-igt@i915_pm_dc@dc6-dpms
-igt@i915_pm_dc@dc6-psr
-igt@i915_pm_dc@dc9-dpms
-igt@i915_pm_lpsp@kms-lpsp
-igt@i915_pm_lpsp@screens-disabled
-igt@i915_pm_rpm@basic-pci-d3-state
-igt@i915_pm_rpm@cursor
-igt@i915_pm_rpm@cursor-dpms
-igt@i915_pm_rpm@dpms-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-lpsp
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
-igt@i915_pm_rpm@dpms-non-lpsp
-igt@i915_pm_rpm@drm-resources-equal
-igt@i915_pm_rpm@fences-dpms
-igt@i915_pm_rpm@i2c
-igt@i915_pm_rpm@legacy-planes
-igt@i915_pm_rpm@legacy-planes-dpms
-igt@i915_pm_rpm@modeset-lpsp
-igt@i915_pm_rpm@modeset-lpsp-stress
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-non-lpsp
-igt@i915_pm_rpm@modeset-non-lpsp-stress
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@i915_pm_rpm@modeset-pc8-residency-stress
-igt@i915_pm_rpm@modeset-stress-extra-wait
-igt@i915_pm_rpm@system-suspend-modeset
-igt@i915_pm_rpm@universal-planes
-igt@i915_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html

--===============2894320052926287278==
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
<tr><td><b>Series:</b></td><td>Separate display PM tests from Core (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122790/">https://patchwork.freedesktop.org/series/122790/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13599 -&gt; IGTPW_9720</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html</p>
<h2>Participating hosts (38 -&gt; 39)</h2>
<p>Additional (2): fi-kbl-soraka bat-dg2-8 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9720:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-rkl-11600/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-14/igt@kms_pm_rpm@basic-pci-d3-state.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-rte} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-atsm-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-9/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-11/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlm-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-tgl-1115g4/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-rpls-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-mtlp-8/igt@kms_pm_rpm@basic-rte.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adls-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg1-5/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-9/igt@kms_pm_rpm@module-reload.html">SKIP</a> +2 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13599 and IGTPW_9720:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>Statuses : 28 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness@edp-1:</p>
<ul>
<li>Statuses : 2 abort(s) 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>Statuses : 1 abort(s) 1 incomplete(s) 28 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@module-reload:</p>
<ul>
<li>Statuses : 32 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9720 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-bsw-nick/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-blb-e6850/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-kbl-2/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-atsm-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_backlight@basic-brightness@edp-1} (NEW):</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-6/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-rplp-1/igt@kms_pm_backlight@basic-brightness@edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-pci-d3-state} (NEW):</p>
<ul>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adln-1/igt@kms_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-ivb-3770/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-elk-e7500/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-ilk-650/igt@kms_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@basic-rte} (NEW):</p>
<ul>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-jsl-3/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +1 other test skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-skl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-x1275/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-hsw-4770/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-8109u/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-8809g/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-bsw-nick/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-kbl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-guc/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-skl-6600u/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-jsl-1/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112080">fdo#112080</a>) +1 other test skip</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-cfl-8700k/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_pm_rpm@module-reload} (NEW):</p>
<ul>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-apl-guc/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/fi-glk-j4005/igt@kms_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-dg2-8/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13599/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7468 -&gt; IGTPW_9720</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13599: 58fe10f34e80d0eeb5609128faa135260623a715 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9720: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9720/index.html<br />
  IGT_7468: 7468</p>
<h2>Testlist changes</h2>
<p>+igt@kms_pm_backlight@bad-brightness<br />
+igt@kms_pm_backlight@basic-brightness<br />
+igt@kms_pm_backlight@fade<br />
+igt@kms_pm_backlight@fade-with-dpms<br />
+igt@kms_pm_backlight@fade-with-suspend<br />
+igt@kms_pm_dc@dc3co-vpb-simulation<br />
+igt@kms_pm_dc@dc5-dpms<br />
+igt@kms_pm_dc@dc5-dpms-negative<br />
+igt@kms_pm_dc@dc5-psr<br />
+igt@kms_pm_dc@dc6-dpms<br />
+igt@kms_pm_dc@dc6-psr<br />
+igt@kms_pm_dc@dc9-dpms<br />
+igt@kms_pm_lpsp@kms-lpsp<br />
+igt@kms_pm_lpsp@screens-disabled<br />
+igt@kms_pm_rpm@basic-pci-d3-state<br />
+igt@kms_pm_rpm@cursor<br />
+igt@kms_pm_rpm@cursor-dpms<br />
+igt@kms_pm_rpm@dpms-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@kms_pm_rpm@dpms-non-lpsp<br />
+igt@kms_pm_rpm@drm-resources-equal<br />
+igt@kms_pm_rpm@fences-dpms<br />
+igt@kms_pm_rpm@i2c<br />
+igt@kms_pm_rpm@legacy-planes<br />
+igt@kms_pm_rpm@legacy-planes-dpms<br />
+igt@kms_pm_rpm@modeset-lpsp<br />
+igt@kms_pm_rpm@modeset-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-non-lpsp<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
+igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
+igt@kms_pm_rpm@modeset-stress-extra-wait<br />
+igt@kms_pm_rpm@system-suspend-modeset<br />
+igt@kms_pm_rpm@universal-planes<br />
+igt@kms_pm_rpm@universal-planes-dpms<br />
-igt@i915_pm_backlight@bad-brightness<br />
-igt@i915_pm_backlight@basic-brightness<br />
-igt@i915_pm_backlight@fade<br />
-igt@i915_pm_backlight@fade-with-dpms<br />
-igt@i915_pm_backlight@fade-with-suspend<br />
-igt@i915_pm_dc@dc3co-vpb-simulation<br />
-igt@i915_pm_dc@dc5-dpms<br />
-igt@i915_pm_dc@dc5-dpms-negative<br />
-igt@i915_pm_dc@dc5-psr<br />
-igt@i915_pm_dc@dc6-dpms<br />
-igt@i915_pm_dc@dc6-psr<br />
-igt@i915_pm_dc@dc9-dpms<br />
-igt@i915_pm_lpsp@kms-lpsp<br />
-igt@i915_pm_lpsp@screens-disabled<br />
-igt@i915_pm_rpm@basic-pci-d3-state<br />
-igt@i915_pm_rpm@cursor<br />
-igt@i915_pm_rpm@cursor-dpms<br />
-igt@i915_pm_rpm@dpms-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@i915_pm_rpm@dpms-non-lpsp<br />
-igt@i915_pm_rpm@drm-resources-equal<br />
-igt@i915_pm_rpm@fences-dpms<br />
-igt@i915_pm_rpm@i2c<br />
-igt@i915_pm_rpm@legacy-planes<br />
-igt@i915_pm_rpm@legacy-planes-dpms<br />
-igt@i915_pm_rpm@modeset-lpsp<br />
-igt@i915_pm_rpm@modeset-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-non-lpsp<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
-igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
-igt@i915_pm_rpm@modeset-stress-extra-wait<br />
-igt@i915_pm_rpm@system-suspend-modeset<br />
-igt@i915_pm_rpm@universal-planes<br />
-igt@i915_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============2894320052926287278==--
