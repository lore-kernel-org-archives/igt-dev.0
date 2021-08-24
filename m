Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2080346288271387435=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Aug 2021 14:10:05 -0000
Message-ID: <162981420550.27155.5751598089544398946@emeril.freedesktop.org>
References: <20210824090943.1158940-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210824090943.1158940-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Remove_vma-merge_subtest?=
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
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2080346288271387435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_userptr_blits: Remove vma-merge subtest
URL   : https://patchwork.freedesktop.org/series/93950/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10513 -> IGTPW_6147
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html

Known issues
------------

  Here are the changes found in IGTPW_6147 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-rkl-guc:         NOTRUN -> [SKIP][1] ([fdo#109315]) +17 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271]) +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@gem_huc_copy@huc-copy:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][3] ([i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_backlight@basic-brightness:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][4] ([i915#1155])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][5] ([i915#4006])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [PASS][6] -> [INCOMPLETE][7] ([i915#2940])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-bsw-nick/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8700k:       [PASS][8] -> [DMESG-FAIL][9] ([i915#2291] / [i915#541])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - fi-rkl-guc:         NOTRUN -> [DMESG-WARN][10] ([i915#3958])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_addfb_basic@too-wide:
    - fi-tgl-1115g4:      NOTRUN -> [DMESG-WARN][11] ([i915#4002]) +90 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][12] ([fdo#111827]) +8 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html
    - fi-kbl-7500u:       [PASS][13] -> [DMESG-FAIL][14] ([i915#165])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_psr@primary_mmap_gtt:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][16] ([i915#1072]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_psr@primary_page_flip:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][17] ([i915#1072] / [i915#1385])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html

  * igt@prime_vgem@basic-userptr:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][18] ([i915#3301])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html

  * igt@runner@aborted:
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][19] ([i915#2722] / [i915#3834])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [DMESG-WARN][20] ([i915#3925]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0:
    - fi-cfl-8109u:       [DMESG-WARN][22] ([i915#203] / [i915#262] / [i915#295]) -> [PASS][23] +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload:
    - {fi-tgl-dsi}:       [DMESG-WARN][24] ([i915#1982]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-tgl-dsi/igt@i915_module_load@reload.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-dsi/igt@i915_module_load@reload.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-kbl-guc:         [FAIL][26] ([i915#579]) -> [SKIP][27] ([fdo#109271])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#203]: https://gitlab.freedesktop.org/drm/intel/issues/203
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2291]: https://gitlab.freedesktop.org/drm/intel/issues/2291
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2940]: https://gitlab.freedesktop.org/drm/intel/issues/2940
  [i915#295]: https://gitlab.freedesktop.org/drm/intel/issues/295
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3834]: https://gitlab.freedesktop.org/drm/intel/issues/3834
  [i915#3925]: https://gitlab.freedesktop.org/drm/intel/issues/3925
  [i915#3958]: https://gitlab.freedesktop.org/drm/intel/issues/3958
  [i915#4002]: https://gitlab.freedesktop.org/drm/intel/issues/4002
  [i915#4006]: https://gitlab.freedesktop.org/drm/intel/issues/4006
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579


Participating hosts (39 -> 34)
------------------------------

  Additional (1): fi-tgl-1115g4 
  Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6184 -> IGTPW_6147

  CI-20190529: 20190529
  CI_DRM_10513: 28c5d08c6c0d0946b9836306c25146a2f72de338 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html
  IGT_6184: 84f9bbde1e6156c8b978613d9c85c9043fd3180c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

-igt@gem_userptr_blits@vma-merge

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html

--===============2080346288271387435==
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
<tr><td><b>Series:</b></td><td>tests/gem_userptr_blits: Remove vma-merge subtest</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93950/">https://patchwork.freedesktop.org/series/93950/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10513 -&gt; IGTPW_6147</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6147 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</p>
</li>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-soraka/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1155">i915#1155</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4006">i915#4006</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-bsw-nick/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-bsw-nick/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2940">i915#2940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8700k:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-cfl-8700k/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2291">i915#2291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3958">i915#3958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_addfb_basic@too-wide.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4002">i915#4002</a>) +90 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-7500u/igt@kms_chamelium@common-hpd-after-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1385">i915#1385</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3834">i915#3834</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3925">i915#3925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/203">i915#203</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/295">i915#295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-cfl-8109u/igt@gem_exec_suspend@basic-s0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-tgl-dsi/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-tgl-dsi/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10513/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/fi-kbl-guc/igt@i915_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (39 -&gt; 34)</h2>
<p>Additional (1): fi-tgl-1115g4 <br />
  Missing    (6): fi-ilk-m540 bat-adls-5 fi-hsw-4200u fi-bsw-cyan fi-bdw-samus bat-jsl-1 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6184 -&gt; IGTPW_6147</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10513: 28c5d08c6c0d0946b9836306c25146a2f72de338 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6147: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6147/index.html<br />
  IGT_6184: 84f9bbde1e6156c8b978613d9c85c9043fd3180c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>-igt@gem_userptr_blits@vma-merge</p>

</body>
</html>

--===============2080346288271387435==--
