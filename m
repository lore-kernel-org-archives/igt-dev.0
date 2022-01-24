Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3228881537839079063=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Jan 2022 14:35:21 -0000
Message-ID: <164303492133.1340.2772082721512820700@emeril.freedesktop.org>
References: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220124112352.1970255-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTmV3IHN1?=
 =?utf-8?q?btests_for_deep_color?=
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

--===============3228881537839079063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: New subtests for deep color
URL   : https://patchwork.freedesktop.org/series/99239/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11125 -> IGTPW_6570
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html

Participating hosts (47 -> 37)
------------------------------

  Missing    (10): bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6570:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-rkl-guc/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-rkl-11600/igt@kms_color@pipe-b-deep-color.html
    - {fi-tgl-dsi}:       NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-d-deep-color} (NEW):
    - {fi-jsl-1}:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-jsl-1/igt@kms_color@pipe-d-deep-color.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11125 and IGTPW_6570:

### New IGT tests (4) ###

  * igt@kms_color@pipe-a-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-b-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-c-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color@pipe-d-deep-color:
    - Statuses : 34 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6570 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [PASS][5] -> [INCOMPLETE][6] ([i915#3303])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
    - fi-snb-2600:        [PASS][7] -> [INCOMPLETE][8] ([i915#3921])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  * {igt@kms_color@pipe-a-deep-color} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][9] ([fdo#109271]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html
    - fi-skl-6700k2:      NOTRUN -> [SKIP][10] ([fdo#109271]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][11] ([fdo#109271]) +3 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html
    - fi-snb-2600:        NOTRUN -> [SKIP][12] ([fdo#109271]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2600/igt@kms_color@pipe-a-deep-color.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][13] ([fdo#109271]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bwr-2160/igt@kms_color@pipe-a-deep-color.html

  * {igt@kms_color@pipe-b-deep-color} (NEW):
    - fi-blb-e6850:       NOTRUN -> [SKIP][14] ([fdo#109271]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html
    - fi-ilk-650:         NOTRUN -> [SKIP][15] ([fdo#109271]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ilk-650/igt@kms_color@pipe-b-deep-color.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][16] ([fdo#109271]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-pnv-d510/igt@kms_color@pipe-b-deep-color.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][17] ([fdo#109271]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-x1275/igt@kms_color@pipe-b-deep-color.html
    - fi-bsw-kefka:       NOTRUN -> [SKIP][18] ([fdo#109271]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-kefka/igt@kms_color@pipe-b-deep-color.html
    - fi-skl-6600u:       NOTRUN -> [SKIP][19] ([fdo#109271]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@kms_color@pipe-b-deep-color.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][20] ([fdo#109271]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html

  * {igt@kms_color@pipe-c-deep-color} (NEW):
    - fi-glk-dsi:         NOTRUN -> [SKIP][21] ([fdo#109271]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-glk-dsi/igt@kms_color@pipe-c-deep-color.html
    - {fi-ehl-2}:         NOTRUN -> [SKIP][22] ([fdo#109278]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][24] ([fdo#109271]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][25] ([fdo#109271]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-guc/igt@kms_color@pipe-c-deep-color.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][26] ([fdo#109271]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][27] ([fdo#109271]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bxt-dsi/igt@kms_color@pipe-c-deep-color.html

  * {igt@kms_color@pipe-d-deep-color} (NEW):
    - fi-cml-u2:          NOTRUN -> [SKIP][28] ([fdo#109278]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-8809g:       NOTRUN -> [SKIP][29] ([fdo#109271]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html
    - fi-snb-2520m:       NOTRUN -> [SKIP][30] ([fdo#109271]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2520m/igt@kms_color@pipe-d-deep-color.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][31] ([fdo#109271]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-8700k:       NOTRUN -> [SKIP][32] ([fdo#109271]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][33] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-8109u/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-7500u:       NOTRUN -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-7500u/igt@kms_color@pipe-d-deep-color.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][35] ([fdo#109271]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-nick/igt@kms_color@pipe-d-deep-color.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][36] ([fdo#109271]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-skl-guc:         NOTRUN -> [SKIP][37] ([fdo#109271]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html
    - fi-bdw-5557u:       NOTRUN -> [SKIP][38] ([fdo#109271]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bdw-5557u/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_psr@primary_page_flip:
    - fi-skl-6600u:       [PASS][39] -> [FAIL][40] ([i915#4547])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-skl-6600u/igt@kms_psr@primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@kms_psr@primary_page_flip.html

  * igt@runner@aborted:
    - fi-hsw-4770:        NOTRUN -> [FAIL][41] ([fdo#109271] / [i915#1436] / [i915#4312])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@runner@aborted.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-skl-6600u:       [FAIL][42] ([i915#1436] / [i915#4312]) -> [FAIL][43] ([i915#4312])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-skl-6600u/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4547]: https://gitlab.freedesktop.org/drm/intel/issues/4547


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6330 -> IGTPW_6570

  CI-20190529: 20190529
  CI_DRM_11125: 72ce6554b9638c2c453d74aa405cc425cc75e3da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6570: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html
  IGT_6330: f73008bac9a8db0779264b170f630483e9165764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_color@pipe-a-deep-color
+igt@kms_color@pipe-b-deep-color
+igt@kms_color@pipe-c-deep-color
+igt@kms_color@pipe-d-deep-color
+igt@kms_color@pipe-e-deep-color
+igt@kms_color@pipe-f-deep-color

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html

--===============3228881537839079063==
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
<tr><td><b>Series:</b></td><td>New subtests for deep color</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99239/">https://patchwork.freedesktop.org/series/99239/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11125 -&gt; IGTPW_6570</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html</p>
<h2>Participating hosts (47 -&gt; 37)</h2>
<p>Missing    (10): bat-dg1-6 bat-dg1-5 fi-hsw-4200u fi-bsw-cyan bat-adlp-6 fi-ctg-p8600 bat-rpls-1 fi-bdw-samus bat-jsl-2 bat-jsl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6570:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-rkl-guc/igt@kms_color@pipe-a-deep-color.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-rkl-11600/igt@kms_color@pipe-b-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{fi-tgl-dsi}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-tgl-dsi/igt@kms_color@pipe-b-deep-color.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-deep-color} (NEW):</p>
<ul>
<li>{fi-jsl-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-jsl-1/igt@kms_color@pipe-d-deep-color.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11125 and IGTPW_6570:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@kms_color@pipe-a-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>Statuses : 34 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6570 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3303">i915#3303</a>)</p>
</li>
<li>
<p>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-a-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-n3050/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6700k2/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ivb-3770/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2600/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bwr-2160/igt@kms_color@pipe-a-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-b-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-blb-e6850/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ilk-650/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-pnv-d510/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-x1275/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-kefka/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-soraka/igt@kms_color@pipe-b-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-c-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-glk-dsi/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-ehl-2/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-elk-e7500/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-7567u/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-guc/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bxt-dsi/igt@kms_color@pipe-c-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@pipe-d-deep-color} (NEW):</p>
<ul>
<li>
<p>fi-cml-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cml-u2/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-8809g/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-snb-2520m:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-snb-2520m/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-glk-j4005/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-8700k/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-cfl-8109u/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-7500u/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bsw-nick/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-kbl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-guc/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-bdw-5557u/igt@kms_color@pipe-d-deep-color.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4547">i915#4547</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-hsw-4770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11125/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6330 -&gt; IGTPW_6570</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11125: 72ce6554b9638c2c453d74aa405cc425cc75e3da @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6570: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6570/index.html<br />
  IGT_6330: f73008bac9a8db0779264b170f630483e9165764 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_color@pipe-a-deep-color<br />
+igt@kms_color@pipe-b-deep-color<br />
+igt@kms_color@pipe-c-deep-color<br />
+igt@kms_color@pipe-d-deep-color<br />
+igt@kms_color@pipe-e-deep-color<br />
+igt@kms_color@pipe-f-deep-color</p>

</body>
</html>

--===============3228881537839079063==--
