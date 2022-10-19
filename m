Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3548434833187631998=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 19 Oct 2022 17:32:37 -0000
Message-ID: <166620075739.29708.16580218388811081258@emeril.freedesktop.org>
References: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20221019163029.19301-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv3=2C1/3=5D_lib/crc=3A_s/INTEL=5FPIPE?=
 =?utf-8?q?=5FCRC=5FSOURCE=5FAUTO/IGT=5FPIPE=5FCRC=5FSOURCE=5FAUTO/?=
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

--===============3548434833187631998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v3,1/3] lib/crc: s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/
URL   : https://patchwork.freedesktop.org/series/109900/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7020 -> IGTPW_7985
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7985 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7985, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html

Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-cml-u2 fi-tgl-dsi fi-icl-u2 fi-hsw-4770 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7985:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-4/igt@i915_selftest@live@migrate.html

  
Known issues
------------

  Here are the changes found in IGTPW_7985 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@hangcheck:
    - fi-ivb-3770:        [PASS][3] -> [INCOMPLETE][4] ([i915#7122])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][5] ([i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-4/igt@runner@aborted.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][6] ([fdo#109271] / [i915#4312])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ivb-3770/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][7] ([i915#7229]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-rpls-1}:       [DMESG-WARN][9] ([i915#6687]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_huc_copy@huc-copy:
    - {bat-dg2-8}:        [FAIL][11] ([i915#7029]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@gem_huc_copy@huc-copy.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-8/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gem_contexts:
    - {fi-ehl-2}:         [DMESG-FAIL][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html
    - {bat-jsl-3}:        [DMESG-FAIL][15] ([i915#7270]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
    - {bat-dg2-11}:       [DMESG-FAIL][17] ([i915#7270]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html
    - {bat-dg2-8}:        [DMESG-FAIL][19] ([i915#7270]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][21] ([i915#5278]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@requests:
    - {bat-adlp-6}:       [DMESG-FAIL][23] ([i915#7269]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-6/igt@i915_selftest@live@requests.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][25] ([i915#4983]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:
    - {bat-dg2-11}:       [FAIL][27] ([i915#6818]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#6818]: https://gitlab.freedesktop.org/drm/intel/issues/6818
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7122]: https://gitlab.freedesktop.org/drm/intel/issues/7122
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
  [i915#7270]: https://gitlab.freedesktop.org/drm/intel/issues/7270


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7020 -> IGTPW_7985

  CI-20190529: 20190529
  CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7985: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html
  IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html

--===============3548434833187631998==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v3,1/3] lib/crc: s/INTEL_PIPE_CRC_SOURCE_AUTO/IGT_PIPE_CRC_SOURCE_AUTO/</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109900/">https://patchwork.freedesktop.org/series/109900/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7020 -&gt; IGTPW_7985</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7985 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7985, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html</p>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-cml-u2 fi-tgl-dsi fi-icl-u2 fi-hsw-4770 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7985:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@migrate:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7985 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ivb-3770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7122">i915#7122</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ivb-3770/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7029">i915#7029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7269">i915#7269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-adlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6818">i915#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-dp-3.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7020 -&gt; IGTPW_7985</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7985: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7985/index.html<br />
  IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3548434833187631998==--
