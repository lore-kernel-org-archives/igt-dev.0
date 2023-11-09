Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0352917405266142126=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Thu, 09 Nov 2023 07:55:47 -0000
Message-ID: <169951654720.26590.13242639453086665025@emeril.freedesktop.org>
References: <20231109063212.359798-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231109063212.359798-1-sujaritha.sundaresan@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQWRkIG11?=
 =?utf-8?q?lti-gt_support_for_RC6_residency_test_=28rev2=29?=
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

--===============0352917405266142126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add multi-gt support for RC6 residency test (rev2)
URL   : https://patchwork.freedesktop.org/series/126169/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7578 -> IGTPW_10142
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10142 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10142, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/index.html

Participating hosts (34 -> 32)
------------------------------

  Additional (1): bat-adlp-11 
  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10142:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - bat-rplp-1:         NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rplp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-rkl-11600/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adls-5:         NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adls-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-atsm-1:         NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-atsm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-jsl-3:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adlp-11:        NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adln-1:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adln-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - bat-adlm-1:         NOTRUN -> [SKIP][9] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][10] +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-tgl-1115g4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - bat-rpls-1:         NOTRUN -> [SKIP][11] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rpls-1/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-adlp-6:         NOTRUN -> [SKIP][12] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][13] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-adlp-9:         NOTRUN -> [SKIP][14] +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - bat-dg2-11:         NOTRUN -> [SKIP][15] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * {igt@i915_pm_rc6_residency@rc6-fence@gt0} (NEW):
    - bat-atsm-1:         NOTRUN -> [FAIL][16] +5 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-atsm-1/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][17] +4 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
    - bat-mtlp-6:         NOTRUN -> [FAIL][18] +6 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
    - bat-jsl-3:          NOTRUN -> [FAIL][19] +4 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@i915_pm_rc6_residency@rc6-fence@gt0.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][20] +3 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-fence@gt0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0} (NEW):
    - fi-rkl-11600:       NOTRUN -> [FAIL][21] +4 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-rkl-11600/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][22] +4 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-adls-5:         NOTRUN -> [FAIL][23] +4 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adls-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-apl-guc:         NOTRUN -> [FAIL][24] +4 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][25] +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-adlp-9:         NOTRUN -> [FAIL][26] +4 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-skl-guc:         NOTRUN -> [FAIL][27] +4 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-dg2-11:         NOTRUN -> [FAIL][28] +5 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][29] +4 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-adln-1:         NOTRUN -> [FAIL][30] +4 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adln-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][31] +4 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - {bat-dg2-14}:       NOTRUN -> [FAIL][32] +5 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][33] +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-adlm-1:         NOTRUN -> [FAIL][34] +4 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlm-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - bat-rplp-1:         NOTRUN -> [FAIL][35] +4 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rplp-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][36] +4 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0} (NEW):
    - bat-mtlp-8:         NOTRUN -> [FAIL][37] +6 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):
    - fi-kbl-guc:         NOTRUN -> [FAIL][38] +4 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - bat-rpls-1:         NOTRUN -> [FAIL][39] +4 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rpls-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html
    - bat-adlp-6:         NOTRUN -> [FAIL][40] +4 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0} (NEW):
    - fi-kbl-x1275:       NOTRUN -> [FAIL][41] +4 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
    - bat-adlp-11:        NOTRUN -> [FAIL][42] +4 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][43] +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [PASS][44] -> [SKIP][45] +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - {bat-dg2-14}:       NOTRUN -> [SKIP][46] +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-14/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  
New tests
---------

  New tests have been introduced between IGT_7578 and IGTPW_10142:

### New IGT tests (9) ###

  * igt@i915_pm_rc6_residency@rc6-fence@gt0:
    - Statuses : 28 fail(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-fence@gt1:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
    - Statuses : 28 fail(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:
    - Statuses : 28 fail(s) 3 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - Statuses : 26 fail(s) 2 skip(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
    - Statuses : 25 fail(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  * igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0:
    - Statuses : 2 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_10142 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-11:        NOTRUN -> [SKIP][47] ([i915#9318])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@debugfs_test@basic-hwmon.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-11:        NOTRUN -> [SKIP][48] ([i915#3282])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - fi-cfl-8700k:       NOTRUN -> [SKIP][49] ([fdo#109271]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8700k/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][50] ([fdo#109271]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-bsw-nick/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][51] ([fdo#109271]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][52] ([fdo#109271]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-x1275/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][53] ([fdo#109271]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8109u/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][54] ([fdo#109271]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ivb-3770/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][55] ([fdo#109271]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - fi-blb-e6850:       NOTRUN -> [SKIP][56] ([fdo#109271]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][57] ([fdo#109271]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-apl-guc:         NOTRUN -> [SKIP][58] ([fdo#109271]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][59] ([fdo#109271]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-skl-guc:         NOTRUN -> [SKIP][60] ([fdo#109271]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][61] ([fdo#109271]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):
    - fi-ilk-650:         NOTRUN -> [SKIP][62] ([fdo#109271]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):
    - fi-elk-e7500:       NOTRUN -> [SKIP][63] ([fdo#109271]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-11:        NOTRUN -> [SKIP][64] ([i915#4103] / [i915#5608]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-11:        NOTRUN -> [SKIP][65] ([i915#3555] / [i915#3840])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-11:        NOTRUN -> [SKIP][66] ([i915#4093]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-11:        NOTRUN -> [SKIP][67] ([i915#4369])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][68] ([i915#1845] / [i915#3546]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-skl-guc:         [DMESG-FAIL][69] ([i915#9549]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-guc/igt@i915_selftest@live@hangcheck.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9549]: https://gitlab.freedesktop.org/drm/intel/issues/9549


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7578 -> IGTPW_10142

  CI-20190529: 20190529
  CI_DRM_13852: 8040e9d346531d98ca164092c860c24c1dd6e845 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10142: 10142
  IGT_7578: 2cf20c8dc5e372674ec3e3dd30b042794e9520ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_psr@basic
+igt@kms_psr@cursor_blt
+igt@kms_psr@cursor_mmap_cpu
+igt@kms_psr@cursor_mmap_gtt
+igt@kms_psr@cursor_plane_move
+igt@kms_psr@cursor_plane_onoff
+igt@kms_psr@cursor_render
+igt@kms_psr@dpms
+igt@kms_psr@no_drrs
+igt@kms_psr@primary_blt
+igt@kms_psr@primary_mmap_cpu
+igt@kms_psr@primary_mmap_gtt
+igt@kms_psr@primary_page_flip
+igt@kms_psr@primary_render
+igt@kms_psr@sprite_blt
+igt@kms_psr@sprite_mmap_cpu
+igt@kms_psr@sprite_mmap_gtt
+igt@kms_psr@sprite_plane_move
+igt@kms_psr@sprite_plane_onoff
+igt@kms_psr@sprite_render
+igt@kms_psr@suspend
-igt@kms_psr@pr_basic
-igt@kms_psr@pr_cursor_blt
-igt@kms_psr@pr_cursor_mmap_cpu
-igt@kms_psr@pr_cursor_mmap_gtt
-igt@kms_psr@pr_cursor_plane_move
-igt@kms_psr@pr_cursor_plane_onoff
-igt@kms_psr@pr_cursor_render
-igt@kms_psr@pr_dpms
-igt@kms_psr@pr_no_drrs
-igt@kms_psr@pr_primary_blt
-igt@kms_psr@pr_primary_mmap_cpu
-igt@kms_psr@pr_primary_mmap_gtt
-igt@kms_psr@pr_primary_page_flip
-igt@kms_psr@pr_primary_render
-igt@kms_psr@pr_sprite_blt
-igt@kms_psr@pr_sprite_mmap_cpu
-igt@kms_psr@pr_sprite_mmap_gtt
-igt@kms_psr@pr_sprite_plane_move
-igt@kms_psr@pr_sprite_plane_onoff
-igt@kms_psr@pr_sprite_render
-igt@kms_psr@pr_suspend
-igt@kms_psr@psr_basic
-igt@kms_psr@psr_cursor_blt
-igt@kms_psr@psr_cursor_mmap_cpu
-igt@kms_psr@psr_cursor_mmap_gtt
-igt@kms_psr@psr_cursor_plane_move
-igt@kms_psr@psr_cursor_plane_onoff
-igt@kms_psr@psr_cursor_render
-igt@kms_psr@psr_dpms
-igt@kms_psr@psr_no_drrs
-igt@kms_psr@psr_primary_blt
-igt@kms_psr@psr_primary_mmap_cpu
-igt@kms_psr@psr_primary_mmap_gtt
-igt@kms_psr@psr_primary_page_flip
-igt@kms_psr@psr_primary_render
-igt@kms_psr@psr_sprite_blt
-igt@kms_psr@psr_sprite_mmap_cpu
-igt@kms_psr@psr_sprite_mmap_gtt
-igt@kms_psr@psr_sprite_plane_move
-igt@kms_psr@psr_sprite_plane_onoff
-igt@kms_psr@psr_sprite_render
-igt@kms_psr@psr_suspend

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/index.html

--===============0352917405266142126==
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
<tr><td><b>Series:</b></td><td>Add multi-gt support for RC6 residency test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126169/">https://patchwork.freedesktop.org/series/126169/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7578 -&gt; IGTPW_10142</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10142 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10142, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/index.html</p>
<h2>Participating hosts (34 -&gt; 32)</h2>
<p>Additional (1): bat-adlp-11 <br />
  Missing    (3): fi-hsw-4770 bat-dg2-9 fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10142:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rplp-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-rkl-11600/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adls-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-atsm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adln-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-8/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlm-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-tgl-1115g4/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rpls-1/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-fence@gt0} (NEW):</p>
<ul>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-atsm-1/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">FAIL</a> +5 other tests fail</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-guc/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-6/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">FAIL</a> +6 other tests fail</p>
</li>
<li>
<p>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ivb-3770/igt@i915_pm_rc6_residency@rc6-fence@gt0.html">FAIL</a> +3 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-rkl-11600/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adls-5/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-11/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +5 other tests fail</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adln-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adln-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8700k/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-14/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +5 other tests fail</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-bsw-nick/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adlm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlm-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rplp-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-tgl-1115g4/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0} (NEW):</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-mtlp-8/igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-guc/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-rpls-1/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-6/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">FAIL</a> +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0} (NEW):</p>
<ul>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-x1275/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8109u/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html">FAIL</a> +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rc6_residency@media-rc6-accuracy:<ul>
<li>{bat-dg2-14}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-dg2-14/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7578 and IGTPW_10142:</p>
<h3>New IGT tests (9)</h3>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence@gt0:</p>
<ul>
<li>Statuses : 28 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence@gt1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:</p>
<ul>
<li>Statuses : 28 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-ccs0:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0:</p>
<ul>
<li>Statuses : 28 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>Statuses : 26 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:</p>
<ul>
<li>Statuses : 25 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt1-vcs0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt1-vecs0:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10142 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8700k/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-bsw-nick/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-x1275/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-cfl-8109u/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ivb-3770/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-guc/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-blb-e6850/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 other tests skip</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-6600u/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-apl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-apl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-glk-j4005/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-kbl-7567u/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0} (NEW):</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-ilk-650/igt@i915_pm_rc6_residency@rc6-idle@gt0-rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0} (NEW):</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-elk-e7500/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-11/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4369">i915#4369</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7578/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9549">i915#9549</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10142/fi-skl-guc/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7578 -&gt; IGTPW_10142</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13852: 8040e9d346531d98ca164092c860c24c1dd6e845 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10142: 10142<br />
  IGT_7578: 2cf20c8dc5e372674ec3e3dd30b042794e9520ab @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_psr@basic<br />
+igt@kms_psr@cursor_blt<br />
+igt@kms_psr@cursor_mmap_cpu<br />
+igt@kms_psr@cursor_mmap_gtt<br />
+igt@kms_psr@cursor_plane_move<br />
+igt@kms_psr@cursor_plane_onoff<br />
+igt@kms_psr@cursor_render<br />
+igt@kms_psr@dpms<br />
+igt@kms_psr@no_drrs<br />
+igt@kms_psr@primary_blt<br />
+igt@kms_psr@primary_mmap_cpu<br />
+igt@kms_psr@primary_mmap_gtt<br />
+igt@kms_psr@primary_page_flip<br />
+igt@kms_psr@primary_render<br />
+igt@kms_psr@sprite_blt<br />
+igt@kms_psr@sprite_mmap_cpu<br />
+igt@kms_psr@sprite_mmap_gtt<br />
+igt@kms_psr@sprite_plane_move<br />
+igt@kms_psr@sprite_plane_onoff<br />
+igt@kms_psr@sprite_render<br />
+igt@kms_psr@suspend<br />
-igt@kms_psr@pr_basic<br />
-igt@kms_psr@pr_cursor_blt<br />
-igt@kms_psr@pr_cursor_mmap_cpu<br />
-igt@kms_psr@pr_cursor_mmap_gtt<br />
-igt@kms_psr@pr_cursor_plane_move<br />
-igt@kms_psr@pr_cursor_plane_onoff<br />
-igt@kms_psr@pr_cursor_render<br />
-igt@kms_psr@pr_dpms<br />
-igt@kms_psr@pr_no_drrs<br />
-igt@kms_psr@pr_primary_blt<br />
-igt@kms_psr@pr_primary_mmap_cpu<br />
-igt@kms_psr@pr_primary_mmap_gtt<br />
-igt@kms_psr@pr_primary_page_flip<br />
-igt@kms_psr@pr_primary_render<br />
-igt@kms_psr@pr_sprite_blt<br />
-igt@kms_psr@pr_sprite_mmap_cpu<br />
-igt@kms_psr@pr_sprite_mmap_gtt<br />
-igt@kms_psr@pr_sprite_plane_move<br />
-igt@kms_psr@pr_sprite_plane_onoff<br />
-igt@kms_psr@pr_sprite_render<br />
-igt@kms_psr@pr_suspend<br />
-igt@kms_psr@psr_basic<br />
-igt@kms_psr@psr_cursor_blt<br />
-igt@kms_psr@psr_cursor_mmap_cpu<br />
-igt@kms_psr@psr_cursor_mmap_gtt<br />
-igt@kms_psr@psr_cursor_plane_move<br />
-igt@kms_psr@psr_cursor_plane_onoff<br />
-igt@kms_psr@psr_cursor_render<br />
-igt@kms_psr@psr_dpms<br />
-igt@kms_psr@psr_no_drrs<br />
-igt@kms_psr@psr_primary_blt<br />
-igt@kms_psr@psr_primary_mmap_cpu<br />
-igt@kms_psr@psr_primary_mmap_gtt<br />
-igt@kms_psr@psr_primary_page_flip<br />
-igt@kms_psr@psr_primary_render<br />
-igt@kms_psr@psr_sprite_blt<br />
-igt@kms_psr@psr_sprite_mmap_cpu<br />
-igt@kms_psr@psr_sprite_mmap_gtt<br />
-igt@kms_psr@psr_sprite_plane_move<br />
-igt@kms_psr@psr_sprite_plane_onoff<br />
-igt@kms_psr@psr_sprite_render<br />
-igt@kms_psr@psr_suspend</p>

</body>
</html>

--===============0352917405266142126==--
