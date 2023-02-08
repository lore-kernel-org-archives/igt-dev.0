Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3078236671406323209=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Wed, 08 Feb 2023 17:47:05 -0000
Message-ID: <167587842554.386.6747974289107129329@emeril.freedesktop.org>
References: <20230208062459.1113975-1-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230208062459.1113975-1-alan.previn.teres.alexis@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/pxp=3A_test=5Fpxp=5Fstale=5Fbuf=5Foptout=5Fexecution_requi?=
 =?utf-8?q?res_arb_session?=
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

--===============3078236671406323209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/pxp: test_pxp_stale_buf_optout_execution requires arb session
URL   : https://patchwork.freedesktop.org/series/113760/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12712 -> IGTPW_8461
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-atsm-1 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8461:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@reset:
    - {bat-dg2-11}:       [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-dg2-11/igt@i915_selftest@live@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-dg2-11/igt@i915_selftest@live@reset.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12712 and IGTPW_8461:

### New IGT tests (1) ###

  * igt@i915_pm_rpm@module-reload:
    - Statuses : 31 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8461 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][3] ([i915#7229]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [ABORT][5] ([i915#4983]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-rpls-2/igt@i915_selftest@live@reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-rpls-2/igt@i915_selftest@live@reset.html
    - {bat-rpls-1}:       [ABORT][7] ([i915#4983]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-rpls-1/igt@i915_selftest@live@reset.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-rpls-1/igt@i915_selftest@live@reset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7153 -> IGTPW_8461

  CI-20190529: 20190529
  CI_DRM_12712: 579f8b992ea3f5cd11bd803dd0585a7ddb006a13 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8461: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html

--===============3078236671406323209==
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
<tr><td><b>Series:</b></td><td>tests/i915/pxp: test_pxp_stale_buf_optout_execution requires arb session</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113760/">https://patchwork.freedesktop.org/series/113760/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12712 -&gt; IGTPW_8461</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-atsm-1 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8461:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@reset:<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-dg2-11/igt@i915_selftest@live@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-dg2-11/igt@i915_selftest@live@reset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12712 and IGTPW_8461:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>Statuses : 31 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8461 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-rpls-2/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12712/bat-rpls-1/igt@i915_selftest@live@reset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/bat-rpls-1/igt@i915_selftest@live@reset.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7153 -&gt; IGTPW_8461</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12712: 579f8b992ea3f5cd11bd803dd0585a7ddb006a13 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8461: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8461/index.html<br />
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3078236671406323209==--
