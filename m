Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4882732670576771516=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 15 Sep 2021 04:17:01 -0000
Message-ID: <163167942182.30117.13497902848252578416@emeril.freedesktop.org>
References: <20210915033358.561080-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210915033358.561080-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium=3A_Skip_CTM_test_if_property_is_not_pre?=
 =?utf-8?q?sent_=28rev2=29?=
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4882732670576771516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_chamelium: Skip CTM test if property is not present (rev2)
URL   : https://patchwork.freedesktop.org/series/94653/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10586 -> IGTPW_6220
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6220 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6220, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6220:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload:
    - fi-skl-guc:         NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_module_load@reload.html
    - fi-kbl-7500u:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@i915_module_load@reload.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@i915_module_load@reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_module_load@reload:
    - {fi-jsl-1}:         [TIMEOUT][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-jsl-1/igt@i915_module_load@reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-jsl-1/igt@i915_module_load@reload.html

  
Known issues
------------

  Here are the changes found in IGTPW_6220 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-6700k2:      [PASS][6] -> [INCOMPLETE][7] ([i915#4130])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
    - fi-icl-u2:          [PASS][8] -> [INCOMPLETE][9] ([i915#4130])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7567u:       [PASS][10] -> [INCOMPLETE][11] ([i915#4130])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s3:
    - fi-tgl-1115g4:      [PASS][12] -> [FAIL][13] ([i915#1888])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_selftest@live@mman:
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][14] ([i915#4129])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@i915_selftest@live@mman.html
    - fi-skl-guc:         NOTRUN -> [INCOMPLETE][15] ([i915#3796] / [i915#4129])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_selftest@live@mman.html

  * igt@runner@aborted:
    - fi-cfl-guc:         NOTRUN -> [FAIL][16] ([i915#2426] / [i915#3363])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@runner@aborted.html
    - fi-skl-guc:         NOTRUN -> [FAIL][17] ([i915#1436] / [i915#2426] / [i915#3363])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-cfl-guc:         [INCOMPLETE][18] ([i915#4130]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-skl-guc:         [INCOMPLETE][20] ([i915#4130]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-kbl-7500u:       [FAIL][22] ([i915#1436] / [i915#2426] / [i915#3363]) -> [FAIL][23] ([i915#2426] / [i915#3363])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2932]: https://gitlab.freedesktop.org/drm/intel/issues/2932
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3690]: https://gitlab.freedesktop.org/drm/intel/issues/3690
  [i915#3796]: https://gitlab.freedesktop.org/drm/intel/issues/3796
  [i915#3970]: https://gitlab.freedesktop.org/drm/intel/issues/3970
  [i915#4129]: https://gitlab.freedesktop.org/drm/intel/issues/4129
  [i915#4130]: https://gitlab.freedesktop.org/drm/intel/issues/4130


Participating hosts (41 -> 36)
------------------------------

  Missing    (5): fi-cml-u2 bat-dg1-6 fi-bsw-cyan bat-jsl-2 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6209 -> IGTPW_6220

  CI-20190529: 20190529
  CI_DRM_10586: 84dcd8a1b2a281b296db22fac5f7ffe52dd7c501 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6220: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html
  IGT_6209: 07d6594ed02f55b68d64fa6dd7f80cfbc1ce4ef8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html

--===============4882732670576771516==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_chamelium: Skip CTM test if property is not present (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94653/">https://patchwork.freedesktop.org/series/94653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10586 -&gt; IGTPW_6220</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6220 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6220, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6220:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_module_load@reload.html">DMESG-WARN</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@i915_module_load@reload.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-jsl-1/igt@i915_module_load@reload.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-jsl-1/igt@i915_module_load@reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6220 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-tgl-1115g4/igt@gem_exec_suspend@basic-s3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@i915_selftest@live@mman.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4129">i915#4129</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@i915_selftest@live@mman.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3796">i915#3796</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4129">i915#4129</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>fi-skl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-skl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (41 -&gt; 36)</h2>
<p>Missing    (5): fi-cml-u2 bat-dg1-6 fi-bsw-cyan bat-jsl-2 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6209 -&gt; IGTPW_6220</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10586: 84dcd8a1b2a281b296db22fac5f7ffe52dd7c501 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6220: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html<br />
  IGT_6209: 07d6594ed02f55b68d64fa6dd7f80cfbc1ce4ef8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4882732670576771516==--
