Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5975467355092073461=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janusz Krzysztofik" <janusz.krzysztofik@linux.intel.com>
Date: Tue, 31 Jan 2023 11:16:44 -0000
Message-ID: <167516380438.5939.9347305006200458888@emeril.freedesktop.org>
References: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230131091731.5892-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_Add_stress_/_race_exercises?=
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

--===============5975467355092073461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf: Add stress / race exercises
URL   : https://patchwork.freedesktop.org/series/113522/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12672 -> IGTPW_8419
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html

Participating hosts (26 -> 25)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8419 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg1-5:          [PASS][1] -> [ABORT][2] ([i915#4983] / [i915#7981])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-dg1-5/igt@i915_selftest@live@workarounds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-dg1-5/igt@i915_selftest@live@workarounds.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@basic-rte:
    - {bat-adlp-6}:       [ABORT][3] ([i915#7977]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg2-8}:        [ABORT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-dg2-8/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-dg2-8/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7977]: https://gitlab.freedesktop.org/drm/intel/issues/7977
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7143 -> IGTPW_8419

  CI-20190529: 20190529
  CI_DRM_12672: df5c31e78609626a1278ad79305cd408f403ceac @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8419: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@perf@barrier-race
+igt@perf@open-race
-igt@v3d/v3d_submit_cl@bad-bo
-igt@v3d/v3d_submit_cl@bad-extension
-igt@v3d/v3d_submit_cl@bad-flag
-igt@v3d/v3d_submit_cl@bad-in-sync
-igt@v3d/v3d_submit_cl@bad-multisync-extension
-igt@v3d/v3d_submit_cl@bad-multisync-in-sync
-igt@v3d/v3d_submit_cl@bad-multisync-out-sync
-igt@v3d/v3d_submit_cl@bad-multisync-pad
-igt@v3d/v3d_submit_cl@bad-pad
-igt@v3d/v3d_submit_cl@bad-perfmon
-igt@v3d/v3d_submit_cl@job-perfmon
-igt@v3d/v3d_submit_cl@multiple-job-submission
-igt@v3d/v3d_submit_cl@multisync-out-syncs
-igt@v3d/v3d_submit_cl@multi-and-single-sync
-igt@v3d/v3d_submit_cl@simple-flush-cache
-igt@v3d/v3d_submit_cl@single-in-sync
-igt@v3d/v3d_submit_cl@single-out-sync
-igt@v3d/v3d_submit_cl@valid-multisync-submission
-igt@v3d/v3d_submit_cl@valid-submission
-igt@v3d/v3d_wait_bo@bad-bo
-igt@v3d/v3d_wait_bo@bad-pad
-igt@v3d/v3d_wait_bo@map-bo-0ns
-igt@v3d/v3d_wait_bo@map-bo-1ns
-igt@v3d/v3d_wait_bo@unused-bo-0ns
-igt@v3d/v3d_wait_bo@unused-bo-1ns
-igt@v3d/v3d_wait_bo@used-bo
-igt@v3d/v3d_wait_bo@used-bo-0ns
-igt@v3d/v3d_wait_bo@used-bo-1ns

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html

--===============5975467355092073461==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf: Add stress / race exercises</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113522/">https://patchwork.freedesktop.org/series/113522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12672 -&gt; IGTPW_8419</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html</p>
<h2>Participating hosts (26 -&gt; 25)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8419 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@workarounds:<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-dg1-5/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-dg1-5/igt@i915_selftest@live@workarounds.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7981">i915#7981</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7977">i915#7977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-adlp-6/igt@i915_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg2-8}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12672/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/bat-dg2-8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7143 -&gt; IGTPW_8419</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12672: df5c31e78609626a1278ad79305cd408f403ceac @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8419: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8419/index.html<br />
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@perf@barrier-race<br />
+igt@perf@open-race<br />
-igt@v3d/v3d_submit_cl@bad-bo<br />
-igt@v3d/v3d_submit_cl@bad-extension<br />
-igt@v3d/v3d_submit_cl@bad-flag<br />
-igt@v3d/v3d_submit_cl@bad-in-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-extension<br />
-igt@v3d/v3d_submit_cl@bad-multisync-in-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-out-sync<br />
-igt@v3d/v3d_submit_cl@bad-multisync-pad<br />
-igt@v3d/v3d_submit_cl@bad-pad<br />
-igt@v3d/v3d_submit_cl@bad-perfmon<br />
-igt@v3d/v3d_submit_cl@job-perfmon<br />
-igt@v3d/v3d_submit_cl@multiple-job-submission<br />
-igt@v3d/v3d_submit_cl@multisync-out-syncs<br />
-igt@v3d/v3d_submit_cl@multi-and-single-sync<br />
-igt@v3d/v3d_submit_cl@simple-flush-cache<br />
-igt@v3d/v3d_submit_cl@single-in-sync<br />
-igt@v3d/v3d_submit_cl@single-out-sync<br />
-igt@v3d/v3d_submit_cl@valid-multisync-submission<br />
-igt@v3d/v3d_submit_cl@valid-submission<br />
-igt@v3d/v3d_wait_bo@bad-bo<br />
-igt@v3d/v3d_wait_bo@bad-pad<br />
-igt@v3d/v3d_wait_bo@map-bo-0ns<br />
-igt@v3d/v3d_wait_bo@map-bo-1ns<br />
-igt@v3d/v3d_wait_bo@unused-bo-0ns<br />
-igt@v3d/v3d_wait_bo@unused-bo-1ns<br />
-igt@v3d/v3d_wait_bo@used-bo<br />
-igt@v3d/v3d_wait_bo@used-bo-0ns<br />
-igt@v3d/v3d_wait_bo@used-bo-1ns</p>

</body>
</html>

--===============5975467355092073461==--
