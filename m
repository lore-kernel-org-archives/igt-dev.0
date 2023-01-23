Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8717411324759922686=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Date: Mon, 23 Jan 2023 11:56:03 -0000
Message-ID: <167447496337.347.5826788067126163729@emeril.freedesktop.org>
References: <20230120100750.24122-1-nirmoy.das@intel.com>
In-Reply-To: <20230120100750.24122-1-nirmoy.das@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/intel=5Fmemory=5Fregi?=
 =?utf-8?q?on=3A_Add_gem=5Fhas=5Fsmallbar_=28rev2=29?=
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

--===============8717411324759922686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/intel_memory_region: Add gem_has_smallbar (rev2)
URL   : https://patchwork.freedesktop.org/series/113143/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12622 -> IGTPW_8390
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html

Participating hosts (39 -> 37)
------------------------------

  Missing    (2): bat-rpls-2 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8390 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:
    - fi-ctg-p8600:       [PASS][1] -> [FAIL][2] ([fdo#103375])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-ctg-p8600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-ctg-p8600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-ctg-p8600:       [DMESG-WARN][3] ([i915#6020]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-ctg-p8600/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-ctg-p8600/igt@i915_module_load@load.html

  * igt@i915_selftest@live@migrate:
    - {bat-dg2-11}:       [DMESG-WARN][5] ([i915#7699]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/bat-dg2-11/igt@i915_selftest@live@migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/bat-dg2-11/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@mman:
    - fi-rkl-guc:         [TIMEOUT][7] ([i915#6794]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-rkl-guc/igt@i915_selftest@live@mman.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-rkl-guc/igt@i915_selftest@live@mman.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - bat-dg1-5:          [FAIL][9] ([fdo#103375]) -> [PASS][10] +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6020]: https://gitlab.freedesktop.org/drm/intel/issues/6020
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7077]: https://gitlab.freedesktop.org/drm/intel/issues/7077
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7131 -> IGTPW_8390

  CI-20190529: 20190529
  CI_DRM_12622: 93e8ce8fb03496d8d0ccf15e7363563af90a4f8f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html
  IGT_7131: 13b07163b012f6a195463bc14c06b84ecbd9f094 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html

--===============8717411324759922686==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/i915/intel_memory_region: Add gem_has_smallbar (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113143/">https://patchwork.freedesktop.org/series/113143/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12622 -&gt; IGTPW_8390</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html</p>
<h2>Participating hosts (39 -&gt; 37)</h2>
<p>Missing    (2): bat-rpls-2 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8390 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1:<ul>
<li>fi-ctg-p8600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-ctg-p8600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-ctg-p8600/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-lvds-1.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-ctg-p8600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-ctg-p8600/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6020">i915#6020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-ctg-p8600/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/bat-dg2-11/igt@i915_selftest@live@migrate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/bat-dg2-11/igt@i915_selftest@live@migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/fi-rkl-guc/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/fi-rkl-guc/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12622/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/bat-dg1-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">PASS</a> +3 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7131 -&gt; IGTPW_8390</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12622: 93e8ce8fb03496d8d0ccf15e7363563af90a4f8f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8390: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8390/index.html<br />
  IGT_7131: 13b07163b012f6a195463bc14c06b84ecbd9f094 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8717411324759922686==--
