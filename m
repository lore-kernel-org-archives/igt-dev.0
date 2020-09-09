Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Sep 2020 08:49:38 -0000
Message-ID: <159964137804.8836.15628075293283203568@emeril.freedesktop.org>
References: <20200909083125.2057105-1-apoorva1.singh@intel.com>
In-Reply-To: <20200909083125.2057105-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmmap=5Fwc=3A_Align_subtests_with_correct_function_calls?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1077582113=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1077582113==
Content-Type: multipart/alternative;
 boundary="===============5772098705567559677=="

--===============5772098705567559677==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_mmap_wc: Align subtests with correct function calls
URL   : https://patchwork.freedesktop.org/series/81485/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8989 -> IGTPW_4968
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4968 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4968, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4968:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_tiled_fence_blits@basic:
    - fi-snb-2520m:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-snb-2520m/igt@gem_tiled_fence_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-snb-2520m/igt@gem_tiled_fence_blits@basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4968 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-r:           [PASS][3] -> [INCOMPLETE][4] ([i915#2439])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-kbl-r/igt@gem_exec_gttfill@basic.html
    - fi-bdw-5557u:       [PASS][5] -> [INCOMPLETE][6] ([i915#2439])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html
    - fi-skl-6600u:       [PASS][7] -> [INCOMPLETE][8] ([i915#2439])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-6600u/igt@gem_exec_gttfill@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-6600u/igt@gem_exec_gttfill@basic.html
    - fi-skl-lmem:        [PASS][9] -> [INCOMPLETE][10] ([i915#2439])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-lmem/igt@gem_exec_gttfill@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-lmem/igt@gem_exec_gttfill@basic.html
    - fi-ilk-650:         [PASS][11] -> [INCOMPLETE][12] ([i915#2439])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ilk-650/igt@gem_exec_gttfill@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-ilk-650/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines@basic:
    - fi-bsw-n3050:       [PASS][13] -> [INCOMPLETE][14] ([i915#2439])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@gem_exec_parallel@engines@basic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-n3050/igt@gem_exec_parallel@engines@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - fi-bsw-kefka:       [PASS][15] -> [INCOMPLETE][16] ([i915#2439])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-blb-e6850:       [PASS][17] -> [INCOMPLETE][18] ([i915#2439])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html

  * igt@i915_selftest@live@gem_execbuf:
    - fi-bsw-nick:        [PASS][19] -> [INCOMPLETE][20] ([i915#2439])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-cfl-8109u:       [INCOMPLETE][21] ([i915#2439]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html
    - fi-icl-y:           [INCOMPLETE][23] ([i915#2439]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-icl-y/igt@gem_exec_gttfill@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-icl-y/igt@gem_exec_gttfill@basic.html
    - fi-cfl-8700k:       [INCOMPLETE][25] ([i915#2439]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8700k/igt@gem_exec_gttfill@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8700k/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_parallel@engines@contexts:
    - {fi-ehl-1}:         [INCOMPLETE][27] ([i915#2439]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_tiled_fence_blits@basic:
    - fi-gdg-551:         [INCOMPLETE][29] ([i915#172] / [i915#2439]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bsw-kefka:       [FAIL][31] ([i915#1436] / [i915#2109] / [i915#2439]) -> [FAIL][32] ([i915#2439])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-kefka/igt@runner@aborted.html
    - fi-cfl-8700k:       [FAIL][33] ([i915#1186] / [i915#2439]) -> [FAIL][34] ([i915#2398] / [i915#2439])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8700k/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8700k/igt@runner@aborted.html
    - fi-skl-6600u:       [FAIL][35] ([i915#2398] / [i915#2439]) -> [FAIL][36] ([i915#1186] / [i915#2439])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-6600u/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-6600u/igt@runner@aborted.html
    - fi-cfl-8109u:       [FAIL][37] ([i915#1186] / [i915#2439]) -> [FAIL][38] ([i915#2398] / [i915#2439])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8109u/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8109u/igt@runner@aborted.html
    - fi-skl-lmem:        [FAIL][39] ([i915#2398] / [i915#2439]) -> [FAIL][40] ([i915#1186] / [i915#2439])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-lmem/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-lmem/igt@runner@aborted.html
    - fi-kbl-r:           [FAIL][41] ([i915#2398] / [i915#2439]) -> [FAIL][42] ([i915#1186] / [i915#1784] / [i915#2439])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-kbl-r/igt@runner@aborted.html
    - fi-icl-y:           [FAIL][43] ([i915#2439]) -> [FAIL][44] ([i915#2398] / [i915#2439])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-icl-y/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-icl-y/igt@runner@aborted.html
    - fi-bsw-n3050:       [FAIL][45] ([i915#1436] / [i915#2109] / [i915#2439]) -> [FAIL][46] ([i915#2439])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-n3050/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1186]: https://gitlab.freedesktop.org/drm/intel/issues/1186
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#172]: https://gitlab.freedesktop.org/drm/intel/issues/172
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#2109]: https://gitlab.freedesktop.org/drm/intel/issues/2109
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439


Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5779 -> IGTPW_4968

  CI-20190529: 20190529
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_mmap_wc@write-gtt-read-wc
-igt@gem_mmap_wc@write-gtt-read-gtt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html

--===============5772098705567559677==
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
<tr><td><b>Series:</b></td><td>i915/gem_mmap_wc: Align subtests with correct function calls</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81485/">https://patchwork.freedesktop.org/series/81485/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8989 -&gt; IGTPW_4968</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4968 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4968, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4968:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_tiled_fence_blits@basic:<ul>
<li>fi-snb-2520m:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-snb-2520m/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-snb-2520m/igt@gem_tiled_fence_blits@basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4968 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-kbl-r/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-6600u/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-6600u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-lmem/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-lmem/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ilk-650/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-ilk-650/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@basic:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@gem_exec_parallel@engines@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-n3050/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_execbuf:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-icl-y/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-icl-y/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8700k/igt@gem_exec_gttfill@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8700k/igt@gem_exec_gttfill@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-ehl-1/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>fi-gdg-551:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/172">i915#172</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-gdg-551/igt@gem_tiled_fence_blits@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2109">i915#2109</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-kefka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-6600u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-skl-lmem:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-skl-lmem/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-skl-lmem/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-kbl-r:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-kbl-r/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1186">i915#1186</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-icl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-icl-y/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-icl-y/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8989/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2109">i915#2109</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
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
<li>IGT: IGT_5779 -&gt; IGTPW_4968</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8989: f38d31de4aa327d89646ad8c49e2f5cc68d3916a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4968: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4968/index.html<br />
  IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@gem_mmap_wc@write-gtt-read-wc<br />
-igt@gem_mmap_wc@write-gtt-read-gtt</p>

</body>
</html>

--===============5772098705567559677==--

--===============1077582113==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1077582113==--
