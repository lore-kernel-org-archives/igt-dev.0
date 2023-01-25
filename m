Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7323175798369670209=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 25 Jan 2023 07:53:35 -0000
Message-ID: <167463321516.5514.17742888984039170859@emeril.freedesktop.org>
References: <20230125071544.1550738-1-riana.tauro@intel.com>
In-Reply-To: <20230125071544.1550738-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=5Fpmu=3A_Add_a_basic_perf=5Fpmu_test?=
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

--===============7323175798369670209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf_pmu: Add a basic perf_pmu test
URL   : https://patchwork.freedesktop.org/series/113303/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12631 -> IGTPW_8400
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): fi-kbl-soraka fi-bsw-kefka fi-cfl-8700k 

Known issues
------------

  Here are the changes found in IGTPW_8400 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][1] ([i915#7229]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12631/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7136 -> IGTPW_8400

  CI-20190529: 20190529
  CI_DRM_12631: 6bcfacd291ed6ff1ff50a295f970c98d54eabe05 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8400: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html
  IGT_7136: 31b6af91747ad8c705399c9006cdb81cb1864146 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@perf_pmu@pmu-read
-igt@gem_exec3_balancer@parallel-ordering
-igt@gem_exec3_basic@basic
-igt@gem_lmem_swapping@vm_bind
-igt@gem_shrink@vm_bind
-igt@gem_shrink@vm_bind-oom
-igt@gem_shrink@vm_bind-sanitycheck
-igt@gem_shrink@vm_bind-userptr
-igt@gem_shrink@vm_bind-userptr-dirty
-igt@gem_userptr_blits@vma-merge-execbuf3
-igt@i915_vm_bind_basic@2m
-igt@i915_vm_bind_basic@2m_sync_bind
-igt@i915_vm_bind_basic@64k
-igt@i915_vm_bind_basic@basic
-igt@i915_vm_bind_basic@multi_cmds
-igt@i915_vm_bind_basic@multi_ctxts
-igt@i915_vm_bind_basic@share_vm
-igt@i915_vm_bind_basic@skip_copy
-igt@i915_vm_bind_basic@skip_unbind
-igt@i915_vm_bind_capture@basic
-igt@i915_vm_bind_sanity@basic

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html

--===============7323175798369670209==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf_pmu: Add a basic perf_pmu test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113303/">https://patchwork.freedesktop.org/series/113303/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12631 -&gt; IGTPW_8400</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): fi-kbl-soraka fi-bsw-kefka fi-cfl-8700k </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8400 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12631/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7136 -&gt; IGTPW_8400</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12631: 6bcfacd291ed6ff1ff50a295f970c98d54eabe05 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8400: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8400/index.html<br />
  IGT_7136: 31b6af91747ad8c705399c9006cdb81cb1864146 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@perf_pmu@pmu-read<br />
-igt@gem_exec3_balancer@parallel-ordering<br />
-igt@gem_exec3_basic@basic<br />
-igt@gem_lmem_swapping@vm_bind<br />
-igt@gem_shrink@vm_bind<br />
-igt@gem_shrink@vm_bind-oom<br />
-igt@gem_shrink@vm_bind-sanitycheck<br />
-igt@gem_shrink@vm_bind-userptr<br />
-igt@gem_shrink@vm_bind-userptr-dirty<br />
-igt@gem_userptr_blits@vma-merge-execbuf3<br />
-igt@i915_vm_bind_basic@2m<br />
-igt@i915_vm_bind_basic@2m_sync_bind<br />
-igt@i915_vm_bind_basic@64k<br />
-igt@i915_vm_bind_basic@basic<br />
-igt@i915_vm_bind_basic@multi_cmds<br />
-igt@i915_vm_bind_basic@multi_ctxts<br />
-igt@i915_vm_bind_basic@share_vm<br />
-igt@i915_vm_bind_basic@skip_copy<br />
-igt@i915_vm_bind_basic@skip_unbind<br />
-igt@i915_vm_bind_capture@basic<br />
-igt@i915_vm_bind_sanity@basic</p>

</body>
</html>

--===============7323175798369670209==--
