Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Jul 2021 11:52:01 -0000
Message-ID: <162565872154.30453.6524115613502403305@emeril.freedesktop.org>
References: <20210707105238.1694091-1-matthew.auld@intel.com>
In-Reply-To: <20210707105238.1694091-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Faddfb=5Fbasic=3A_pass_the_actual_fd_to_gem=5Fhas=5Flmem?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2048330396=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2048330396==
Content-Type: multipart/alternative;
 boundary="===============8216082021751173052=="

--===============8216082021751173052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_addfb_basic: pass the actual fd to gem_has_lmem
URL   : https://patchwork.freedesktop.org/series/92271/
State : success

== Summary ==

CI Bug Log - changes from IGT_6130 -> IGTPW_5988
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html

Known issues
------------

  Here are the changes found in IGTPW_5988 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html
    - fi-bxt-dsi:         NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#2190])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][4] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][5] ([fdo#109271]) +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#533])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#533])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][8] ([fdo#109271]) +6 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_psr@primary_mmap_gtt.html

  * igt@runner@aborted:
    - fi-cfl-8109u:       NOTRUN -> [FAIL][9] ([i915#2722] / [i915#3363])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@runner@aborted.html

  * igt@vgem_basic@unload:
    - fi-bxt-dsi:         NOTRUN -> [INCOMPLETE][10] ([i915#3744])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@vgem_basic@unload.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][11] ([i915#3744])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@vgem_basic@unload.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-elk-e7500:       [FAIL][12] ([i915#3194]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-cfl-8109u:       [INCOMPLETE][14] ([i915#155]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - {fi-tgl-1115g4}:    [FAIL][16] ([i915#1888]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [FAIL][18] ([i915#1372]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bxt-dsi:         [FAIL][20] ([i915#2426] / [i915#3363]) -> [FAIL][21] ([i915#2722] / [i915#3363])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-bxt-dsi/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@runner@aborted.html

  * igt@vgem_basic@unload:
    - fi-cml-s:           [INCOMPLETE][22] ([i915#1982] / [i915#3744]) -> [INCOMPLETE][23] ([i915#3744])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-cml-s/igt@vgem_basic@unload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cml-s/igt@vgem_basic@unload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1372]: https://gitlab.freedesktop.org/drm/intel/issues/1372
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#3194]: https://gitlab.freedesktop.org/drm/intel/issues/3194
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3744]: https://gitlab.freedesktop.org/drm/intel/issues/3744
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533


Participating hosts (44 -> 40)
------------------------------

  Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6130 -> IGTPW_5988

  CI-20190529: 20190529
  CI_DRM_10308: 9d1b5a9bdfbfb97b6e6b7ee3d863ee373ee9fd9e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5988: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html
  IGT_6130: 390edfb703c346f06b0850db71bd3cc1342a3c02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html

--===============8216082021751173052==
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
<tr><td><b>Series:</b></td><td>tests/kms_addfb_basic: pass the actual fd to gem_has_lmem</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92271/">https://patchwork.freedesktop.org/series/92271/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6130 -&gt; IGTPW_5988</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5988 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>
<p>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3194">i915#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>{fi-tgl-1115g4}:    <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1372">i915#1372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-bxt-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>fi-cml-s:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/fi-cml-s/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/fi-cml-s/igt@vgem_basic@unload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3744">i915#3744</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (44 -&gt; 40)</h2>
<p>Missing    (4): fi-ilk-m540 fi-bsw-cyan fi-bdw-samus fi-hsw-4200u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6130 -&gt; IGTPW_5988</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10308: 9d1b5a9bdfbfb97b6e6b7ee3d863ee373ee9fd9e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5988: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html<br />
  IGT_6130: 390edfb703c346f06b0850db71bd3cc1342a3c02 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8216082021751173052==--

--===============2048330396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2048330396==--
