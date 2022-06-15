Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1954101078109279828=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Swati Sharma" <swati2.sharma@intel.com>
Date: Wed, 15 Jun 2022 11:18:31 -0000
Message-ID: <165529191163.14603.8776569392523995301@emeril.freedesktop.org>
References: <20220615095906.23688-1-swati2.sharma@intel.com>
In-Reply-To: <20220615095906.23688-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fflip=5Fscaled=5Fcrc=3A_New_tests?=
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

--===============1954101078109279828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_flip_scaled_crc: New tests
URL   : https://patchwork.freedesktop.org/series/105148/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11759 -> IGTPW_7317
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html

Participating hosts (44 -> 42)
------------------------------

  Missing    (2): fi-bdw-samus bat-dg1-5 

Known issues
------------

  Here are the changes found in IGTPW_7317 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-kbl-soraka:      [PASS][1] -> [INCOMPLETE][2] ([i915#794])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-kbl-soraka/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-kbl-soraka/igt@i915_selftest@live@execlists.html

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [PASS][3] -> [DMESG-WARN][4] ([i915#3576]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@kms_busy@basic@flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-4/igt@kms_busy@basic@flip.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - bat-adlp-4:         [DMESG-WARN][7] ([i915#3576]) -> [PASS][8] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@i915_pm_rpm@module-reload.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-4/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-cfl-guc:         [DMESG-FAIL][9] ([i915#5334]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_timelines:
    - {bat-dg2-9}:        [DMESG-WARN][11] ([i915#5763]) -> [PASS][12] +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html

  * igt@kms_busy@basic@flip:
    - {bat-adlp-6}:       [DMESG-WARN][13] ([i915#3576]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-6/igt@kms_busy@basic@flip.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-6/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5885]: https://gitlab.freedesktop.org/drm/intel/issues/5885
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6529 -> IGTPW_7317

  CI-20190529: 20190529
  CI_DRM_11759: fa66b647ce886c01bbe1e9f3017a141e90d87539 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7317: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html
  IGT_6529: b96bf5a0307fc0bdbf6c8e86872817306e102883 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html

--===============1954101078109279828==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_flip_scaled_crc: New tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105148/">https://patchwork.freedesktop.org/series/105148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11759 -&gt; IGTPW_7317</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Missing    (2): fi-bdw-samus bat-dg1-5 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7317 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-kbl-soraka/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@kms_busy@basic@flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-4/igt@i915_pm_rpm@module-reload.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/fi-cfl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-dg2-9/igt@i915_selftest@live@gt_timelines.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11759/bat-adlp-6/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/bat-adlp-6/igt@kms_busy@basic@flip.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6529 -&gt; IGTPW_7317</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11759: fa66b647ce886c01bbe1e9f3017a141e90d87539 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7317: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7317/index.html<br />
  IGT_6529: b96bf5a0307fc0bdbf6c8e86872817306e102883 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
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

--===============1954101078109279828==--
