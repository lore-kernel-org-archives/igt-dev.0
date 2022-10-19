Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4873070886556429479=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aurabindo Pillai" <aurabindo.pillai@amd.com>
Date: Wed, 19 Oct 2022 20:46:44 -0000
Message-ID: <166621240490.29709.1431216274734700004@emeril.freedesktop.org>
References: <20221019195514.3676771-1-aurabindo.pillai@amd.com>
In-Reply-To: <20221019195514.3676771-1-aurabindo.pillai@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fcursor=3A_Change_API_for_collecting_the_CRC_for_A?=
 =?utf-8?q?MDGPU_=28rev2=29?=
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

--===============4873070886556429479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_cursor: Change API for collecting the CRC for AMDGPU (rev2)
URL   : https://patchwork.freedesktop.org/series/109905/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7020 -> IGTPW_7987
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7987 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7987, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html

Participating hosts (45 -> 40)
------------------------------

  Missing    (5): fi-cml-u2 fi-tgl-dsi fi-icl-u2 fi-snb-2520m fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7987:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-adl-ddr5:        [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-adl-ddr5/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-adl-ddr5/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@migrate:
    - bat-adlp-4:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-4/igt@i915_selftest@live@migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-4/igt@i915_selftest@live@migrate.html

  
Known issues
------------

  Here are the changes found in IGTPW_7987 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-adlp-4:         NOTRUN -> [FAIL][5] ([i915#4312])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][6] ([i915#7229]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - {bat-dg2-8}:        [FAIL][8] ([i915#7029]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@gem_huc_copy@huc-copy.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-8/igt@gem_huc_copy@huc-copy.html

  * igt@i915_selftest@live@gem_contexts:
    - {fi-ehl-2}:         [DMESG-FAIL][10] -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html
    - {bat-jsl-3}:        [DMESG-FAIL][12] ([i915#7270]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html
    - {bat-dg2-11}:       [DMESG-FAIL][14] ([i915#7270]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html
    - {bat-dg2-8}:        [DMESG-FAIL][16] ([i915#7270]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@hugepages:
    - {bat-rpls-2}:       [DMESG-WARN][18] ([i915#5278]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@hugepages.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-2/igt@i915_selftest@live@hugepages.html

  * igt@i915_selftest@live@requests:
    - {bat-adlp-6}:       [DMESG-FAIL][20] ([i915#7269]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-6/igt@i915_selftest@live@requests.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-6/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][22] ([i915#4983]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@reset.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][24] ([i915#6367]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-1/igt@i915_selftest@live@slpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6471]: https://gitlab.freedesktop.org/drm/intel/issues/6471
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#7029]: https://gitlab.freedesktop.org/drm/intel/issues/7029
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7269]: https://gitlab.freedesktop.org/drm/intel/issues/7269
  [i915#7270]: https://gitlab.freedesktop.org/drm/intel/issues/7270


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7020 -> IGTPW_7987

  CI-20190529: 20190529
  CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html
  IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html

--===============4873070886556429479==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_cursor: Change API for collecting the CRC for AMDGPU (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109905/">https://patchwork.freedesktop.org/series/109905/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7020 -&gt; IGTPW_7987</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7987 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7987, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html</p>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Missing    (5): fi-cml-u2 fi-tgl-dsi fi-icl-u2 fi-snb-2520m fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7987:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>fi-adl-ddr5:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-adl-ddr5/igt@i915_selftest@live@gem_contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-adl-ddr5/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-4/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-4/igt@i915_selftest@live@migrate.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7987 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-adlp-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7029">i915#7029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/fi-ehl-2/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-3}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-jsl-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-11/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
<li>
<p>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7270">i915#7270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-dg2-8/igt@i915_selftest@live@gem_contexts.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@hugepages.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5278">i915#5278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-2/igt@i915_selftest@live@hugepages.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-adlp-6/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7269">i915#7269</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-adlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7020/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7020 -&gt; IGTPW_7987</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12261: 41447224fdfbfbfd1e9ffa5fabc9d277f9c02f8a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7987: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7987/index.html<br />
  IGT_7020: 05b7eaf9ade2216d17c069c89439015757ee25f7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4873070886556429479==--
