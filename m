Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1791875809471564710=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 31 Jan 2023 14:24:27 -0000
Message-ID: <167517506736.5939.5426730380509382517@emeril.freedesktop.org>
References: <20230131133658.21970-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230131133658.21970-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgTGltaXQg?=
 =?utf-8?q?the_execution_to_few_pipes/planes?=
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

--===============1791875809471564710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit the execution to few pipes/planes
URL   : https://patchwork.freedesktop.org/series/113526/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12673 -> IGTPW_8422
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html

Participating hosts (27 -> 26)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8422 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@fbdev@write:
    - fi-blb-e6850:       [SKIP][1] ([fdo#109271]) -> [PASS][2] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/fi-blb-e6850/igt@fbdev@write.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/fi-blb-e6850/igt@fbdev@write.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][3] ([i915#5334]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg2-11}:       [ABORT][5] ([i915#7913]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/bat-dg2-11/igt@i915_selftest@live@hangcheck.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/bat-dg2-11/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@requests:
    - {bat-rpls-2}:       [ABORT][7] ([i915#4983]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/bat-rpls-2/igt@i915_selftest@live@requests.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/bat-rpls-2/igt@i915_selftest@live@requests.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7143 -> IGTPW_8422

  CI-20190529: 20190529
  CI_DRM_12673: d6444a2c993df9f17645e250a9fd07d7f881dabe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8422: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html

--===============1791875809471564710==
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
<tr><td><b>Series:</b></td><td>Limit the execution to few pipes/planes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113526/">https://patchwork.freedesktop.org/series/113526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12673 -&gt; IGTPW_8422</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html</p>
<h2>Participating hosts (27 -&gt; 26)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8422 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/fi-blb-e6850/igt@fbdev@write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/fi-blb-e6850/igt@fbdev@write.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/bat-dg2-11/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12673/bat-rpls-2/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/bat-rpls-2/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7143 -&gt; IGTPW_8422</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12673: d6444a2c993df9f17645e250a9fd07d7f881dabe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8422: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8422/index.html<br />
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1791875809471564710==--
