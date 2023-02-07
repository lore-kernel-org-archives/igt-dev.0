Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6501599557576417626=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Tue, 07 Feb 2023 14:33:53 -0000
Message-ID: <167578043305.13142.12630966294069457345@emeril.freedesktop.org>
References: <20230207134249.20336-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230207134249.20336-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Fdraw=5Fcrc=3A_Ignore_RGB565_=26_XRGB2101010_formats_?=
 =?utf-8?q?on_simulation?=
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

--===============6501599557576417626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_draw_crc: Ignore RGB565 & XRGB2101010 formats on simulation
URL   : https://patchwork.freedesktop.org/series/113739/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12708 -> IGTPW_8458
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html

Participating hosts (36 -> 37)
------------------------------

  Additional (3): fi-kbl-x1275 bat-atsm-1 bat-adls-5 
  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_8458 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-kbl-x1275:       NOTRUN -> [SKIP][3] ([fdo#109271]) +40 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@slpc:
    - {bat-rpls-1}:       [DMESG-FAIL][4] ([i915#6367]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/bat-rpls-1/igt@i915_selftest@live@slpc.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/bat-rpls-1/igt@i915_selftest@live@slpc.html

  * igt@i915_selftest@live@workarounds:
    - {bat-dg2-11}:       [DMESG-WARN][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - fi-bsw-n3050:       [FAIL][8] ([i915#6298]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#6298]: https://gitlab.freedesktop.org/drm/intel/issues/6298
  [i915#6311]: https://gitlab.freedesktop.org/drm/intel/issues/6311
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#8060]: https://gitlab.freedesktop.org/drm/intel/issues/8060
  [i915#8062]: https://gitlab.freedesktop.org/drm/intel/issues/8062


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7153 -> IGTPW_8458

  CI-20190529: 20190529
  CI_DRM_12708: e9426d9d1eeb72f84725043dd2a9e073d9a6f1d7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8458: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@v3d/v3d_job_submission@array-job-submission
-igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync
-igt@v3d/v3d_job_submission@threaded-job-submission
-igt@v3d/v3d_submit_csd@bad-bo
-igt@v3d/v3d_submit_csd@bad-extension
-igt@v3d/v3d_submit_csd@bad-flag
-igt@v3d/v3d_submit_csd@bad-in-sync
-igt@v3d/v3d_submit_csd@bad-multisync-extension
-igt@v3d/v3d_submit_csd@bad-multisync-in-sync
-igt@v3d/v3d_submit_csd@bad-multisync-out-sync
-igt@v3d/v3d_submit_csd@bad-multisync-pad
-igt@v3d/v3d_submit_csd@bad-pad
-igt@v3d/v3d_submit_csd@bad-perfmon
-igt@v3d/v3d_submit_csd@job-perfmon
-igt@v3d/v3d_submit_csd@multiple-job-submission
-igt@v3d/v3d_submit_csd@multisync-out-syncs
-igt@v3d/v3d_submit_csd@multi-and-single-sync
-igt@v3d/v3d_submit_csd@single-in-sync
-igt@v3d/v3d_submit_csd@single-out-sync
-igt@v3d/v3d_submit_csd@valid-multisync-submission
-igt@v3d/v3d_submit_csd@valid-submission

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html

--===============6501599557576417626==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_draw_crc: Ignore RGB565 &amp; XRGB2101010 formats on simulation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/113739/">https://patchwork.freedesktop.org/series/113739/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12708 -&gt; IGTPW_8458</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html</p>
<h2>Participating hosts (36 -&gt; 37)</h2>
<p>Additional (3): fi-kbl-x1275 bat-atsm-1 bat-adls-5 <br />
  Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8458 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-kbl-x1275/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +40 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/bat-rpls-1/igt@i915_selftest@live@slpc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/bat-rpls-1/igt@i915_selftest@live@slpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>{bat-dg2-11}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12708/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6298">i915#6298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7153 -&gt; IGTPW_8458</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12708: e9426d9d1eeb72f84725043dd2a9e073d9a6f1d7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8458: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8458/index.html<br />
  IGT_7153: f47f859f13376958a2bd199423b1f0ff53dddbe0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@v3d/v3d_job_submission@array-job-submission<br />
-igt@v3d/v3d_job_submission@multiple-singlesync-to-multisync<br />
-igt@v3d/v3d_job_submission@threaded-job-submission<br />
-igt@v3d/v3d_submit_csd@bad-bo<br />
-igt@v3d/v3d_submit_csd@bad-extension<br />
-igt@v3d/v3d_submit_csd@bad-flag<br />
-igt@v3d/v3d_submit_csd@bad-in-sync<br />
-igt@v3d/v3d_submit_csd@bad-multisync-extension<br />
-igt@v3d/v3d_submit_csd@bad-multisync-in-sync<br />
-igt@v3d/v3d_submit_csd@bad-multisync-out-sync<br />
-igt@v3d/v3d_submit_csd@bad-multisync-pad<br />
-igt@v3d/v3d_submit_csd@bad-pad<br />
-igt@v3d/v3d_submit_csd@bad-perfmon<br />
-igt@v3d/v3d_submit_csd@job-perfmon<br />
-igt@v3d/v3d_submit_csd@multiple-job-submission<br />
-igt@v3d/v3d_submit_csd@multisync-out-syncs<br />
-igt@v3d/v3d_submit_csd@multi-and-single-sync<br />
-igt@v3d/v3d_submit_csd@single-in-sync<br />
-igt@v3d/v3d_submit_csd@single-out-sync<br />
-igt@v3d/v3d_submit_csd@valid-multisync-submission<br />
-igt@v3d/v3d_submit_csd@valid-submission</p>

</body>
</html>

--===============6501599557576417626==--
