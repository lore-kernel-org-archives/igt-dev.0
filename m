Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2827806747450935102=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 21 Dec 2022 20:39:57 -0000
Message-ID: <167165519727.32313.11287183972303991959@emeril.freedesktop.org>
References: <20221220155754.63808-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221220155754.63808-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fctx=5Fshared=3A_Release_offset_after_use_=28rev2=29?=
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

--===============2827806747450935102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_ctx_shared: Release offset after use (rev2)
URL   : https://patchwork.freedesktop.org/series/112110/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12519 -> IGTPW_8261
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html

Participating hosts (47 -> 45)
------------------------------

  Missing    (2): fi-rkl-11600 fi-tgl-dsi 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8261:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_fence@basic-await@rcs0:
    - {bat-dg2-9}:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_8261 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [PASS][3] -> [FAIL][4] ([i915#7229])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][5] ([i915#5334]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@requests:
    - {bat-adlp-6}:       [INCOMPLETE][7] ([i915#4983] / [i915#6257]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/bat-adlp-6/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/bat-adlp-6/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7625]: https://gitlab.freedesktop.org/drm/intel/issues/7625


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7101 -> IGTPW_8261

  CI-20190529: 20190529
  CI_DRM_12519: 55945e9eb4ad6f1273f70e54c805c0965f23c547 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html
  IGT_7101: bd33b4c060eb6b2e24c5784b2aa817ae5840f84f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html

--===============2827806747450935102==
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
<tr><td><b>Series:</b></td><td>tests/gem_ctx_shared: Release offset after use (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112110/">https://patchwork.freedesktop.org/series/112110/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12519 -&gt; IGTPW_8261</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html</p>
<h2>Participating hosts (47 -&gt; 45)</h2>
<p>Missing    (2): fi-rkl-11600 fi-tgl-dsi </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8261:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_fence@basic-await@rcs0:<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/bat-dg2-9/igt@gem_exec_fence@basic-await@rcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8261 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@gem_exec_gttfill@basic:<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12519/bat-adlp-6/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6257">i915#6257</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/bat-adlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7101 -&gt; IGTPW_8261</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12519: 55945e9eb4ad6f1273f70e54c805c0965f23c547 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8261: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8261/index.html<br />
  IGT_7101: bd33b4c060eb6b2e24c5784b2aa817ae5840f84f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============2827806747450935102==--
