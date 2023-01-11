Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4759748098056265439=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Stolarek" <karolina.stolarek@intel.com>
Date: Wed, 11 Jan 2023 12:24:28 -0000
Message-ID: <167343986831.20081.16970169228736897297@emeril.freedesktop.org>
References: <cover.1673426099.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1673426099.git.karolina.stolarek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgSW50cm9k?=
 =?utf-8?q?uce_blt=5Fcmd=5Finfo_struct_=28rev3=29?=
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

--===============4759748098056265439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce blt_cmd_info struct (rev3)
URL   : https://patchwork.freedesktop.org/series/112055/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12571 -> IGTPW_8324
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html

Participating hosts (39 -> 40)
------------------------------

  Additional (3): fi-kbl-soraka fi-bsw-kefka bat-atsm-1 
  Missing    (2): bat-dg2-oem1 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8324 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271]) +15 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html
    - fi-pnv-d510:        [PASS][2] -> [FAIL][3] ([i915#7229])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12571/fi-pnv-d510/igt@gem_exec_gttfill@basic.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-pnv-d510/igt@gem_exec_gttfill@basic.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#2190])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#4613]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][6] ([i915#7156])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][7] ([i915#1886])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-kefka:       NOTRUN -> [SKIP][8] ([fdo#109271]) +26 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077
  [i915#6078]: https://gitlab.freedesktop.org/drm/intel/issues/6078
  [i915#6093]: https://gitlab.freedesktop.org/drm/intel/issues/6093
  [i915#6094]: https://gitlab.freedesktop.org/drm/intel/issues/6094
  [i915#6166]: https://gitlab.freedesktop.org/drm/intel/issues/6166
  [i915#6257]: https://gitlab.freedesktop.org/drm/intel/issues/6257
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#7156]: https://gitlab.freedesktop.org/drm/intel/issues/7156
  [i915#7229]: https://gitlab.freedesktop.org/drm/intel/issues/7229
  [i915#7357]: https://gitlab.freedesktop.org/drm/intel/issues/7357


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7115 -> IGTPW_8324

  CI-20190529: 20190529
  CI_DRM_12571: a88eac130876610470adb06548944e27982acfb4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8324: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html
  IGT_7115: c162d70b00c6f4cf6a0ba1ca7a7e2ad8f7190646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_exercise_blt@fast-copy
+igt@gem_exercise_blt@fast-copy-emit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html

--===============4759748098056265439==
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
<tr><td><b>Series:</b></td><td>Introduce blt_cmd_info struct (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/112055/">https://patchwork.freedesktop.org/series/112055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12571 -&gt; IGTPW_8324</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html</p>
<h2>Participating hosts (39 -&gt; 40)</h2>
<p>Additional (3): fi-kbl-soraka fi-bsw-kefka bat-atsm-1 <br />
  Missing    (2): bat-dg2-oem1 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8324 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_exec_gttfill@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +15 similar issues</p>
</li>
<li>
<p>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12571/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-pnv-d510/igt@gem_exec_gttfill@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7229">i915#7229</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7156">i915#7156</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-kefka:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/fi-bsw-kefka/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +26 similar issues</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7115 -&gt; IGTPW_8324</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12571: a88eac130876610470adb06548944e27982acfb4 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8324: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8324/index.html<br />
  IGT_7115: c162d70b00c6f4cf6a0ba1ca7a7e2ad8f7190646 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_exercise_blt@fast-copy<br />
+igt@gem_exercise_blt@fast-copy-emit</p>

</body>
</html>

--===============4759748098056265439==--
