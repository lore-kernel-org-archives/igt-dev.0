Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4883192841233123402=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Tue, 19 Sep 2023 18:17:38 -0000
Message-ID: <169514745831.3668.6891375842046533435@emeril.freedesktop.org>
References: <20230919170230.3307408-1-jonathan.cavitt@intel.com>
In-Reply-To: <20230919170230.3307408-1-jonathan.cavitt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fallocator=3A_Limit_last_page_if_not_reserved?=
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

--===============4883192841233123402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_allocator: Limit last page if not reserved
URL   : https://patchwork.freedesktop.org/series/123924/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13651 -> IGTPW_9828
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9828 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9828, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/index.html

Participating hosts (38 -> 35)
------------------------------

  Additional (1): bat-rpls-2 
  Missing    (4): bat-adlm-1 bat-atsm-1 fi-snb-2520m fi-pnv-d510 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9828:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-mtlp-8:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-8/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-mtlp-8/igt@i915_module_load@load.html

  * igt@runner@aborted:
    - bat-rpls-2:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-rpls-2/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_9828 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@engines@fds:
    - bat-mtlp-6:         [PASS][4] -> [ABORT][5] ([i915#9262])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][6] -> [INCOMPLETE][7] ([i915#8797] / [i915#9275])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [PASS][8] -> [DMESG-FAIL][9] ([i915#5334])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [ABORT][10] ([i915#7913]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - {bat-dg2-13}:       [DMESG-WARN][12] ([i915#7952]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8797]: https://gitlab.freedesktop.org/drm/intel/issues/8797
  [i915#9262]: https://gitlab.freedesktop.org/drm/intel/issues/9262
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7493 -> IGTPW_9828

  CI-20190529: 20190529
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9828: 9828
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_mmio@mmio-invalid
+igt@xe_mmio@mmio-timestamp
+igt@xe_query@query-gts
-igt@xe_exec_balancer@many-cm-parallel-basic
-igt@xe_exec_balancer@many-cm-parallel-rebind
-igt@xe_exec_balancer@many-cm-parallel-userptr
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-basic
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@once-cm-parallel-basic
-igt@xe_exec_balancer@once-cm-parallel-rebind
-igt@xe_exec_balancer@once-cm-parallel-userptr
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind
-igt@xe_exec_balancer@twice-cm-parallel-basic
-igt@xe_exec_balancer@twice-cm-parallel-rebind
-igt@xe_exec_balancer@twice-cm-parallel-userptr
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind
-igt@xe_query@query-cs-cycles
-igt@xe_query@query-gt-list
-igt@xe_query@query-invalid-cs-cycles

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/index.html

--===============4883192841233123402==
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
<tr><td><b>Series:</b></td><td>lib/intel_allocator: Limit last page if not reserved</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123924/">https://patchwork.freedesktop.org/series/123924/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13651 -&gt; IGTPW_9828</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9828 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9828, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Additional (1): bat-rpls-2 <br />
  Missing    (4): bat-adlm-1 bat-atsm-1 fi-snb-2520m fi-pnv-d510 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9828:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-8/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-mtlp-8/igt@i915_module_load@load.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-rpls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-rpls-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9828 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-mtlp-6/igt@gem_exec_parallel@engines@fds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9262">i915#9262</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8797">i915#8797</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13651/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7952">i915#7952</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9828/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7493 -&gt; IGTPW_9828</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13651: 61b71c3f061a44a6ab1dcf756918886aa03a5480 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9828: 9828<br />
  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_mmio@mmio-invalid<br />
+igt@xe_mmio@mmio-timestamp<br />
+igt@xe_query@query-gts<br />
-igt@xe_exec_balancer@many-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-basic<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-basic<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-rebind<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-basic<br />
-igt@xe_exec_balancer@once-cm-parallel-rebind<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@once-cm-parallel-userptr-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-basic<br />
-igt@xe_exec_balancer@twice-cm-parallel-rebind<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race<br />
-igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind<br />
-igt@xe_query@query-cs-cycles<br />
-igt@xe_query@query-gt-list<br />
-igt@xe_query@query-invalid-cs-cycles</p>

</body>
</html>

--===============4883192841233123402==--
