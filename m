Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5873644070585910806=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Date: Fri, 03 Feb 2023 13:09:23 -0000
Message-ID: <167542976364.8763.8292004285805398260@emeril.freedesktop.org>
References: <20230203075806.1589164-1-jouni.hogander@intel.com>
In-Reply-To: <20230203075806.1589164-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgUHNyMiBk?=
 =?utf-8?q?sc_testcases_=28rev2=29?=
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

--===============5873644070585910806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Psr2 dsc testcases (rev2)
URL   : https://patchwork.freedesktop.org/series/113308/
State : success

== Summary ==

CI Bug Log - changes from IGT_7146 -> IGTPW_8440
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html

Participating hosts (25 -> 25)
------------------------------

  Additional (1): fi-blb-e6850 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8440 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@module-reload:
    - fi-blb-e6850:       NOTRUN -> [SKIP][1] ([fdo#109271]) +51 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - {bat-jsl-1}:        [DMESG-FAIL][2] ([i915#5334]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7146/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7996]: https://gitlab.freedesktop.org/drm/intel/issues/7996


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7146 -> IGTPW_8440

  CI-20190529: 20190529
  CI_DRM_12688: 9fcffc218abe16fc5fbfca231fda6a7218661eb6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8440: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html
  IGT_7146: cfb2b835a2d688f123c9ffe5ecc7148e19e30e39 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_plane_alpha_blend@alpha-7efc
+igt@kms_plane_alpha_blend@alpha-basic
+igt@kms_plane_alpha_blend@alpha-opaque-fb
+igt@kms_plane_alpha_blend@alpha-transparent-fb
+igt@kms_plane_alpha_blend@constant-alpha-max
+igt@kms_plane_alpha_blend@constant-alpha-mid
+igt@kms_plane_alpha_blend@constant-alpha-min
+igt@kms_plane_alpha_blend@coverage-7efc
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html

--===============5873644070585910806==
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
<tr><td><b>Series:</b></td><td>Psr2 dsc testcases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113308/">https://patchwork.freedesktop.org/series/113308/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7146 -&gt; IGTPW_8440</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html</p>
<h2>Participating hosts (25 -&gt; 25)</h2>
<p>Additional (1): fi-blb-e6850 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8440 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/fi-blb-e6850/igt@i915_pm_rpm@module-reload.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7146/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7146 -&gt; IGTPW_8440</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12688: 9fcffc218abe16fc5fbfca231fda6a7218661eb6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8440: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8440/index.html<br />
  IGT_7146: cfb2b835a2d688f123c9ffe5ecc7148e19e30e39 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_plane_alpha_blend@alpha-7efc<br />
+igt@kms_plane_alpha_blend@alpha-basic<br />
+igt@kms_plane_alpha_blend@alpha-opaque-fb<br />
+igt@kms_plane_alpha_blend@alpha-transparent-fb<br />
+igt@kms_plane_alpha_blend@constant-alpha-max<br />
+igt@kms_plane_alpha_blend@constant-alpha-mid<br />
+igt@kms_plane_alpha_blend@constant-alpha-min<br />
+igt@kms_plane_alpha_blend@coverage-7efc<br />
+igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant</p>

</body>
</html>

--===============5873644070585910806==--
