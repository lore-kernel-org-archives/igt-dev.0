Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7031130465844370058=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Mon, 27 Jun 2022 08:33:03 -0000
Message-ID: <165631878312.11794.11726550317335573768@emeril.freedesktop.org>
References: <20220622074348.31284-1-swati2.sharma@intel.com>
In-Reply-To: <20220622074348.31284-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests_=28rev8=29?=
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

--===============7031130465844370058==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests (rev8)
URL   : https://patchwork.freedesktop.org/series/105148/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11806 -> IGTPW_7391
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7391:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-adln-1}:       [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-adln-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-adln-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in IGTPW_7391 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_engines:
    - bat-dg1-6:          [PASS][3] -> [INCOMPLETE][4] ([i915#4418])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-dg1-6/igt@i915_selftest@live@gt_engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-dg1-6/igt@i915_selftest@live@gt_engines.html

  * igt@i915_selftest@live@requests:
    - fi-pnv-d510:        [PASS][5] -> [DMESG-FAIL][6] ([i915#4528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-pnv-d510/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-pnv-d510/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-rkl-11600:       [PASS][7] -> [INCOMPLETE][8] ([i915#5982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-ivb-3770:        NOTRUN -> [SKIP][9] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][10] -> [DMESG-WARN][11] ([i915#402]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ivb-3770:        NOTRUN -> [SKIP][12] ([fdo#109271]) +17 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][13] ([fdo#109271] / [i915#2403] / [i915#4312])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-pnv-d510/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-5:          [DMESG-FAIL][14] ([i915#4494] / [i915#4957]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-dg1-5/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-dg1-5/igt@i915_selftest@live@hangcheck.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - fi-tgl-u2:          [DMESG-WARN][16] ([i915#402]) -> [PASS][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4418]: https://gitlab.freedesktop.org/drm/intel/issues/4418
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6542 -> IGTPW_7391

  CI-20190529: 20190529
  CI_DRM_11806: cf74a0964a6cd08c439ea7373aec02abd211d882 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7391: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html

--===============7031130465844370058==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_flip_scaled_crc: New tests (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11806 -&gt; IGTPW_7391</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7391:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>{bat-adln-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-adln-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7391 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_engines:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-dg1-6/igt@i915_selftest@live@gt_engines.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4418">i915#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-pnv-d510:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-pnv-d510/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-pnv-d510/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-rkl-11600:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-rkl-11600/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5982">i915#5982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-ivb-3770/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/bat-dg1-5/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11806/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/fi-tgl-u2/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6542 -&gt; IGTPW_7391</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11806: cf74a0964a6cd08c439ea7373aec02abd211d882 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7391: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7391/index.html<br />
  IGT_6542: d38a476ee4b9f9a95d8f452de0d66cc52f7f079b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling<br />
-igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling</p>

</body>
</html>

--===============7031130465844370058==--
