Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2752484085431688222=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Sep 2021 07:39:31 -0000
Message-ID: <163212357138.25895.14744956303207189223@emeril.freedesktop.org>
References: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3A_Add_allocator_support?=
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2752484085431688222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_sync.c : Add allocator support
URL   : https://patchwork.freedesktop.org/series/94846/
State : success

== Summary ==

CI Bug Log - changes from IGT_6212 -> IGTPW_6236
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_6236 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6236, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6236:

### IGT changes ###

#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-kbl-8809g:       [INCOMPLETE][1] ([i915#4130]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-8809g/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-8809g/igt@i915_module_load@reload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-ehl-2}:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-ehl-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_6236 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@cs-gfx:
    - fi-skl-6700k2:      NOTRUN -> [SKIP][4] ([fdo#109271]) +17 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-rkl-guc:         [PASS][5] -> [INCOMPLETE][6] ([i915#4130])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-icl-u2:          [PASS][7] -> [INCOMPLETE][8] ([i915#4130])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-8109u:       [PASS][9] -> [INCOMPLETE][10] ([i915#4130])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_module_load@reload:
    - fi-kbl-7500u:       NOTRUN -> [INCOMPLETE][11] ([i915#4130] / [i915#4136])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@i915_module_load@reload.html

  * igt@runner@aborted:
    - fi-kbl-7500u:       NOTRUN -> [FAIL][12] ([i915#2426] / [i915#3363])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-skl-6700k2:      [INCOMPLETE][13] ([i915#4130]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7500u:       [INCOMPLETE][15] ([i915#4130]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html

  
#### Warnings ####

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [INCOMPLETE][17] ([i915#4130] / [i915#4136]) -> [INCOMPLETE][18] ([i915#4136])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-soraka/igt@i915_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-soraka/igt@i915_module_load@reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#4130]: https://gitlab.freedesktop.org/drm/intel/issues/4130
  [i915#4136]: https://gitlab.freedesktop.org/drm/intel/issues/4136


Participating hosts (34 -> 28)
------------------------------

  Missing    (6): fi-kbl-7567u fi-tgl-1115g4 fi-ilk-650 fi-ctg-p8600 fi-icl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6212 -> IGTPW_6236

  CI-20190529: 20190529
  CI_DRM_10607: d0beb759235c4bd8245af96db684cf0d8fbccb3a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html
  IGT_6212: 0faa6b2533da9416a3428c34ca99661725577449 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html

--===============2752484085431688222==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_sync.c : Add allocator support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94846/">https://patchwork.freedesktop.org/series/94846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6212 -&gt; IGTPW_6236</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_6236 need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6236, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6236:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-kbl-8809g:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-8809g/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-8809g/igt@i915_module_load@reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@runner@aborted:<ul>
<li>{fi-ehl-2}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-ehl-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6236 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@cs-gfx:</p>
<ul>
<li>fi-skl-6700k2:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-skl-6700k2/igt@amdgpu/amd_basic@cs-gfx.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-rkl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
<li>
<p>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-icl-u2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-7500u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-skl-6700k2:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-skl-6700k2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/fi-kbl-soraka/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4130">i915#4130</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/fi-kbl-soraka/igt@i915_module_load@reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4136">i915#4136</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (34 -&gt; 28)</h2>
<p>Missing    (6): fi-kbl-7567u fi-tgl-1115g4 fi-ilk-650 fi-ctg-p8600 fi-icl-y fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6212 -&gt; IGTPW_6236</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10607: d0beb759235c4bd8245af96db684cf0d8fbccb3a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6236: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html<br />
  IGT_6212: 0faa6b2533da9416a3428c34ca99661725577449 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2752484085431688222==--
