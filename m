Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0097741228040764118=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Date: Mon, 04 Jul 2022 08:29:01 -0000
Message-ID: <165692334124.24075.13881493763288599165@emeril.freedesktop.org>
References: <20220628110409.768308-1-arun.r.murthy@intel.com>
In-Reply-To: <20220628110409.768308-1-arun.r.murthy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fbig=5Ffb=3A_trigger_async_flip_with_a_dummy_flip_=28?=
 =?utf-8?q?rev2=29?=
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

--===============0097741228040764118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_big_fb: trigger async flip with a dummy flip (rev2)
URL   : https://patchwork.freedesktop.org/series/105726/
State : success

== Summary ==

CI Bug Log - changes from IGT_6555 -> IGTPW_7455
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html

Participating hosts (42 -> 43)
------------------------------

  Additional (1): bat-dg2-8 

Known issues
------------

  Here are the changes found in IGTPW_7455 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_render_tiled_blits@basic:
    - fi-apl-guc:         [PASS][1] -> [INCOMPLETE][2] ([i915#6274])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-apl-guc/igt@gem_render_tiled_blits@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-apl-guc/igt@gem_render_tiled_blits@basic.html

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [PASS][3] -> [DMESG-WARN][4] ([i915#3576])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gem:
    - fi-blb-e6850:       NOTRUN -> [DMESG-FAIL][5] ([i915#4528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-blb-e6850/igt@i915_selftest@live@gem.html

  * igt@i915_selftest@live@memory_region:
    - fi-bdw-5557u:       [PASS][6] -> [INCOMPLETE][7] ([i915#6208])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][8] -> [INCOMPLETE][9] ([i915#5982])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@coherency:
    - {bat-dg2-9}:        [DMESG-WARN][10] ([i915#5763]) -> [PASS][11] +13 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-dg2-9/igt@i915_selftest@live@coherency.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-dg2-9/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@gtt:
    - fi-bdw-5557u:       [DMESG-FAIL][12] ([i915#3674]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-bdw-5557u/igt@i915_selftest@live@gtt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-bdw-5557u/igt@i915_selftest@live@gtt.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [DMESG-FAIL][14] ([i915#4528]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [DMESG-WARN][16] ([i915#3576]) -> [PASS][17] +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-4/igt@kms_busy@basic@flip.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][18] ([i915#402]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][20] ([i915#3576]) -> [PASS][21] +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3595]: https://gitlab.freedesktop.org/drm/intel/issues/3595
  [i915#3674]: https://gitlab.freedesktop.org/drm/intel/issues/3674
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5174]: https://gitlab.freedesktop.org/drm/intel/issues/5174
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6208]: https://gitlab.freedesktop.org/drm/intel/issues/6208
  [i915#6274]: https://gitlab.freedesktop.org/drm/intel/issues/6274


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6555 -> IGTPW_7455

  CI-20190529: 20190529
  CI_DRM_11844: 1521a456fc4a93afd21a1eb38066f22ce3f2e380 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7455: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html
  IGT_6555: 1a3ffecd400b8f82c35745fa2e07992f6bdeede2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html

--===============0097741228040764118==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_big_fb: trigger async flip with a dummy flip (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105726/">https://patchwork.freedesktop.org/series/105726/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6555 -&gt; IGTPW_7455</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html</p>
<h2>Participating hosts (42 -&gt; 43)</h2>
<p>Additional (1): bat-dg2-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7455 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-apl-guc/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6274">i915#6274</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem:</p>
<ul>
<li>fi-blb-e6850:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-blb-e6850/igt@i915_selftest@live@gem.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@memory_region:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-bdw-5557u/igt@i915_selftest@live@memory_region.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6208">i915#6208</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-dg2-9/igt@i915_selftest@live@coherency.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-dg2-9/igt@i915_selftest@live@coherency.html">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3674">i915#3674</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-bdw-5557u/igt@i915_selftest@live@gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-4/igt@kms_busy@basic@flip.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6555/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6555 -&gt; IGTPW_7455</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11844: 1521a456fc4a93afd21a1eb38066f22ce3f2e380 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7455: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7455/index.html<br />
  IGT_6555: 1a3ffecd400b8f82c35745fa2e07992f6bdeede2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============0097741228040764118==--
