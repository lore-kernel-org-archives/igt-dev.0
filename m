Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8711022063616999507=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rob Clark" <robdclark@gmail.com>
Date: Tue, 08 Aug 2023 16:32:00 -0000
Message-ID: <169151232072.13859.3971777632112538464@emeril.freedesktop.org>
References: <20230808145334.24277-1-robdclark@gmail.com>
In-Reply-To: <20230808145334.24277-1-robdclark@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=5D_tests/kms=5Fplane=3A_Handle_hw_without?=
 =?utf-8?q?_legacy_gamma_support?=
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

--===============8711022063616999507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] tests/kms_plane: Handle hw without legacy gamma support
URL   : https://patchwork.freedesktop.org/series/122161/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13492 -> IGTPW_9542
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html

Participating hosts (43 -> 41)
------------------------------

  Missing    (2): bat-adlp-6 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9542 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-x1275:       [PASS][1] -> [FAIL][2] ([i915#7940])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-8:         [PASS][3] -> [DMESG-FAIL][4] ([i915#7059])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@slpc:
    - bat-rpls-1:         NOTRUN -> [DMESG-WARN][5] ([i915#6367])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-rpls-1:         NOTRUN -> [ABORT][6] ([i915#6687] / [i915#7978] / [i915#8668])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - bat-jsl-3:          NOTRUN -> [SKIP][7] ([i915#7828])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [ABORT][8] ([i915#5122]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_pm_rpm@basic-rte:
    - fi-cfl-8109u:       [FAIL][10] ([i915#7940]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@module-reload:
    - fi-tgl-1115g4:      [FAIL][12] ([i915#7940]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html
    - fi-cfl-guc:         [FAIL][14] ([i915#7940]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-mtlp-6:         [DMESG-FAIL][16] ([i915#7059]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [DMESG-FAIL][18] ([i915#8497]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@reset:
    - bat-rpls-1:         [ABORT][20] ([i915#4983] / [i915#7461] / [i915#8347] / [i915#8384]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-rpls-1/igt@i915_selftest@live@reset.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_selftest@live@reset.html

  * igt@i915_selftest@live@slpc:
    - bat-mtlp-6:         [DMESG-WARN][22] ([i915#6367]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-6/igt@i915_selftest@live@slpc.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-6/igt@i915_selftest@live@slpc.html
    - bat-mtlp-8:         [DMESG-WARN][24] ([i915#6367]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@slpc.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@slpc.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [FAIL][26] ([fdo#103375]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  
#### Warnings ####

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][28] ([i915#4423]) -> [ABORT][29] ([i915#4423])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-adlp-11/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-adlp-11/igt@i915_module_load@load.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6687]: https://gitlab.freedesktop.org/drm/intel/issues/6687
  [i915#7059]: https://gitlab.freedesktop.org/drm/intel/issues/7059
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7978]: https://gitlab.freedesktop.org/drm/intel/issues/7978
  [i915#8347]: https://gitlab.freedesktop.org/drm/intel/issues/8347
  [i915#8384]: https://gitlab.freedesktop.org/drm/intel/issues/8384
  [i915#8497]: https://gitlab.freedesktop.org/drm/intel/issues/8497
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7422 -> IGTPW_9542

  CI-20190529: 20190529
  CI_DRM_13492: 525b387a224ced0a360fcbf92794392999de7208 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html
  IGT_7422: a7b9e93b67f02d17b99f9331fdcda14e21172c8c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html

--===============8711022063616999507==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] tests/kms_plane: Handle hw without legacy gamma support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122161/">https://patchwork.freedesktop.org/series/122161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13492 -&gt; IGTPW_9542</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Missing    (2): bat-adlp-6 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9542 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>fi-kbl-x1275:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-kbl-x1275/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-rpls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6687">i915#6687</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7978">i915#7978</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>bat-jsl-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-cfl-8109u/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-tgl-1115g4/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/fi-cfl-guc/igt@i915_pm_rpm@module-reload.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7059">i915#7059</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-6/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8497">i915#8497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8347">i915#8347</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8384">i915#8384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>
<p>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-6/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-6/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
<li>
<p>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-mtlp-8/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-mtlp-8/igt@i915_selftest@live@slpc.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@load:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13492/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7422 -&gt; IGTPW_9542</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13492: 525b387a224ced0a360fcbf92794392999de7208 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9542: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9542/index.html<br />
  IGT_7422: a7b9e93b67f02d17b99f9331fdcda14e21172c8c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8711022063616999507==--
