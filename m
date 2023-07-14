Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6432073413689204511=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Date: Fri, 14 Jul 2023 05:09:11 -0000
Message-ID: <168931135138.13874.6421719258775104300@emeril.freedesktop.org>
References: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230711093602.987411-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgeGUveGVf?=
 =?utf-8?q?create=3A_Modify_massive_test?=
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

--===============6432073413689204511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/xe_create: Modify massive test
URL   : https://patchwork.freedesktop.org/series/120537/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13368 -> IGTPW_9382
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9382 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-guc:         [PASS][1] -> [FAIL][2] ([i915#7940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [PASS][3] -> [FAIL][4] ([i915#7940]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][5] -> [DMESG-FAIL][6] ([i915#5334])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [PASS][7] -> [ABORT][8] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-1/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-dg2-11:         [PASS][9] -> [DMESG-WARN][10] ([i915#6367])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-dg2-11/igt@i915_selftest@live@slpc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@i915_selftest@live@slpc.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-rpls-2:         NOTRUN -> [SKIP][11] ([i915#7828])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - bat-atsm-1:         NOTRUN -> [SKIP][12] ([i915#6078])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][13] ([i915#1845] / [i915#5354]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-rpls-2:         NOTRUN -> [SKIP][14] ([i915#1845])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
    - bat-atsm-1:         NOTRUN -> [SKIP][15] ([i915#1836])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         NOTRUN -> [ABORT][16] ([i915#8434] / [i915#8442] / [i915#8668])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-skl-guc:         [FAIL][17] ([i915#7940]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html
    - fi-kbl-7567u:       [FAIL][19] ([i915#7940]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-2:         [ABORT][21] ([i915#4983] / [i915#7461] / [i915#7913] / [i915#8347]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-2/igt@i915_selftest@live@reset.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - bat-atsm-1:         [ABORT][23] ([i915#6311]) -> [DMESG-WARN][24] ([i915#8504])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [SKIP][25] ([fdo#109271]) -> [FAIL][26] ([i915#7940])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-rplp-1:         [ABORT][27] ([i915#8712]) -> [SKIP][28] ([i915#1072])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8434]: https://gitlab.freedesktop.org/drm/intel/issues/8434
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8504]: https://gitlab.freedesktop.org/drm/intel/issues/8504
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8712]: https://gitlab.freedesktop.org/drm/intel/issues/8712


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7380 -> IGTPW_9382

  CI-20190529: 20190529
  CI_DRM_13368: 5f6430479a127acb898b37ee8d6124b0e509618c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9382: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html
  IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html

--===============6432073413689204511==
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
<tr><td><b>Series:</b></td><td>xe/xe_create: Modify massive test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/120537/">https://patchwork.freedesktop.org/series/120537/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13368 -&gt; IGTPW_9382</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9382 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-dg2-11/igt@i915_selftest@live@slpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6078">i915#6078</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>
<p>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>)</p>
</li>
<li>
<p>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8434">i915#8434</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-skl-guc/igt@i915_pm_rpm@basic-rte.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-7567u/igt@i915_pm_rpm@basic-rte.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>bat-atsm-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6311">i915#6311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-atsm-1/igt@gem_exec_suspend@basic-s3@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8504">i915#8504</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13368/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8712">i915#8712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/bat-rplp-1/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7380 -&gt; IGTPW_9382</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13368: 5f6430479a127acb898b37ee8d6124b0e509618c @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9382: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9382/index.html<br />
  IGT_7380: 8e65f12de2fd52c05dc48fdbcb8cfe86f6de1a75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6432073413689204511==--
