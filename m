Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0497789195603688248=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 01 Feb 2022 12:41:31 -0000
Message-ID: <164371929104.2605.1704204414899699444@emeril.freedesktop.org>
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IHN1?=
 =?utf-8?q?btests_for_deep_color_=28rev6=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0497789195603688248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New subtests for deep color (rev6)
URL   : https://patchwork.freedesktop.org/series/99239/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11172 -> IGTPW_6590
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-icl-u2 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6590:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-rkl-guc/igt@kms_color@pipe-a-deep-color.html
    - bat-dg1-6:          NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-dg1-6/igt@kms_color@pipe-a-deep-color.html
    - {bat-jsl-2}:        NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-jsl-2/igt@kms_color@pipe-a-deep-color.html
    - {bat-jsl-1}:        NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-jsl-1/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-a-deep-color@degamma} (NEW):
    - bat-adlp-4:         NOTRUN -> [FAIL][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-adlp-4/igt@kms_color@pipe-a-deep-color@degamma.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-b-deep-color@degamma} (NEW):
    - {bat-adlp-6}:       NOTRUN -> [FAIL][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-adlp-6/igt@kms_color@pipe-b-deep-color@degamma.html

  * {igt@kms_color@pipe-d-deep-color} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-jsl-1/igt@kms_color@pipe-d-deep-color.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11172 and IGTPW_6590:

### New IGT tests (16) ###

  * igt@kms_color@pipe-a-deep-color:
    - Statuses : 29 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-a-deep-color@ctm:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_color@pipe-a-deep-color@degamma:
    - Statuses : 2 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.83] s

  * igt@kms_color@pipe-a-deep-color@gamma:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 3.52] s

  * igt@kms_color@pipe-b-deep-color:
    - Statuses : 29 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-deep-color@ctm:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.97] s

  * igt@kms_color@pipe-b-deep-color@degamma:
    - Statuses : 2 fail(s) 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.84] s

  * igt@kms_color@pipe-b-deep-color@gamma:
    - Statuses : 7 pass(s)
    - Exec time: [0.66, 4.26] s

  * igt@kms_color@pipe-c-deep-color:
    - Statuses : 30 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-deep-color@ctm:
    - Statuses : 6 pass(s)
    - Exec time: [0.64, 1.95] s

  * igt@kms_color@pipe-c-deep-color@degamma:
    - Statuses : 2 fail(s) 4 pass(s)
    - Exec time: [0.63, 2.81] s

  * igt@kms_color@pipe-c-deep-color@gamma:
    - Statuses : 6 pass(s)
    - Exec time: [0.66, 4.20] s

  * igt@kms_color@pipe-d-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@pipe-d-deep-color@ctm:
    - Statuses : 2 pass(s)
    - Exec time: [1.61, 1.95] s

  * igt@kms_color@pipe-d-deep-color@degamma:
    - Statuses : 2 fail(s)
    - Exec time: [2.42, 2.79] s

  * igt@kms_color@pipe-d-deep-color@gamma:
    - Statuses : 2 pass(s)
    - Exec time: [3.86, 4.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_6590 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_flink_basic@bad-flink:
    - fi-skl-6600u:       [PASS][10] -> [INCOMPLETE][11] ([i915#4547])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bsw-nick:        NOTRUN -> [SKIP][12] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][13] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][14] ([fdo#109271]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][15] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bwr-2160/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-a-deep-color@degamma} (NEW):
    - fi-snb-2600:        NOTRUN -> [SKIP][17] ([fdo#109271]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-snb-2600/igt@kms_color@pipe-a-deep-color@degamma.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][18] ([fdo#109271]) +21 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html
    - fi-ilk-650:         NOTRUN -> [SKIP][19] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ilk-650/igt@kms_color@pipe-b-deep-color.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-x1275/igt@kms_color@pipe-b-deep-color.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-kefka/igt@kms_color@pipe-b-deep-color.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][22] ([fdo#109271]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-c-deep-color} (NEW):
    - fi-glk-dsi:         NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-glk-dsi/igt@kms_color@pipe-c-deep-color.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][24] ([fdo#109278]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][25] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][27] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][28] ([fdo#109271]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bxt-dsi/igt@kms_color@pipe-c-deep-color.html

  * {igt@kms_color@pipe-d-deep-color} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][29] ([fdo#109278]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-snb-2520m/igt@kms_color@pipe-d-deep-color.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][32] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][33] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][34] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-8109u/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][35] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-7500u/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][38] ([fdo#109271])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-guc/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cml-u2:          [PASS][39] -> [DMESG-WARN][40] ([i915#4269])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        NOTRUN -> [SKIP][41] ([fdo#109271]) +66 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html

  
#### Possible fixes ####

  * igt@gem_ctx_exec@basic:
    - fi-bsw-nick:        [DMESG-WARN][42] ([i915#3428]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-bsw-nick/igt@gem_ctx_exec@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@gem_ctx_exec@basic.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][44] ([i915#5026]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-blb-e6850/igt@i915_selftest@live@requests.html

  
#### Warnings ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][46] ([i915#4494] / [i915#4957]) -> [DMESG-FAIL][47] ([i915#4957])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][48] ([i915#4312]) -> [FAIL][49] ([i915#2722] / [i915#4312])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-skl-6600u/igt@runner@aborted.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#4269]: https://gitlab.freedesktop.org/drm/intel/issues/4269
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547
  [i915#4898]: https://gitlab.freedesktop.org/drm/intel/issues/4898
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5026]: https://gitlab.freedesktop.org/drm/intel/issues/5026


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6337 -> IGTPW_6590

  CI-20190529: 20190529
  CI_DRM_11172: 466c37c518256a1c79ed5f6ed4d3db1866c17910 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html
  IGT_6337: 7c9c034619ef9dbfbfe041fbf3973a1cf1ac7a22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_color@pipe-a-deep-color
+igt@kms_color@pipe-b-deep-color
+igt@kms_color@pipe-c-deep-color
+igt@kms_color@pipe-d-deep-color
+igt@kms_color@pipe-e-deep-color
+igt@kms_color@pipe-f-deep-color

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html

--===============0497789195603688248==
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
<tr><td><b>Series:</b></td><td>New subtests for deep color (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99239/">https://patchwork.freedesktop.org/series/99239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11172 -&gt; IGTPW_6590</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-icl-u2 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6590:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-rkl-guc/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-dg1-6/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{bat-jsl-2}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-jsl-2/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{bat-jsl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-jsl-1/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color@degamma} (NEW):</p>
<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-adlp-4/igt@kms_color@pipe-a-deep-color@degamma.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color@degamma} (NEW):</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-adlp-6/igt@kms_color@pipe-b-deep-color@degamma.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-deep-color} (NEW):</p>
<ul>
<li>
<p>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-jsl-1/igt@kms_color@pipe-d-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-rkl-11600/igt@kms_color@pipe-d-deep-color.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11172 and IGTPW_6590:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@ctm:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@degamma:</p>
<ul>
<li>Statuses : 2 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.83] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-deep-color@gamma:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.51, 3.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>Statuses : 29 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@ctm:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@degamma:</p>
<ul>
<li>Statuses : 2 fail(s) 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color@gamma:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.66, 4.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>Statuses : 30 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@ctm:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.64, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@degamma:</p>
<ul>
<li>Statuses : 2 fail(s) 4 pass(s)</li>
<li>Exec time: [0.63, 2.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color@gamma:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.66, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@ctm:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.61, 1.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@degamma:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [2.42, 2.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color@gamma:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [3.86, 4.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6590 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_flink_basic@bad-flink:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6600u/igt@gem_flink_basic@bad-flink.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bwr-2160/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color@degamma} (NEW):</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-snb-2600/igt@kms_color@pipe-a-deep-color@degamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ilk-650/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-x1275/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-kefka/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-glk-dsi/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bxt-dsi/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-snb-2520m/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-8109u/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-7500u/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cfl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-cml-u2/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4269">i915#4269</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_exec@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-bsw-nick/igt@gem_ctx_exec@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-bsw-nick/igt@gem_ctx_exec@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5026">i915#5026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11172/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6337 -&gt; IGTPW_6590</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11172: 466c37c518256a1c79ed5f6ed4d3db1866c17910 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6590: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6590/index.html<br />
  IGT_6337: 7c9c034619ef9dbfbfe041fbf3973a1cf1ac7a22 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_color@pipe-a-deep-color<br />
+igt@kms_color@pipe-b-deep-color<br />
+igt@kms_color@pipe-c-deep-color<br />
+igt@kms_color@pipe-d-deep-color<br />
+igt@kms_color@pipe-e-deep-color<br />
+igt@kms_color@pipe-f-deep-color</p>

</body>
</html>

--===============0497789195603688248==--
