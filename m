Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5201152180808240552=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "vikassri07" <vikas.srivastava@intel.com>
Date: Mon, 17 Oct 2022 08:36:29 -0000
Message-ID: <166599578916.13568.3290231033067702132@emeril.freedesktop.org>
References: <20221014090228.2340914-1-vikas.srivastava@intel.com>
In-Reply-To: <20221014090228.2340914-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fmodule=5Fload_=3A_Use_GEM=5FBUSY_instead_of_SET=5FC?=
 =?utf-8?q?ACHE_for_sanity_check?=
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

--===============5201152180808240552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_module_load : Use GEM_BUSY instead of SET_CACHE for sanity check
URL   : https://patchwork.freedesktop.org/series/109752/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12250 -> IGTPW_7969
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7969 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7969, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html

Participating hosts (45 -> 43)
------------------------------

  Additional (1): fi-rkl-guc 
  Missing    (3): fi-bdw-samus fi-bxt-dsi fi-skl-6700k2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7969:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@runner@aborted:
    - fi-rkl-guc:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-rkl-guc/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_pm_rpm@module-reload:
    - {fi-tgl-dsi}:       [INCOMPLETE][4] ([i915#7190]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#7190]: https://gitlab.freedesktop.org/drm/intel/issues/7190


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7016 -> IGTPW_7969

  CI-20190529: 20190529
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html

--===============5201152180808240552==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_module_load : Use GEM_BUSY instead of SET_CACHE for sanity check</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/109752/">https://patchwork.freedesktop.org/series/109752/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12250 -&gt; IGTPW_7969</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7969 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_7969, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html</p>
<h2>Participating hosts (45 -&gt; 43)</h2>
<p>Additional (1): fi-rkl-guc <br />
  Missing    (3): fi-bdw-samus fi-bxt-dsi fi-skl-6700k2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7969:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-rkl-guc/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12250/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7190">i915#7190</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/fi-tgl-dsi/igt@i915_pm_rpm@module-reload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7016 -&gt; IGTPW_7969</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12250: 9b84132c9b266a89e2865cbe8b586dd0b14cc2a4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7969: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7969/index.html<br />
  IGT_7016: 642f4bf44e2b42791b4d1684936a1bfbe2d099ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5201152180808240552==--
