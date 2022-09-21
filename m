Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8061049144605758956=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Wed, 21 Sep 2022 11:35:01 -0000
Message-ID: <166376010116.11599.6693997549101835559@emeril.freedesktop.org>
References: <20220921085806.7223-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220921085806.7223-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fbacklight=3A_Add_new_subtest_to_validate_dual_?=
 =?utf-8?q?panel_backlight_=28rev2=29?=
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

--===============8061049144605758956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev2)
URL   : https://patchwork.freedesktop.org/series/108246/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12164 -> IGTPW_7810
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7810 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7810, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html

Participating hosts (34 -> 44)
------------------------------

  Additional (11): fi-rkl-11600 bat-dg1-5 bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adln-1 bat-jsl-3 bat-rpls-1 bat-dg2-11 
  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7810:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-icl-u2:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html
    - fi-tgl-u2:          [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - bat-dg1-5:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-adl-ddr5:        [SKIP][6] ([i915#1155]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][8] ([i915#3012]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_backlight@basic-brightness:
    - {bat-adln-1}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html
    - {fi-ehl-2}:         [PASS][11] -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html
    - {fi-tgl-mst}:       [SKIP][13] ([i915#1155]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlp-6}:       NOTRUN -> [SKIP][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html
    - {bat-jsl-3}:        NOTRUN -> [SKIP][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-11}:       NOTRUN -> [SKIP][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-8}:        NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlm-1}:       NOTRUN -> [SKIP][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
    - {fi-jsl-1}:         [PASS][20] -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rpls-1}:       NOTRUN -> [SKIP][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-9}:        NOTRUN -> [SKIP][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html

  
Known issues
------------

  Here are the changes found in IGTPW_7810 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-dg1-5:          NOTRUN -> [SKIP][24] ([i915#2582]) +4 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@fbdev@nullptr.html

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][25] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@gem_huc_copy@huc-copy.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][26] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][27] ([i915#4613]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][28] ([i915#4613]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_mmap@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][29] ([i915#4083])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_mmap@basic.html

  * igt@gem_tiled_blits@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][30] ([i915#4077]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - fi-rkl-11600:       NOTRUN -> [SKIP][31] ([i915#3282])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_tiled_pread_basic.html
    - bat-dg1-5:          NOTRUN -> [SKIP][32] ([i915#4079]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_tiled_pread_basic.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-skl-6600u:       [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html
    - fi-snb-2520m:       [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
    - fi-bxt-dsi:         [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
    - fi-glk-dsi:         [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rps@basic-api:
    - bat-dg1-5:          NOTRUN -> [SKIP][41] ([i915#6621])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@i915_pm_rps@basic-api.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][42] ([i915#5982])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][43] ([i915#4212]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg1-5:          NOTRUN -> [SKIP][44] ([i915#4215])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_busy@basic:
    - bat-dg1-5:          NOTRUN -> [SKIP][45] ([i915#1845] / [i915#4303])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_busy@basic.html

  * igt@kms_chamelium@dp-crc-fast:
    - bat-dg1-5:          NOTRUN -> [SKIP][46] ([fdo#111827]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][47] ([fdo#111827]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][48] ([fdo#111827]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor:
    - fi-rkl-11600:       NOTRUN -> [SKIP][49] ([i915#4103])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html
    - fi-icl-u2:          NOTRUN -> [SKIP][50] ([i915#4103])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          NOTRUN -> [WARN][51] ([i915#6008])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-dg1-5:          NOTRUN -> [SKIP][52] ([fdo#109285])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][53] ([fdo#109285] / [i915#4098])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html
    - fi-icl-u2:          NOTRUN -> [SKIP][54] ([fdo#109285])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg1-5:          NOTRUN -> [SKIP][55] ([i915#4078]) +14 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - fi-icl-u2:          NOTRUN -> [DMESG-WARN][56] ([i915#2867])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  * igt@kms_psr@primary_page_flip:
    - fi-rkl-11600:       NOTRUN -> [SKIP][57] ([i915#1072]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_psr@primary_page_flip.html
    - bat-dg1-5:          NOTRUN -> [SKIP][58] ([i915#1072] / [i915#4078]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_psr@primary_page_flip.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-rkl-11600:       NOTRUN -> [SKIP][59] ([i915#3555] / [i915#4098])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html
    - bat-dg1-5:          NOTRUN -> [SKIP][60] ([i915#3555])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html
    - fi-icl-u2:          NOTRUN -> [SKIP][61] ([i915#3555])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-fence-flip:
    - bat-dg1-5:          NOTRUN -> [SKIP][62] ([i915#1845] / [i915#3708])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html

  * igt@prime_vgem@basic-fence-read:
    - bat-dg1-5:          NOTRUN -> [SKIP][63] ([i915#3708]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - bat-dg1-5:          NOTRUN -> [SKIP][64] ([i915#3708] / [i915#4077]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-read:
    - fi-rkl-11600:       NOTRUN -> [SKIP][65] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@prime_vgem@basic-read.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][66] ([fdo#109295] / [i915#3301])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@prime_vgem@basic-userptr.html
    - bat-dg1-5:          NOTRUN -> [SKIP][67] ([i915#3708] / [i915#4873])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-userptr.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][68] ([fdo#109295] / [i915#3301] / [i915#3708])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@prime_vgem@basic-userptr.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-hsw-4770:        [SKIP][69] ([fdo#109271] / [i915#3012]) -> [SKIP][70] ([fdo#109271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html
    - fi-hsw-g3258:       [SKIP][71] ([fdo#109271] / [i915#3012]) -> [SKIP][72] ([fdo#109271])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html

  * igt@runner@aborted:
    - fi-kbl-guc:         [FAIL][73] ([i915#6219] / [i915#6884]) -> [FAIL][74] ([i915#6884])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-guc/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-guc/igt@runner@aborted.html
    - fi-kbl-8809g:       [FAIL][75] ([i915#6219] / [i915#6884]) -> [FAIL][76] ([i915#6884])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-8809g/igt@runner@aborted.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-8809g/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][77] ([i915#6219] / [i915#6884]) -> [FAIL][78] ([i915#6884])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-soraka/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-soraka/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4303]: https://gitlab.freedesktop.org/drm/intel/issues/4303
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008
  [i915#6219]: https://gitlab.freedesktop.org/drm/intel/issues/6219
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6816]: https://gitlab.freedesktop.org/drm/intel/issues/6816
  [i915#6884]: https://gitlab.freedesktop.org/drm/intel/issues/6884


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6659 -> IGTPW_7810

  CI-20190529: 20190529
  CI_DRM_12164: a1f63e144e545f0ce8f41f41005f2dfc552eb836 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7810: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_backlight@backlight_dpms_cycle

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html

--===============8061049144605758956==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108246/">https://patchwork.freedesktop.org/series/108246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12164 -&gt; IGTPW_7810</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7810 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7810, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html</p>
<h2>Participating hosts (34 -&gt; 44)</h2>
<p>Additional (11): fi-rkl-11600 bat-dg1-5 bat-dg2-8 bat-adlm-1 fi-icl-u2 bat-dg2-9 bat-adlp-6 bat-adln-1 bat-jsl-3 bat-rpls-1 bat-dg2-11 <br />
  Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7810:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>{bat-adln-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{fi-tgl-mst}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-tgl-mst/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-jsl-3}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-11}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
<li>
<p>{bat-dg2-9}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7810 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_mmap@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_busy@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4303">i915#4303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</p>
</li>
<li>
<p>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/bat-dg1-5/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4873">i915#4873</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-rkl-11600/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6219">i915#6219</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6219">i915#6219</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12164/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6219">i915#6219</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6884">i915#6884</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6659 -&gt; IGTPW_7810</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12164: a1f63e144e545f0ce8f41f41005f2dfc552eb836 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7810: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7810/index.html<br />
  IGT_6659: 1becf700a737a7a98555a0cfbe8566355377afb2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_backlight@backlight_dpms_cycle</p>

</body>
</html>

--===============8061049144605758956==--
