Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8427746431289929922=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Tue, 31 May 2022 03:00:34 -0000
Message-ID: <165396603490.17346.15310014489259321151@emeril.freedesktop.org>
References: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220530133927.3864033-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgU2tpcCBp?=
 =?utf-8?q?f_current_=26_requested_BPC_doesn=27t_match_=28rev4=29?=
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

--===============8427746431289929922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Skip if current & requested BPC doesn't match (rev4)
URL   : https://patchwork.freedesktop.org/series/104275/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11710 -> IGTPW_7190
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7190 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7190, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html

Participating hosts (46 -> 45)
------------------------------

  Missing    (1): fi-bdw-5557u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7190:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdr@static-toggle:
    - bat-dg1-5:          NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-5/igt@kms_hdr@static-toggle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@workarounds:
    - {bat-adlm-1}:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/bat-adlm-1/igt@i915_selftest@live@workarounds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-adlm-1/igt@i915_selftest@live@workarounds.html

  * {igt@kms_hdr@bpc-switch@pipe-a-dp-2}:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8109u/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11710 and IGTPW_7190:

### New IGT tests (4) ###

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.81] s

  

Known issues
------------

  Here are the changes found in IGTPW_7190 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][5] -> [INCOMPLETE][6] ([i915#4785])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - bat-dg1-6:          NOTRUN -> [DMESG-FAIL][7] ([i915#4494] / [i915#4957])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][8] -> [DMESG-FAIL][9] ([i915#4528])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-6:          NOTRUN -> [INCOMPLETE][10] ([i915#6011])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_color@pipe-a-deep-color:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][11] ([fdo#109271]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-soraka/igt@kms_color@pipe-a-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][12] ([fdo#109271]) +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@kms_color@pipe-a-deep-color.html
    - bat-adlp-4:         NOTRUN -> [SKIP][13] ([i915#3555]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-adlp-4/igt@kms_color@pipe-a-deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][14] ([fdo#109271]) +6 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html

  * igt@kms_color@pipe-b-deep-color:
    - fi-rkl-guc:         NOTRUN -> [SKIP][15] ([i915#3555] / [i915#4070]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_color@pipe-b-deep-color.html
    - bat-dg1-6:          NOTRUN -> [SKIP][16] ([i915#3555]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@kms_color@pipe-b-deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][17] ([fdo#109271]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8700k/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-c-deep-color:
    - fi-kbl-guc:         NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-guc/igt@kms_color@pipe-c-deep-color.html
    - fi-snb-2600:        NOTRUN -> [SKIP][19] ([fdo#109271]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-snb-2600/igt@kms_color@pipe-c-deep-color.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][20] ([i915#3555] / [i915#4070]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_color@pipe-c-deep-color.html

  * igt@kms_color@pipe-d-deep-color:
    - fi-glk-dsi:         NOTRUN -> [SKIP][21] ([fdo#109271]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-glk-dsi/igt@kms_color@pipe-d-deep-color.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][22] ([fdo#109271]) +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#533])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@kms_color@pipe-d-deep-color.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][24] ([i915#4070] / [i915#533])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][25] ([i915#4070] / [i915#533])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#533])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-g3258/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_hdr@bpc-switch:
    - fi-bdw-gvtdvm:      NOTRUN -> [SKIP][27] ([fdo#109271]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bdw-gvtdvm/igt@kms_hdr@bpc-switch.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][28] ([fdo#109271]) +6 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-kefka/igt@kms_hdr@bpc-switch.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][29] ([fdo#109271]) +6 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-snb-2520m/igt@kms_hdr@bpc-switch.html
    - fi-rkl-guc:         NOTRUN -> [SKIP][30] ([i915#3555]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_hdr@bpc-switch.html
    - fi-skl-guc:         NOTRUN -> [SKIP][31] ([fdo#109271]) +6 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-guc/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-swap:
    - fi-elk-e7500:       NOTRUN -> [SKIP][32] ([fdo#109271]) +6 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-elk-e7500/igt@kms_hdr@static-swap.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][33] ([fdo#109271]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-nick/igt@kms_hdr@static-swap.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1845]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-guc/igt@kms_hdr@static-swap.html
    - fi-hsw-g3258:       NOTRUN -> [SKIP][35] ([fdo#109271]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-g3258/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - fi-tgl-u2:          NOTRUN -> [SKIP][36] ([i915#3555]) +6 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-u2/igt@kms_hdr@static-toggle.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][37] ([fdo#109271]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bxt-dsi/igt@kms_hdr@static-toggle.html
    - fi-bsw-n3050:       NOTRUN -> [SKIP][38] ([fdo#109271]) +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-n3050/igt@kms_hdr@static-toggle.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][39] ([i915#3555]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_hdr@static-toggle.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][40] ([fdo#109271]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@kms_hdr@static-toggle.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][41] ([fdo#109271]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-glk-j4005/igt@kms_hdr@static-toggle.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][42] ([fdo#109271]) +6 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-6700k2/igt@kms_hdr@static-toggle.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][43] ([fdo#109271]) +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8109u/igt@kms_hdr@static-toggle.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][44] ([fdo#109271]) +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-7567u/igt@kms_hdr@static-toggle.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][45] ([fdo#109271]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-8809g/igt@kms_hdr@static-toggle.html
    - fi-ilk-650:         NOTRUN -> [SKIP][46] ([fdo#109271]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-ilk-650/igt@kms_hdr@static-toggle.html
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][47] ([i915#3555]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-1115g4/igt@kms_hdr@static-toggle.html
    - fi-adl-ddr5:        NOTRUN -> [SKIP][48] ([i915#3555]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-adl-ddr5/igt@kms_hdr@static-toggle.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][49] ([fdo#109271]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-guc/igt@kms_hdr@static-toggle.html
    - fi-blb-e6850:       NOTRUN -> [SKIP][50] ([fdo#109271]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-blb-e6850/igt@kms_hdr@static-toggle.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][51] ([fdo#109271]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-6600u/igt@kms_hdr@static-toggle.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][52] ([fdo#109271] / [i915#4312] / [i915#5594])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][53] ([fdo#109271] / [i915#2403] / [i915#4312])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [INCOMPLETE][54] ([i915#4418]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@gt_pm:
    - fi-tgl-1115g4:      [DMESG-FAIL][56] ([i915#3987]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5171]: https://gitlab.freedesktop.org/drm/intel/issues/5171
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5594]: https://gitlab.freedesktop.org/drm/intel/issues/5594
  [i915#5874]: https://gitlab.freedesktop.org/drm/intel/issues/5874
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6500 -> IGTPW_7190

  CI-20190529: 20190529
  CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html
  IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html

--===============8427746431289929922==
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
<tr><td><b>Series:</b></td><td>Skip if current &amp; requested BPC doesn&#39;t match (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/104275/">https://patchwork.freedesktop.org/series/104275/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11710 -&gt; IGTPW_7190</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7190 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7190, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html</p>
<h2>Participating hosts (46 -&gt; 45)</h2>
<p>Missing    (1): fi-bdw-5557u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7190:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_hdr@static-toggle:<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-5/igt@kms_hdr@static-toggle.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-adlm-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/bat-adlm-1/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-adlm-1/igt@i915_selftest@live@workarounds.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@bpc-switch@pipe-a-dp-2}:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8109u/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11710 and IGTPW_7190:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7190 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>)</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6011">i915#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-soraka/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-adlp-4/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +2 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8700k/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-guc/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-snb-2600/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-glk-dsi/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bwr-2160/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-g3258/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>
<p>fi-bdw-gvtdvm:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bdw-gvtdvm/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-kefka/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-snb-2520m/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-guc/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-guc/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-elk-e7500/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-nick/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-guc/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +2 similar issues</p>
</li>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-g3258/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-u2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bxt-dsi/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-bsw-n3050/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-rkl-11600/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-glk-j4005/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-6700k2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-8109u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-7567u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-kbl-8809g/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-ilk-650/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-1115g4/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</p>
</li>
<li>
<p>fi-adl-ddr5:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-adl-ddr5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-cfl-guc/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-blb-e6850/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-skl-6600u/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5594">i915#5594</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11710/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#3987</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/fi-tgl-1115g4/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6500 -&gt; IGTPW_7190</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11710: d2798c4b9213f0d14080bdeef58e692a2c01a0bf @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7190/index.html<br />
  IGT_6500: de4c6076a0f38ad3522b08931748f59d59a925ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8427746431289929922==--
