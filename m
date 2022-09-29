Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6729939006198283076=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 29 Sep 2022 11:59:09 -0000
Message-ID: <166445274929.11955.12552660666221818766@emeril.freedesktop.org>
References: <20220929092845.6684-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220929092845.6684-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fbacklight=3A_Add_new_subtest_to_validate_dual_?=
 =?utf-8?q?panel_backlight_=28rev4=29?=
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

--===============6729939006198283076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev4)
URL   : https://patchwork.freedesktop.org/series/108246/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6669 -> IGTPW_7886
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7886 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7886, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7886:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-skl-6600u:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html
    - fi-icl-u2:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html
    - fi-snb-2520m:       [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html
    - fi-tgl-u2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html
    - fi-bxt-dsi:         [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html
    - fi-glk-dsi:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html

  
#### Warnings ####

  * igt@i915_pm_backlight@basic-brightness:
    - fi-kbl-7567u:       [SKIP][13] ([fdo#109271]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-kbl-7567u/igt@i915_pm_backlight@basic-brightness.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-kbl-7567u/igt@i915_pm_backlight@basic-brightness.html
    - fi-ilk-650:         [SKIP][15] ([fdo#109271]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ilk-650/igt@i915_pm_backlight@basic-brightness.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ilk-650/igt@i915_pm_backlight@basic-brightness.html
    - fi-adl-ddr5:        [SKIP][17] ([i915#1155]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html
    - fi-cfl-guc:         [SKIP][19] ([fdo#109271]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-guc/igt@i915_pm_backlight@basic-brightness.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-guc/igt@i915_pm_backlight@basic-brightness.html
    - fi-bdw-5557u:       [SKIP][21] ([fdo#109271]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bdw-5557u/igt@i915_pm_backlight@basic-brightness.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bdw-5557u/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-guc:         [SKIP][23] ([i915#3012]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html
    - fi-cfl-8700k:       [SKIP][25] ([fdo#109271]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-8700k/igt@i915_pm_backlight@basic-brightness.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-8700k/igt@i915_pm_backlight@basic-brightness.html
    - fi-blb-e6850:       [SKIP][27] ([fdo#109271]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-blb-e6850/igt@i915_pm_backlight@basic-brightness.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-blb-e6850/igt@i915_pm_backlight@basic-brightness.html
    - fi-bsw-nick:        [SKIP][29] ([fdo#109271]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bsw-nick/igt@i915_pm_backlight@basic-brightness.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bsw-nick/igt@i915_pm_backlight@basic-brightness.html
    - fi-bdw-gvtdvm:      [SKIP][31] ([fdo#109271]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bdw-gvtdvm/igt@i915_pm_backlight@basic-brightness.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bdw-gvtdvm/igt@i915_pm_backlight@basic-brightness.html
    - fi-bsw-kefka:       [SKIP][33] ([fdo#109271]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bsw-kefka/igt@i915_pm_backlight@basic-brightness.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bsw-kefka/igt@i915_pm_backlight@basic-brightness.html
    - fi-hsw-4770:        [SKIP][35] ([fdo#109271] / [i915#3012]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html
    - fi-ivb-3770:        [SKIP][37] ([fdo#109271]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ivb-3770/igt@i915_pm_backlight@basic-brightness.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ivb-3770/igt@i915_pm_backlight@basic-brightness.html
    - fi-elk-e7500:       [SKIP][39] ([fdo#109271]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-elk-e7500/igt@i915_pm_backlight@basic-brightness.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-elk-e7500/igt@i915_pm_backlight@basic-brightness.html
    - fi-hsw-g3258:       [SKIP][41] ([fdo#109271] / [i915#3012]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html
    - fi-pnv-d510:        [SKIP][43] ([fdo#109271]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-pnv-d510/igt@i915_pm_backlight@basic-brightness.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-pnv-d510/igt@i915_pm_backlight@basic-brightness.html
    - fi-glk-j4005:       [SKIP][45] ([fdo#109271]) -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-glk-j4005/igt@i915_pm_backlight@basic-brightness.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-glk-j4005/igt@i915_pm_backlight@basic-brightness.html
    - fi-snb-2600:        [SKIP][47] ([fdo#109271]) -> [FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-snb-2600/igt@i915_pm_backlight@basic-brightness.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-snb-2600/igt@i915_pm_backlight@basic-brightness.html
    - fi-rkl-11600:       [SKIP][49] ([i915#3012]) -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html
    - bat-dg1-5:          [SKIP][51] ([i915#1155]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html
    - fi-skl-6700k2:      [SKIP][53] ([fdo#109271]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-skl-6700k2/igt@i915_pm_backlight@basic-brightness.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-skl-6700k2/igt@i915_pm_backlight@basic-brightness.html
    - fi-cfl-8109u:       [SKIP][55] ([fdo#109271]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-8109u/igt@i915_pm_backlight@basic-brightness.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-8109u/igt@i915_pm_backlight@basic-brightness.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_backlight@basic-brightness:
    - {bat-adln-1}:       [PASS][57] -> [FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html
    - {fi-ehl-2}:         [PASS][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlp-6}:       [PASS][61] -> [FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html
    - {bat-jsl-3}:        [PASS][63] -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-11}:       [SKIP][65] ([i915#1155]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-8}:        [SKIP][67] ([i915#1155]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html
    - {bat-adlm-1}:       [SKIP][69] ([i915#1155]) -> [FAIL][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-jsl-1}:        [PASS][71] -> [FAIL][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-jsl-1/igt@i915_pm_backlight@basic-brightness.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-jsl-1/igt@i915_pm_backlight@basic-brightness.html
    - {fi-jsl-1}:         [PASS][73] -> [FAIL][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rpls-1}:       [SKIP][75] ([i915#1155]) -> [FAIL][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-rplp-1}:       [PASS][77] -> [FAIL][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rplp-1/igt@i915_pm_backlight@basic-brightness.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rplp-1/igt@i915_pm_backlight@basic-brightness.html
    - {bat-dg2-9}:        [SKIP][79] ([i915#1155]) -> [FAIL][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html

  
Known issues
------------

  Here are the changes found in IGTPW_7886 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       [PASS][81] -> [FAIL][82] ([fdo#103375])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-icl-u2:          NOTRUN -> [INCOMPLETE][83] ([i915#4890])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_selftest@live@gem_contexts.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-hsw-4770:        NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rplp-1}:       [DMESG-WARN][85] ([i915#2867]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_selftest@live@gt_pm:
    - fi-icl-u2:          [INCOMPLETE][87] ([i915#4890]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-icl-u2/igt@i915_selftest@live@gt_pm.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][89] ([i915#4785]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - {bat-dg2-11}:       [FAIL][91] ([i915#6818]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4890]: https://gitlab.freedesktop.org/drm/intel/issues/4890
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6669 -> IGTPW_7886

  CI-20190529: 20190529
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7886: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html

--===============6729939006198283076==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_backlight: Add new subtest to validate dual panel backlight (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/108246/">https://patchwork.freedesktop.org/series/108246/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6669 -&gt; IGTPW_7886</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7886 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7886, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7886:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-skl-6600u/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-snb-2520m/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-tgl-u2/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bxt-dsi/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-glk-dsi/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
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
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-kbl-7567u/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-kbl-7567u/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ilk-650/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ilk-650/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-adl-ddr5/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bdw-5557u/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bdw-5557u/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-guc/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-8700k/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-8700k/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-blb-e6850/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-blb-e6850/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bsw-nick/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bsw-nick/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bdw-gvtdvm/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bdw-gvtdvm/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-bsw-kefka/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-bsw-kefka/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ivb-3770/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ivb-3770/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-elk-e7500/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-elk-e7500/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-g3258/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-pnv-d510/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-pnv-d510/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-glk-j4005/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-glk-j4005/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-snb-2600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-snb-2600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-11600/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg1-5/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-skl-6700k2/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-skl-6700k2/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-cfl-8109u/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-cfl-8109u/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
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
<p>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adln-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-ehl-2/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adlp-6/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-jsl-3/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-11/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-8/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-adlm-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-jsl-1/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-jsl-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-jsl-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rpls-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rplp-1/igt@i915_pm_backlight@basic-brightness.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rplp-1/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-9/igt@i915_pm_backlight@basic-brightness.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7886 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_selftest@live@gem_contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-rplp-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-icl-u2/igt@i915_selftest@live@gt_pm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4890">i915#4890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-icl-u2/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6669/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6818">i915#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6669 -&gt; IGTPW_7886</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12197: cafa326de8e7860d45639e61bf66ec9c218207b1 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7886: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7886/index.html<br />
  IGT_6669: 3d2df081c14c251e0269e3510ddc4e9d26ffe925 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6729939006198283076==--
