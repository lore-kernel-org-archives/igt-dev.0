Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6030813935884730769=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 28 Apr 2023 08:20:39 -0000
Message-ID: <168267003938.32439.12921584318479376668@emeril.freedesktop.org>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIElH?=
 =?utf-8?q?T_display_support_for_XE_=28rev8=29?=
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

--===============6030813935884730769==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add IGT display support for XE (rev8)
URL   : https://patchwork.freedesktop.org/series/116658/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13071 -> IGTPW_8882
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): bat-mtlp-8 fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8882:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@i915_selftest@live@requests:
    - {bat-mtlp-6}:       [ABORT][1] ([i915#7920]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/bat-mtlp-6/igt@i915_selftest@live@requests.html

  
Known issues
------------

  Here are the changes found in IGTPW_8882 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@mman:
    - bat-rpls-1:         [PASS][3] -> [TIMEOUT][4] ([i915#7392])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/bat-rpls-1/igt@i915_selftest@live@mman.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/bat-rpls-1/igt@i915_selftest@live@mman.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-glk-j4005:       [FAIL][5] ([i915#7916]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7916]: https://gitlab.freedesktop.org/drm/intel/issues/7916
  [i915#7920]: https://gitlab.freedesktop.org/drm/intel/issues/7920


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7273 -> IGTPW_8882

  CI-20190529: 20190529
  CI_DRM_13071: b9458e7075652669ec0e04abe039a5ed001701fe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html
  IGT_7273: f40ef4b058466219968b7792d22ff0648b82396b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_scaling@intel-max-src-size
-igt@kms_plane_scaling@i915-max-src-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html

--===============6030813935884730769==
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
<tr><td><b>Series:</b></td><td>Add IGT display support for XE (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/116658/">https://patchwork.freedesktop.org/series/116658/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13071 -&gt; IGTPW_8882</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): bat-mtlp-8 fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8882:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@requests:<ul>
<li>{bat-mtlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/bat-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7920">i915#7920</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/bat-mtlp-6/igt@i915_selftest@live@requests.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8882 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/bat-rpls-1/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/bat-rpls-1/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-glk-j4005:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13071/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7916">i915#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7273 -&gt; IGTPW_8882</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13071: b9458e7075652669ec0e04abe039a5ed001701fe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8882: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8882/index.html<br />
  IGT_7273: f40ef4b058466219968b7792d22ff0648b82396b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_scaling@intel-max-src-size<br />
-igt@kms_plane_scaling@i915-max-src-size</p>

</body>
</html>

--===============6030813935884730769==--
