Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8165907575674781727=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mark Yacoub" <markyacoub@chromium.org>
Date: Thu, 17 Nov 2022 21:11:05 -0000
Message-ID: <166871946517.12188.1433790947181713185@emeril.freedesktop.org>
References: <20221117194639.481656-1-markyacoub@chromium.org>
In-Reply-To: <20221117194639.481656-1-markyacoub@chromium.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ3YzIFdv?=
 =?utf-8?q?rkaround=3A_Skip_Plug_all_at_init=2E?=
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

--===============8165907575674781727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cv3 Workaround: Skip Plug all at init.
URL   : https://patchwork.freedesktop.org/series/111037/
State : success

== Summary ==

CI Bug Log - changes from IGT_7066 -> IGTPW_8126
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html

Participating hosts (42 -> 37)
------------------------------

  Additional (1): bat-jsl-1 
  Missing    (6): fi-ilk-m540 bat-dg1-6 fi-ctg-p8600 fi-hsw-4770 bat-rpls-1 fi-bdw-samus 

Known issues
------------

  Here are the changes found in IGTPW_8126 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@mman:
    - fi-rkl-guc:         [PASS][1] -> [TIMEOUT][2] ([i915#6794])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-rkl-guc/igt@i915_selftest@live@mman.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-rkl-guc/igt@i915_selftest@live@mman.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-bxt-dsi:         [DMESG-FAIL][3] ([i915#5334]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - {bat-adln-1}:       [DMESG-FAIL][5] ([i915#4258]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-adln-1/igt@i915_selftest@live@gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-adln-1/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@hangcheck:
    - {bat-dg1-7}:        [INCOMPLETE][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-dg1-7/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-dg1-7/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@reset:
    - {bat-rpls-2}:       [DMESG-FAIL][9] ([i915#4983]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-rpls-2/igt@i915_selftest@live@reset.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-rpls-2/igt@i915_selftest@live@reset.html

  
#### Warnings ####

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [FAIL][11] ([fdo#103375]) -> [INCOMPLETE][12] ([i915#4817])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3003]: https://gitlab.freedesktop.org/drm/intel/issues/3003
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4258]: https://gitlab.freedesktop.org/drm/intel/issues/4258
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5153]: https://gitlab.freedesktop.org/drm/intel/issues/5153
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6559]: https://gitlab.freedesktop.org/drm/intel/issues/6559
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#6997]: https://gitlab.freedesktop.org/drm/intel/issues/6997
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7066 -> IGTPW_8126

  CI-20190529: 20190529
  CI_DRM_12396: 75ed1f4f7835f178647e3f73910ed4af0944d9ec @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8126: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html
  IGT_7066: 2470b918175f314fef2e4e8ef0aa8acafb4ff945 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html

--===============8165907575674781727==
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
<tr><td><b>Series:</b></td><td>Cv3 Workaround: Skip Plug all at init.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111037/">https://patchwork.freedesktop.org/series/111037/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7066 -&gt; IGTPW_8126</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html</p>
<h2>Participating hosts (42 -&gt; 37)</h2>
<p>Additional (1): bat-jsl-1 <br />
  Missing    (6): fi-ilk-m540 bat-dg1-6 fi-ctg-p8600 fi-hsw-4770 bat-rpls-1 fi-bdw-samus </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8126 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@mman:<ul>
<li>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-rkl-guc/igt@i915_selftest@live@mman.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-rkl-guc/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-bxt-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-adln-1/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4258">i915#4258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-adln-1/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{bat-dg1-7}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-dg1-7/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-dg1-7/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/bat-rpls-2/igt@i915_selftest@live@reset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4983">i915#4983</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/bat-rpls-2/igt@i915_selftest@live@reset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@basic-s3-without-i915:<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7066/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7066 -&gt; IGTPW_8126</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12396: 75ed1f4f7835f178647e3f73910ed4af0944d9ec @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8126: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8126/index.html<br />
  IGT_7066: 2470b918175f314fef2e4e8ef0aa8acafb4ff945 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============8165907575674781727==--
