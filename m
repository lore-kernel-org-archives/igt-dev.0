Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5044296238893518271=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 09 Nov 2023 14:14:40 -0000
Message-ID: <169953928042.26591.15746629018999996151@emeril.freedesktop.org>
References: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231109110050.388343-1-sujaritha.sundaresan@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG11?=
 =?utf-8?q?lti-gt_support_for_RC6_residency_test_=28rev5=29?=
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

--===============5044296238893518271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add multi-gt support for RC6 residency test (rev5)
URL   : https://patchwork.freedesktop.org/series/126169/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13853 -> IGTPW_10149
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10149 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10149, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/index.html

Participating hosts (32 -> 34)
------------------------------

  Additional (3): fi-hsw-4770 bat-dg2-9 bat-mtlp-8 
  Missing    (1): fi-kbl-soraka 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10149:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-rplp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-rkl-11600/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adls-5:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adls-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-atsm-1:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-atsm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-jsl-3:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-jsl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-dg2-9:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adlp-11:        NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adln-1:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adln-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adlm-1:         NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-tgl-1115g4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - bat-adlp-6:         NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-adlp-9:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):
    - bat-atsm-1:         NOTRUN -> [FAIL][16] +4 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-atsm-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
    - fi-skl-guc:         NOTRUN -> [WARN][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
    - fi-cfl-8109u:       NOTRUN -> [WARN][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
    - fi-kbl-guc:         NOTRUN -> [WARN][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-14/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13853 and IGTPW_10149:

### New IGT tests (9) ###

  * igt@i915_pm_rc6_residency@rc6-fence@gt0:
    - Statuses : 29 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-fence@gt1:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - Statuses : 1 fail(s) 28 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0:
    - Statuses : 1 fail(s) 5 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - Statuses : 1 fail(s) 28 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - Statuses : 1 fail(s) 23 pass(s) 2 skip(s) 3 warn(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - Statuses : 1 fail(s) 25 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10149 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-mtlp-8:         NOTRUN -> [SKIP][21] ([i915#9318])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html

  * igt@gem_lmem_swapping@verify-random:
    - bat-mtlp-8:         NOTRUN -> [SKIP][22] ([i915#4613]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][23] ([i915#4083])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_mmap@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][24] ([i915#4083])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_mmap@basic.html

  * igt@gem_mmap_gtt@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][25] ([i915#4077]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_mmap_gtt@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][26] ([i915#4077]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_mmap_gtt@basic.html

  * igt@gem_render_tiled_blits@basic:
    - bat-dg2-9:          NOTRUN -> [SKIP][27] ([i915#4079]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_render_tiled_blits@basic.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][28] ([i915#4079]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][29] ([fdo#109271]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8700k/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][30] ([fdo#109271]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-bsw-nick/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][32] ([fdo#109271]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-x1275/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][33] ([fdo#109271]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][34] ([fdo#109271]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-ivb-3770/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][35] ([fdo#109271]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - fi-blb-e6850:       NOTRUN -> [SKIP][36] ([fdo#109271]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][37] ([fdo#109271]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-apl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][39] ([fdo#109271]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][40] ([fdo#109271]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-skl-guc:         NOTRUN -> [SKIP][41] ([fdo#109271]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][42] ([fdo#109271]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][43] ([fdo#109271]) +4 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][44] ([fdo#109271]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg2-9:          NOTRUN -> [SKIP][45] ([i915#6621])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@i915_pm_rps@basic-api.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][46] ([i915#6621])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_pm_rps@basic-api.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][47] ([i915#6645])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][48] ([i915#5190])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#5190])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][50] ([i915#5190])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][51] ([i915#4215] / [i915#5190])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][52] ([i915#4212]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - bat-dg2-9:          NOTRUN -> [SKIP][53] ([i915#4212]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-9:          NOTRUN -> [SKIP][54] ([i915#4212] / [i915#5608])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-dg2-9:          NOTRUN -> [SKIP][55] ([i915#4103] / [i915#4213] / [i915#5608]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][56] ([i915#4213]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-mtlp-8:         NOTRUN -> [SKIP][57] ([i915#3555] / [i915#3840] / [i915#9159])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp5:
    - bat-adlp-11:        [PASS][58] -> [DMESG-FAIL][59] ([i915#6868])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp5:
    - bat-adlp-11:        [PASS][60] -> [FAIL][61] ([i915#6121])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp5.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp5.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-11:        NOTRUN -> [SKIP][62] ([i915#3637])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg2-9:          NOTRUN -> [SKIP][63] ([fdo#109285])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][64] ([fdo#109285])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-9:          NOTRUN -> [SKIP][65] ([i915#5274])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][66] ([i915#5274])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][67] -> [FAIL][68] ([IGT#3])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:
    - fi-hsw-4770:        NOTRUN -> [SKIP][69] ([fdo#109271]) +14 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][70] ([i915#1845] / [i915#9197]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:
    - fi-hsw-4770:        NOTRUN -> [DMESG-WARN][71] ([i915#8841]) +6 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-dg2-9:          NOTRUN -> [SKIP][72] ([i915#1072]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#1072]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - bat-dg2-9:          NOTRUN -> [SKIP][74] ([i915#3555] / [i915#4098])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][75] ([i915#3555] / [i915#8809])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg2-9:          NOTRUN -> [SKIP][76] ([i915#3708])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-mmap:
    - bat-dg2-9:          NOTRUN -> [SKIP][77] ([i915#3708] / [i915#4077]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][78] ([i915#3708] / [i915#4077]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-fence-read:
    - bat-mtlp-8:         NOTRUN -> [SKIP][79] ([i915#3708]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-write:
    - bat-dg2-9:          NOTRUN -> [SKIP][80] ([i915#3291] / [i915#3708]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-write.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-apl-guc:         [DMESG-WARN][81] ([i915#180] / [i915#1982] / [i915#8585]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_module_load@reload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_module_load@reload.html

  * igt@i915_pm_rpm@module-reload:
    - fi-apl-guc:         [DMESG-WARN][83] ([i915#180] / [i915#8585]) -> [PASS][84] +3 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_pm_rpm@module-reload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@reset:
    - fi-apl-guc:         [DMESG-WARN][85] -> [PASS][86] +36 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_selftest@live@reset.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_selftest@live@reset.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [ABORT][87] ([i915#8213]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - fi-apl-guc:         [DMESG-WARN][89] ([i915#8585]) -> [PASS][90] +40 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp1:
    - fi-apl-guc:         [DMESG-WARN][91] ([i915#180] / [i915#8585] / [i915#8703]) -> [PASS][92] +36 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - fi-apl-guc:         [DMESG-WARN][93] ([i915#180] / [i915#1982] / [i915#8585] / [i915#8703]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [SKIP][95] -> [PASS][96] +3 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8585]: https://gitlab.freedesktop.org/drm/intel/issues/8585
  [i915#8703]: https://gitlab.freedesktop.org/drm/intel/issues/8703
  [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#9159]: https://gitlab.freedesktop.org/drm/intel/issues/9159
  [i915#9197]: https://gitlab.freedesktop.org/drm/intel/issues/9197
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7580 -> IGTPW_10149

  CI-20190529: 20190529
  CI_DRM_13853: 26b8362ceb8f25d54c0dc0f7f4806696b87885f5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10149: 10149
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/index.html

--===============5044296238893518271==
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
<tr><td><b>Series:</b></td><td>Add multi-gt support for RC6 residency test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126169/">https://patchwork.freedesktop.org/series/126169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13853 -&gt; IGTPW_10149</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10149 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10149, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/index.html</p>
<h2>Participating hosts (32 -&gt; 34)</h2>
<p>Additional (3): fi-hsw-4770 bat-dg2-9 bat-mtlp-8 <br />
  Missing    (1): fi-kbl-soraka </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10149:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-rplp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-rkl-11600/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adls-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-atsm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-jsl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adln-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-tgl-1115g4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-atsm-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a></p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a></p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rc6_residency@media-rc6-accuracy:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-14/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13853 and IGTPW_10149:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence@gt0:</p>
<ul>
<li>Statuses : 29 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence@gt1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 28 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0:</p>
<ul>
<li>Statuses : 1 fail(s) 5 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 28 pass(s) 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>Statuses : 1 fail(s) 23 pass(s) 2 skip(s) 3 warn(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>Statuses : 1 fail(s) 25 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10149 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_mmap_gtt@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8700k/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-bsw-nick/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-x1275/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-ivb-3770/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-pnv-d510/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +8 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9159">i915#9159</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@c-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@d-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9197">i915#9197</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8809">i915#8809</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>
<p>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-mtlp-8/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-dg2-9/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_module_load@reload.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@i915_selftest@live@reset.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@i915_selftest@live@reset.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> +40 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@c-dp1.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8585">i915#8585</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8703">i915#8703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/fi-apl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13853/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10149/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7580 -&gt; IGTPW_10149</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13853: 26b8362ceb8f25d54c0dc0f7f4806696b87885f5 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10149: 10149<br />
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5044296238893518271==--
