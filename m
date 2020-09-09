Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Sep 2020 09:03:41 -0000
Message-ID: <159964222123.8838.7976480125689412896@emeril.freedesktop.org>
References: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
In-Reply-To: <20200908090436.1344-1-sowmyax.kaparthi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fscaling=3A_set_minimum_height_and_width_to_20_=28?=
 =?utf-8?q?rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1455643437=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Atwood <matthew.s.atwood@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1455643437==
Content-Type: multipart/alternative;
 boundary="===============8677093866649899782=="

--===============8677093866649899782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: set minimum height and width to 20 (rev3)
URL   : https://patchwork.freedesktop.org/series/78536/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8989 -> IGTPW_4969
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html

Known issues
------------

  Here are the changes found in IGTPW_4969 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-ilk-650:         [PASS][1] -> [INCOMPLETE][2] ([i915#2439])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-bsw-kefka:       [PASS][3] -> [INCOMPLETE][4] ([i915#2439])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@gem_exec_parallel@engines@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-kefka/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-pnv-d510:        [PASS][5] -> [INCOMPLETE][6] ([i915#2439] / [i915#299])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-pnv-d510/igt@gem_tiled_fence_blits@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-pnv-d510/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@gem_execbuf:
    - fi-bsw-nick:        [PASS][7] -> [INCOMPLETE][8] ([i915#2439])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html

  
#### Possible fixes ####

  * igt@debugfs_test@read_all_entries:
    - {fi-kbl-7560u}:     [INCOMPLETE][9] ([i915#2417]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-bdw-gvtdvm:      [INCOMPLETE][11] ([i915#2439]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-byt-j1900:       [INCOMPLETE][13] ([i915#2439]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-byt-j1900/igt@gem_exec_parallel@engines@contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-byt-j1900/igt@gem_exec_parallel@engines@contexts.html
    - {fi-ehl-1}:         [INCOMPLETE][15] ([i915#2439]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-gdg-551:         [INCOMPLETE][17] ([i915#172] / [i915#2439]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@gem_execbuf:
    - fi-bsw-n3050:       [INCOMPLETE][19] ([i915#2439]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bsw-kefka:       [FAIL][21] ([i915#1436] / [i915#2109] / [i915#2439]) -> [FAIL][22] ([i915#2439])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-kefka/igt@runner@aborted.html
    - fi-kbl-r:           [FAIL][23] ([i915#2398] / [i915#2439]) -> [FAIL][24] ([i915#1784] / [i915#2398] / [i915#2439])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-r/igt@runner@aborted.html
    - fi-kbl-guc:         [FAIL][25] ([i915#1186] / [i915#1784] / [i915#2439]) -> [FAIL][26] ([i915#1186] / [i915#2439])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-guc/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-guc/igt@runner@aborted.html
    - fi-cml-u2:          [FAIL][27] ([i915#1186] / [i915#2082] / [i915#2439]) -> [FAIL][28] ([i915#1186] / [i915#2439])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cml-u2/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-cml-u2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#172]: https://gitlab.freedesktop.org/drm/intel/issues/172
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2109]: https://gitlab.freedesktop.org/drm/intel/issues/2109
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#2417]: https://gitlab.freedesktop.org/drm/intel/issues/2417
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#299]: https://gitlab.freedesktop.org/drm/intel/issues/299


Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4969

  CI-20190529: 20190529
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html

--===============8677093866649899782==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: set minimum height and width to 20 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/78536/">https://patchwork.freedesktop.org/series/78536/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8989 -&gt; IGTPW_4969</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4969 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ilk-650/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-ilk-650/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-kefka/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-pnv-d510/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-pnv-d510/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/299">i915#299</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2417">i915#2417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-7560u/igt@debugfs_test@read_all_entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-bdw-gvtdvm:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bdw-gvtdvm/igt@gem_exec_parallel@engines@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>
<p>fi-byt-j1900:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-byt-j1900/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-byt-j1900/igt@gem_exec_parallel@engines@contexts.html">PASS</a></p>
</li>
<li>
<p>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/172">i915#172</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2109">i915#2109</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5779 -&gt; IGTPW_4969</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4969/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8677093866649899782==--

--===============1455643437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1455643437==--
