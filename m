Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4906340528991272715=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karolina Drobnik" <karolina.drobnik@intel.com>
Date: Tue, 05 Jul 2022 12:39:17 -0000
Message-ID: <165702475753.2010.3070457774263951602@emeril.freedesktop.org>
References: <20220705103551.3720180-1-karolina.drobnik@intel.com>
In-Reply-To: <20220705103551.3720180-1-karolina.drobnik@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fpm=5Frps=3A_Check_impact_of_fence_ordering_on_waitboostin?=
 =?utf-8?q?g?=
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

--===============4906340528991272715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_pm_rps: Check impact of fence ordering on waitboosting
URL   : https://patchwork.freedesktop.org/series/105922/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11849 -> IGTPW_7461
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html

Participating hosts (43 -> 41)
------------------------------

  Additional (1): fi-bxt-dsi 
  Missing    (3): fi-bdw-5557u fi-apl-guc fi-tgl-u2 

Known issues
------------

  Here are the changes found in IGTPW_7461 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_tiled_blits@basic:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][3] ([fdo#109271]) +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [PASS][4] -> [DMESG-FAIL][5] ([i915#4494] / [i915#4957])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][6] -> [INCOMPLETE][7] ([i915#5982])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-bxt-dsi:         NOTRUN -> [SKIP][8] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@kms_chamelium@hdmi-edid-read.html

  
#### Possible fixes ####

  * igt@gem_ringfill@basic-all:
    - {bat-dg2-9}:        [FAIL][9] ([i915#5886]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg2-9/igt@gem_ringfill@basic-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg2-9/igt@gem_ringfill@basic-all.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-8109u:       [DMESG-FAIL][11] ([i915#5334]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-dg2-9}:        [DMESG-WARN][13] ([i915#5763]) -> [PASS][14] +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][15] ([i915#3576]) -> [PASS][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5886]: https://gitlab.freedesktop.org/drm/intel/issues/5886
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6297]: https://gitlab.freedesktop.org/drm/intel/issues/6297


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6555 -> IGTPW_7461

  CI-20190529: 20190529
  CI_DRM_11849: 66197f3ca0b462799e265b002dc5cf8dcec1c62d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7461: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html
  IGT_6555: 1a3ffecd400b8f82c35745fa2e07992f6bdeede2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@i915_pm_rps@fence-order

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html

--===============4906340528991272715==
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
<tr><td><b>Series:</b></td><td>i915/i915_pm_rps: Check impact of fence ordering on waitboosting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105922/">https://patchwork.freedesktop.org/series/105922/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11849 -&gt; IGTPW_7461</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html</p>
<h2>Participating hosts (43 -&gt; 41)</h2>
<p>Additional (1): fi-bxt-dsi <br />
  Missing    (3): fi-bdw-5557u fi-apl-guc fi-tgl-u2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7461 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@gem_tiled_blits@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>fi-bxt-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-bxt-dsi/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ringfill@basic-all:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg2-9/igt@gem_ringfill@basic-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5886">i915#5886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg2-9/igt@gem_ringfill@basic-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/fi-cfl-8109u/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11849/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6555 -&gt; IGTPW_7461</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11849: 66197f3ca0b462799e265b002dc5cf8dcec1c62d @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7461: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7461/index.html<br />
  IGT_6555: 1a3ffecd400b8f82c35745fa2e07992f6bdeede2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@i915_pm_rps@fence-order</p>

</body>
</html>

--===============4906340528991272715==--
