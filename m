Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2630998178648143291=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Wed, 02 Aug 2023 10:40:11 -0000
Message-ID: <169097281126.6325.183559639889093470@emeril.freedesktop.org>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_xe/xe=5Fsysfs=3A_Updated_tests?=
 =?utf-8?q?_to_use_xe=5Fsysfs=5Fgt=5Fopen?=
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

--===============2630998178648143291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/4] xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open
URL   : https://patchwork.freedesktop.org/series/121877/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13459 -> IGTPW_9493
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9493 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       [PASS][1] -> [FAIL][2] ([fdo#103375])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-adlp-9:         NOTRUN -> [SKIP][3] ([i915#4613]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - bat-mtlp-8:         [PASS][4] -> [ABORT][5] ([i915#7077] / [i915#7977] / [i915#8668])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-9:         NOTRUN -> [FAIL][6] ([i915#7940])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
    - fi-rkl-11600:       [PASS][7] -> [FAIL][8] ([i915#7940])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html
    - fi-tgl-1115g4:      [PASS][9] -> [FAIL][10] ([i915#7940])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [PASS][11] -> [FAIL][12] ([i915#7940])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_pm_rps@basic-api:
    - bat-adlp-9:         NOTRUN -> [SKIP][13] ([i915#6621])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rps@basic-api.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][14] -> [ABORT][15] ([i915#7911] / [i915#7913])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [PASS][16] -> [DMESG-FAIL][17] ([i915#7059])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [PASS][18] -> [ABORT][19] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#7981] / [i915#8347])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-rpls-2/igt@i915_selftest@live@reset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-rpls-2/igt@i915_selftest@live@reset.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-adlp-9:         NOTRUN -> [SKIP][20] ([i915#7828])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#1845] / [i915#5354]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@prime_vgem@basic-fence-read:
    - bat-adlp-9:         NOTRUN -> [SKIP][22] ([fdo#109295] / [i915#3291] / [i915#3708]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@prime_vgem@basic-fence-read.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - bat-adlp-9:         [ABORT][23] ([i915#7977] / [i915#8668]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-adlp-9/igt@i915_pm_rpm@basic-rte.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [FAIL][25] ([i915#7940]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
    - fi-kbl-7567u:       [FAIL][27] ([i915#7940]) -> [PASS][28] +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-8809g:       [DMESG-FAIL][29] ([i915#5334] / [i915#7872]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html
    - fi-kbl-soraka:      [DMESG-FAIL][31] ([i915#5334] / [i915#7872]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         [SKIP][33] ([i915#1072]) -> [ABORT][34] ([i915#8442] / [i915#8668] / [i915#8712])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7411 -> IGTPW_9493

  CI-20190529: 20190529
  CI_DRM_13459: 012a0975c3a48832c5c96c34846b6feaeb36f0cb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9493: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html
  IGT_7411: 7411


Testlist changes
----------------

-igt@kms_dsc@dsc-fractional-bpp
-igt@kms_dsc@dsc-fractional-bpp-with-bpc
-igt@kms_dsc@dsc-with-output-formats-with-bpc

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html

--===============2630998178648143291==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/4] xe/xe_sysfs: Updated tests to use xe_sysfs_gt_open</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/121877/">https://patchwork.freedesktop.org/series/121877/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13459 -&gt; IGTPW_9493</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9493 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-mtlp-8/igt@i915_pm_rpm@basic-pci-d3-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7077">i915#7077</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</p>
</li>
<li>
<p>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-rkl-11600/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</p>
</li>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rps@basic-api.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-adlp-9/igt@i915_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-adlp-9/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-7567u/igt@i915_pm_rpm@module-reload.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-8809g/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@sprite_plane_onoff:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13459/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7411 -&gt; IGTPW_9493</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13459: 012a0975c3a48832c5c96c34846b6feaeb36f0cb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9493: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9493/index.html<br />
  IGT_7411: 7411</p>
<h2>Testlist changes</h2>
<p>-igt@kms_dsc@dsc-fractional-bpp<br />
-igt@kms_dsc@dsc-fractional-bpp-with-bpc<br />
-igt@kms_dsc@dsc-with-output-formats-with-bpc</p>

</body>
</html>

--===============2630998178648143291==--
