Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2282621457917335610=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Wed, 23 Nov 2022 21:59:35 -0000
Message-ID: <166924077587.15573.18223201782077317274@emeril.freedesktop.org>
References: <20221123211830.630263-1-ashutosh.dixit@intel.com>
In-Reply-To: <20221123211830.630263-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRml4IFBN?=
 =?utf-8?q?U_freq_verification_with_SLPC?=
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

--===============2282621457917335610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix PMU freq verification with SLPC
URL   : https://patchwork.freedesktop.org/series/111282/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12425 -> IGTPW_8148
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html

Participating hosts (38 -> 35)
------------------------------

  Missing    (3): fi-ctg-p8600 bat-dg2-11 bat-dg1-6 

Known issues
------------

  Here are the changes found in IGTPW_8148 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-rkl-11600:       NOTRUN -> [FAIL][1] ([fdo#103375])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-rkl-11600:       NOTRUN -> [SKIP][2] ([fdo#111827])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@gem_exec_gttfill@basic:
    - fi-pnv-d510:        [FAIL][3] ([i915#7229]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@i915_module_load@reload:
    - {bat-rpls-2}:       [DMESG-WARN][5] ([i915#6434]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/bat-rpls-2/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/bat-rpls-2/igt@i915_module_load@reload.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [INCOMPLETE][7] ([i915#4817]) -> [FAIL][8] ([fdo#103375])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#5278]: https://gitlab.freedesktop.org/drm/intel/issues/5278
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6434]: https://gitlab.freedesktop.org/drm/intel/issues/6434
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7072 -> IGTPW_8148

  CI-20190529: 20190529
  CI_DRM_12425: 66e5d8e0cdb991feba4fde2c851e700f993d240a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_chamelium@common-hpd-after-hibernate
+igt@kms_chamelium@common-hpd-after-suspend
+igt@kms_chamelium@dp-hpd
+igt@kms_chamelium@dp-hpd-after-hibernate
+igt@kms_chamelium@dp-hpd-after-suspend
+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-fast
+igt@kms_chamelium@dp-hpd-for-each-pipe
+igt@kms_chamelium@dp-hpd-storm
+igt@kms_chamelium@dp-hpd-storm-disable
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd
+igt@kms_chamelium@hdmi-hpd-after-hibernate
+igt@kms_chamelium@hdmi-hpd-after-suspend
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-fast
+igt@kms_chamelium@hdmi-hpd-for-each-pipe
+igt@kms_chamelium@hdmi-hpd-storm
+igt@kms_chamelium@hdmi-hpd-storm-disable
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@vga-hpd
+igt@kms_chamelium@vga-hpd-after-hibernate
+igt@kms_chamelium@vga-hpd-after-suspend
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-fast
+igt@kms_chamelium@vga-hpd-for-each-pipe
+igt@kms_chamelium@vga-hpd-without-ddc
+igt@kms_chamelium@vga-hpd-with-enabled-mode
+igt@kms_color_chamelium@ctm-0-25
+igt@kms_color_chamelium@ctm-0-50
+igt@kms_color_chamelium@ctm-0-75
+igt@kms_color_chamelium@ctm-blue-to-red
+igt@kms_color_chamelium@ctm-green-to-red
+igt@kms_color_chamelium@ctm-limited-range
+igt@kms_color_chamelium@ctm-max
+igt@kms_color_chamelium@ctm-negative
+igt@kms_color_chamelium@ctm-red-to-blue
+igt@kms_color_chamelium@degamma
+igt@kms_color_chamelium@gamma
-igt@kms_chamelium_color@ctm-0-25
-igt@kms_chamelium_color@ctm-0-50
-igt@kms_chamelium_color@ctm-0-75
-igt@kms_chamelium_color@ctm-blue-to-red
-igt@kms_chamelium_color@ctm-green-to-red
-igt@kms_chamelium_color@ctm-limited-range
-igt@kms_chamelium_color@ctm-max
-igt@kms_chamelium_color@ctm-negative
-igt@kms_chamelium_color@ctm-red-to-blue
-igt@kms_chamelium_color@degamma
-igt@kms_chamelium_color@gamma
-igt@kms_chamelium_hpd@common-hpd-after-hibernate
-igt@kms_chamelium_hpd@common-hpd-after-suspend
-igt@kms_chamelium_hpd@dp-hpd
-igt@kms_chamelium_hpd@dp-hpd-after-hibernate
-igt@kms_chamelium_hpd@dp-hpd-after-suspend
-igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@dp-hpd-fast
-igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
-igt@kms_chamelium_hpd@dp-hpd-storm
-igt@kms_chamelium_hpd@dp-hpd-storm-disable
-igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
-igt@kms_chamelium_hpd@hdmi-hpd
-igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
-igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@hdmi-hpd-fast
-igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
-igt@kms_chamelium_hpd@hdmi-hpd-storm
-igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
-igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
-igt@kms_chamelium_hpd@vga-hpd
-igt@kms_chamelium_hpd@vga-hpd-after-hibernate
-igt@kms_chamelium_hpd@vga-hpd-after-suspend
-igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
-igt@kms_chamelium_hpd@vga-hpd-fast
-igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
-igt@kms_chamelium_hpd@vga-hpd-without-ddc
-igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html

--===============2282621457917335610==
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
<tr><td><b>Series:</b></td><td>Fix PMU freq verification with SLPC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111282/">https://patchwork.freedesktop.org/series/111282/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12425 -&gt; IGTPW_8148</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html</p>
<h2>Participating hosts (38 -&gt; 35)</h2>
<p>Missing    (3): fi-ctg-p8600 bat-dg2-11 bat-dg1-6 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8148 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/bat-rpls-2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6434">i915#6434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/bat-rpls-2/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12425/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7072 -&gt; IGTPW_8148</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12425: 66e5d8e0cdb991feba4fde2c851e700f993d240a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8148: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8148/index.html<br />
  IGT_7072: 69ba7163475925cdc69aebbdfa0e87453ae165c7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_chamelium@common-hpd-after-hibernate<br />
+igt@kms_chamelium@common-hpd-after-suspend<br />
+igt@kms_chamelium@dp-hpd<br />
+igt@kms_chamelium@dp-hpd-after-hibernate<br />
+igt@kms_chamelium@dp-hpd-after-suspend<br />
+igt@kms_chamelium@dp-hpd-enable-disable-mode<br />
+igt@kms_chamelium@dp-hpd-fast<br />
+igt@kms_chamelium@dp-hpd-for-each-pipe<br />
+igt@kms_chamelium@dp-hpd-storm<br />
+igt@kms_chamelium@dp-hpd-storm-disable<br />
+igt@kms_chamelium@dp-hpd-with-enabled-mode<br />
+igt@kms_chamelium@hdmi-hpd<br />
+igt@kms_chamelium@hdmi-hpd-after-hibernate<br />
+igt@kms_chamelium@hdmi-hpd-after-suspend<br />
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode<br />
+igt@kms_chamelium@hdmi-hpd-fast<br />
+igt@kms_chamelium@hdmi-hpd-for-each-pipe<br />
+igt@kms_chamelium@hdmi-hpd-storm<br />
+igt@kms_chamelium@hdmi-hpd-storm-disable<br />
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode<br />
+igt@kms_chamelium@vga-hpd<br />
+igt@kms_chamelium@vga-hpd-after-hibernate<br />
+igt@kms_chamelium@vga-hpd-after-suspend<br />
+igt@kms_chamelium@vga-hpd-enable-disable-mode<br />
+igt@kms_chamelium@vga-hpd-fast<br />
+igt@kms_chamelium@vga-hpd-for-each-pipe<br />
+igt@kms_chamelium@vga-hpd-without-ddc<br />
+igt@kms_chamelium@vga-hpd-with-enabled-mode<br />
+igt@kms_color_chamelium@ctm-0-25<br />
+igt@kms_color_chamelium@ctm-0-50<br />
+igt@kms_color_chamelium@ctm-0-75<br />
+igt@kms_color_chamelium@ctm-blue-to-red<br />
+igt@kms_color_chamelium@ctm-green-to-red<br />
+igt@kms_color_chamelium@ctm-limited-range<br />
+igt@kms_color_chamelium@ctm-max<br />
+igt@kms_color_chamelium@ctm-negative<br />
+igt@kms_color_chamelium@ctm-red-to-blue<br />
+igt@kms_color_chamelium@degamma<br />
+igt@kms_color_chamelium@gamma<br />
-igt@kms_chamelium_color@ctm-0-25<br />
-igt@kms_chamelium_color@ctm-0-50<br />
-igt@kms_chamelium_color@ctm-0-75<br />
-igt@kms_chamelium_color@ctm-blue-to-red<br />
-igt@kms_chamelium_color@ctm-green-to-red<br />
-igt@kms_chamelium_color@ctm-limited-range<br />
-igt@kms_chamelium_color@ctm-max<br />
-igt@kms_chamelium_color@ctm-negative<br />
-igt@kms_chamelium_color@ctm-red-to-blue<br />
-igt@kms_chamelium_color@degamma<br />
-igt@kms_chamelium_color@gamma<br />
-igt@kms_chamelium_hpd@common-hpd-after-hibernate<br />
-igt@kms_chamelium_hpd@common-hpd-after-suspend<br />
-igt@kms_chamelium_hpd@dp-hpd<br />
-igt@kms_chamelium_hpd@dp-hpd-after-hibernate<br />
-igt@kms_chamelium_hpd@dp-hpd-after-suspend<br />
-igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode<br />
-igt@kms_chamelium_hpd@dp-hpd-fast<br />
-igt@kms_chamelium_hpd@dp-hpd-for-each-pipe<br />
-igt@kms_chamelium_hpd@dp-hpd-storm<br />
-igt@kms_chamelium_hpd@dp-hpd-storm-disable<br />
-igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode<br />
-igt@kms_chamelium_hpd@hdmi-hpd<br />
-igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate<br />
-igt@kms_chamelium_hpd@hdmi-hpd-after-suspend<br />
-igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode<br />
-igt@kms_chamelium_hpd@hdmi-hpd-fast<br />
-igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe<br />
-igt@kms_chamelium_hpd@hdmi-hpd-storm<br />
-igt@kms_chamelium_hpd@hdmi-hpd-storm-disable<br />
-igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode<br />
-igt@kms_chamelium_hpd@vga-hpd<br />
-igt@kms_chamelium_hpd@vga-hpd-after-hibernate<br />
-igt@kms_chamelium_hpd@vga-hpd-after-suspend<br />
-igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode<br />
-igt@kms_chamelium_hpd@vga-hpd-fast<br />
-igt@kms_chamelium_hpd@vga-hpd-for-each-pipe<br />
-igt@kms_chamelium_hpd@vga-hpd-without-ddc<br />
-igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode</p>

</body>
</html>

--===============2282621457917335610==--
