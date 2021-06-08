Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Jun 2021 20:08:21 -0000
Message-ID: <162318290101.421.8683612616923376501@emeril.freedesktop.org>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=5D_tests/gem=5Fexec=5Freloc=3A_Remove_b?=
 =?utf-8?q?anned_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0086035950=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0086035950==
Content-Type: multipart/alternative;
 boundary="===============0374440975430047995=="

--===============0374440975430047995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t] tests/gem_exec_reloc: Remove banned tests (rev2)
URL   : https://patchwork.freedesktop.org/series/91160/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10194 -> IGTPW_5901
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html

Known issues
------------

  Here are the changes found in IGTPW_5901 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_cs_nop@sync-fork-compute0:
    - fi-snb-2600:        NOTRUN -> [SKIP][1] ([fdo#109271]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-u2:          [PASS][2] -> [FAIL][3] ([i915#1888])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-tgl-y:           [PASS][4] -> [DMESG-FAIL][5] ([i915#541])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-snb-2600:        [INCOMPLETE][6] ([i915#2782]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-snb-2600/igt@i915_selftest@live@hangcheck.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-snb-2600/igt@i915_selftest@live@hangcheck.html

  
#### Warnings ####

  * igt@i915_selftest@live@execlists:
    - fi-icl-u2:          [INCOMPLETE][8] ([i915#2782] / [i915#3462]) -> [DMESG-FAIL][9] ([i915#3462])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-icl-u2/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-icl-u2/igt@i915_selftest@live@execlists.html
    - fi-tgl-u2:          [INCOMPLETE][10] ([i915#3462]) -> [DMESG-FAIL][11] ([i915#3462])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-u2/igt@i915_selftest@live@execlists.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-u2/igt@i915_selftest@live@execlists.html

  * igt@runner@aborted:
    - fi-cfl-8700k:       [FAIL][12] ([i915#3363]) -> [FAIL][13] ([i915#2426] / [i915#3363])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cfl-8700k/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cfl-8700k/igt@runner@aborted.html
    - fi-icl-u2:          [FAIL][14] ([i915#2782] / [i915#3363]) -> [FAIL][15] ([i915#2426] / [i915#2782] / [i915#3363])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-icl-u2/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-icl-u2/igt@runner@aborted.html
    - fi-glk-dsi:         [FAIL][16] ([i915#2426] / [i915#3363] / [k.org#202321]) -> [FAIL][17] ([i915#3363] / [k.org#202321])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-glk-dsi/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-glk-dsi/igt@runner@aborted.html
    - fi-kbl-8809g:       [FAIL][18] ([i915#1436] / [i915#3363]) -> [FAIL][19] ([i915#1436] / [i915#2426] / [i915#3363])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-8809g/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-8809g/igt@runner@aborted.html
    - fi-bdw-5557u:       [FAIL][20] ([i915#2426] / [i915#3462]) -> [FAIL][21] ([i915#3462])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-bdw-5557u/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-bdw-5557u/igt@runner@aborted.html
    - fi-kbl-soraka:      [FAIL][22] ([i915#1436] / [i915#3363]) -> [FAIL][23] ([i915#1436] / [i915#2426] / [i915#3363])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-soraka/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-soraka/igt@runner@aborted.html
    - fi-kbl-7500u:       [FAIL][24] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][25] ([i915#1436] / [i915#3363])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-7500u/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-7500u/igt@runner@aborted.html
    - fi-cml-u2:          [FAIL][26] ([i915#2082] / [i915#2426] / [i915#3363] / [i915#3462]) -> [FAIL][27] ([i915#3363] / [i915#3462])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cml-u2/igt@runner@aborted.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cml-u2/igt@runner@aborted.html
    - fi-bxt-dsi:         [FAIL][28] ([i915#2426] / [i915#3363]) -> [FAIL][29] ([i915#3363])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-bxt-dsi/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-bxt-dsi/igt@runner@aborted.html
    - fi-cml-s:           [FAIL][30] ([i915#3363] / [i915#3462]) -> [FAIL][31] ([i915#2082] / [i915#2426] / [i915#3363] / [i915#3462])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cml-s/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cml-s/igt@runner@aborted.html
    - fi-skl-guc:         [FAIL][32] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][33] ([i915#1436] / [i915#3363])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-skl-guc/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-skl-guc/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2082]: https://gitlab.freedesktop.org/drm/intel/issues/2082
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2782]: https://gitlab.freedesktop.org/drm/intel/issues/2782
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3462]: https://gitlab.freedesktop.org/drm/intel/issues/3462
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (46 -> 41)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6102 -> IGTPW_5901

  CI-20190529: 20190529
  CI_DRM_10194: 08ac6453e0060df3adc8e95e0d6850414bc24fad @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html
  IGT_6102: 6e67969bf93dda8f22773ccae362f757fce25c3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

-igt@gem_exec_reloc@basic-concurrent0
-igt@gem_exec_reloc@basic-concurrent16
-igt@gem_exec_reloc@basic-many-active
-igt@gem_exec_reloc@basic-parallel
-igt@gem_exec_reloc@basic-spin
-igt@gem_exec_reloc@basic-spin-others
-igt@gem_exec_reloc@basic-wide-active
-igt@gem_exec_reloc@cpu-gtt-hang
-igt@gem_exec_reloc@cpu-gtt-interruptible
-igt@gem_exec_reloc@cpu-hang
-igt@gem_exec_reloc@cpu-interruptible
-igt@gem_exec_reloc@cpu-read-hang
-igt@gem_exec_reloc@cpu-read-interruptible
-igt@gem_exec_reloc@cpu-wc-hang
-igt@gem_exec_reloc@cpu-wc-interruptible
-igt@gem_exec_reloc@gtt-cpu-hang
-igt@gem_exec_reloc@gtt-cpu-interruptible
-igt@gem_exec_reloc@gtt-hang
-igt@gem_exec_reloc@gtt-interruptible
-igt@gem_exec_reloc@gtt-read-hang
-igt@gem_exec_reloc@gtt-read-interruptible
-igt@gem_exec_reloc@gtt-wc-hang
-igt@gem_exec_reloc@gtt-wc-interruptible
-igt@gem_exec_reloc@range-hang
-igt@gem_exec_reloc@range-interruptible
-igt@gem_exec_reloc@wc-cpu-hang
-igt@gem_exec_reloc@wc-cpu-interruptible
-igt@gem_exec_reloc@wc-gtt-hang
-igt@gem_exec_reloc@wc-gtt-interruptible
-igt@gem_exec_reloc@wc-hang
-igt@gem_exec_reloc@wc-interruptible
-igt@gem_exec_reloc@wc-read-hang
-igt@gem_exec_reloc@wc-read-interruptible
-igt@gem_exec_reloc@write-cpu-hang
-igt@gem_exec_reloc@write-cpu-interruptible
-igt@gem_exec_reloc@write-gtt-hang
-igt@gem_exec_reloc@write-gtt-interruptible
-igt@gem_exec_reloc@write-read-hang
-igt@gem_exec_reloc@write-read-interruptible
-igt@gem_exec_reloc@write-wc-hang
-igt@gem_exec_reloc@write-wc-interruptible

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html

--===============0374440975430047995==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t] tests/gem_exec_reloc: Remove banned tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91160/">https://patchwork.freedesktop.org/series/91160/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10194 -&gt; IGTPW_5901</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5901 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_cs_nop@sync-fork-compute0:</p>
<ul>
<li>fi-snb-2600:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-snb-2600/igt@amdgpu/amd_cs_nop@sync-fork-compute0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-u2/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-y/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@hangcheck:<ul>
<li>fi-snb-2600:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-snb-2600/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-icl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-icl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-tgl-u2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-tgl-u2/igt@i915_selftest@live@execlists.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-icl-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2782">i915#2782</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-bdw-5557u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cml-u2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-cml-s/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2082">i915#2082</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3462">i915#3462</a>)</p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10194/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (46 -&gt; 41)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6102 -&gt; IGTPW_5901</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10194: 08ac6453e0060df3adc8e95e0d6850414bc24fad @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5901/index.html<br />
  IGT_6102: 6e67969bf93dda8f22773ccae362f757fce25c3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>-igt@gem_exec_reloc@basic-concurrent0<br />
-igt@gem_exec_reloc@basic-concurrent16<br />
-igt@gem_exec_reloc@basic-many-active<br />
-igt@gem_exec_reloc@basic-parallel<br />
-igt@gem_exec_reloc@basic-spin<br />
-igt@gem_exec_reloc@basic-spin-others<br />
-igt@gem_exec_reloc@basic-wide-active<br />
-igt@gem_exec_reloc@cpu-gtt-hang<br />
-igt@gem_exec_reloc@cpu-gtt-interruptible<br />
-igt@gem_exec_reloc@cpu-hang<br />
-igt@gem_exec_reloc@cpu-interruptible<br />
-igt@gem_exec_reloc@cpu-read-hang<br />
-igt@gem_exec_reloc@cpu-read-interruptible<br />
-igt@gem_exec_reloc@cpu-wc-hang<br />
-igt@gem_exec_reloc@cpu-wc-interruptible<br />
-igt@gem_exec_reloc@gtt-cpu-hang<br />
-igt@gem_exec_reloc@gtt-cpu-interruptible<br />
-igt@gem_exec_reloc@gtt-hang<br />
-igt@gem_exec_reloc@gtt-interruptible<br />
-igt@gem_exec_reloc@gtt-read-hang<br />
-igt@gem_exec_reloc@gtt-read-interruptible<br />
-igt@gem_exec_reloc@gtt-wc-hang<br />
-igt@gem_exec_reloc@gtt-wc-interruptible<br />
-igt@gem_exec_reloc@range-hang<br />
-igt@gem_exec_reloc@range-interruptible<br />
-igt@gem_exec_reloc@wc-cpu-hang<br />
-igt@gem_exec_reloc@wc-cpu-interruptible<br />
-igt@gem_exec_reloc@wc-gtt-hang<br />
-igt@gem_exec_reloc@wc-gtt-interruptible<br />
-igt@gem_exec_reloc@wc-hang<br />
-igt@gem_exec_reloc@wc-interruptible<br />
-igt@gem_exec_reloc@wc-read-hang<br />
-igt@gem_exec_reloc@wc-read-interruptible<br />
-igt@gem_exec_reloc@write-cpu-hang<br />
-igt@gem_exec_reloc@write-cpu-interruptible<br />
-igt@gem_exec_reloc@write-gtt-hang<br />
-igt@gem_exec_reloc@write-gtt-interruptible<br />
-igt@gem_exec_reloc@write-read-hang<br />
-igt@gem_exec_reloc@write-read-interruptible<br />
-igt@gem_exec_reloc@write-wc-hang<br />
-igt@gem_exec_reloc@write-wc-interruptible</p>

</body>
</html>

--===============0374440975430047995==--

--===============0086035950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0086035950==--
