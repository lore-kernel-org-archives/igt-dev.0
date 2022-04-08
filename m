Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5060113875553933649=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 08 Apr 2022 07:26:31 -0000
Message-ID: <164940279119.22680.10648991582074939272@emeril.freedesktop.org>
References: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220408065143.1485069-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_connector_=26_crtc_debugfs?=
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

--===============5060113875553933649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for connector & crtc debugfs
URL   : https://patchwork.freedesktop.org/series/102387/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11474 -> IGTPW_6902
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6902 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6902, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html

Participating hosts (50 -> 44)
------------------------------

  Additional (1): bat-dg2-8 
  Missing    (7): bat-adlm-1 fi-bsw-cyan fi-bwr-2160 fi-pnv-d510 fi-elk-e7500 fi-blb-e6850 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6902:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       [FAIL][1] ([i915#4312]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-x1275/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-x1275/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][3] ([i915#4312]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-soraka/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-soraka/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][5] ([i915#4312] / [i915#5257]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-7500u/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-7500u/igt@runner@aborted.html
    - fi-kbl-guc:         [FAIL][7] ([i915#4312] / [i915#5257]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-guc/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-guc/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_swapping@basic:
    - {bat-jsl-2}:        [SKIP][9] ([i915#5602]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-jsl-2/igt@gem_lmem_swapping@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-jsl-2/igt@gem_lmem_swapping@basic.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - {bat-adls-5}:       NOTRUN -> [SKIP][11] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-adls-5/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adlp-6}:       NOTRUN -> [SKIP][12] +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html

  * igt@runner@aborted:
    - {bat-dg2-8}:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-dg2-8/igt@runner@aborted.html
    - {bat-hsw-1}:        [FAIL][14] ([i915#4312]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-hsw-1/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-hsw-1/igt@runner@aborted.html
    - {bat-dg2-9}:        [FAIL][16] ([i915#4312]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-dg2-9/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-dg2-9/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_6902 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-process:
    - fi-ivb-3770:        NOTRUN -> [SKIP][18] ([fdo#109271]) +146 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@gem_close_race@basic-process.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-ivb-3770:        NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#5341])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  
#### Warnings ####

  * igt@gem_lmem_swapping@basic:
    - fi-hsw-g3258:       [FAIL][20] -> [FAIL][21] ([i915#5602])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-hsw-g3258/igt@gem_lmem_swapping@basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-hsw-g3258/igt@gem_lmem_swapping@basic.html
    - fi-cfl-8109u:       [FAIL][22] -> [FAIL][23] ([i915#5602])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html
    - fi-tgl-u2:          [FAIL][24] ([i915#5602]) -> [SKIP][25] ([i915#5602])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-tgl-u2/igt@gem_lmem_swapping@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-tgl-u2/igt@gem_lmem_swapping@basic.html
    - fi-cfl-guc:         [FAIL][26] -> [FAIL][27] ([i915#5602])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-guc/igt@gem_lmem_swapping@basic.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-guc/igt@gem_lmem_swapping@basic.html

  * igt@runner@aborted:
    - fi-ivb-3770:        [FAIL][28] -> [FAIL][29] ([i915#4312])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-ivb-3770/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@runner@aborted.html
    - fi-cfl-guc:         [FAIL][30] ([i915#4312] / [i915#5257]) -> [FAIL][31] ([i915#4312])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-guc/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5602]: https://gitlab.freedesktop.org/drm/intel/issues/5602


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6902

  CI-20190529: 20190529
  CI_DRM_11474: 7db06d19096d416d9cb1de42460c43ca726858d9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html

--===============5060113875553933649==
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
<tr><td><b>Series:</b></td><td>Add support for connector &amp; crtc debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102387/">https://patchwork.freedesktop.org/series/102387/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11474 -&gt; IGTPW_6902</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6902 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6902, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html</p>
<h2>Participating hosts (50 -&gt; 44)</h2>
<p>Additional (1): bat-dg2-8 <br />
  Missing    (7): bat-adlm-1 fi-bsw-cyan fi-bwr-2160 fi-pnv-d510 fi-elk-e7500 fi-blb-e6850 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6902:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-kbl-guc/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>{bat-jsl-2}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-jsl-2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-jsl-2/igt@gem_lmem_swapping@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>{bat-adls-5}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-adls-5/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-adlp-6}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>{bat-dg2-8}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-dg2-8/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>{bat-hsw-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-hsw-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-hsw-1/igt@runner@aborted.html">FAIL</a></p>
</li>
<li>
<p>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/bat-dg2-9/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/bat-dg2-9/igt@runner@aborted.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6902 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@gem_close_race@basic-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>fi-hsw-g3258:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-hsw-g3258/igt@gem_lmem_swapping@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-hsw-g3258/igt@gem_lmem_swapping@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-8109u/igt@gem_lmem_swapping@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-tgl-u2/igt@gem_lmem_swapping@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-tgl-u2/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-guc/igt@gem_lmem_swapping@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-guc/igt@gem_lmem_swapping@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5602">i915#5602</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11474/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6902</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11474: 7db06d19096d416d9cb1de42460c43ca726858d9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6902: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6902/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5060113875553933649==--
