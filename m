Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3359299311351093838=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Wed, 23 Aug 2023 19:48:36 -0000
Message-ID: <169282011609.16629.17760857306566805717@emeril.freedesktop.org>
References: <20230823184538.6273-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230823184538.6273-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?oc=3A_Use_semaphore_wait_to_sync_gpu_and_cpu_times?=
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

--===============3359299311351093838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/poc: Use semaphore wait to sync gpu and cpu times
URL   : https://patchwork.freedesktop.org/series/122803/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13553 -> IGTPW_9644
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/index.html

Participating hosts (40 -> 39)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): bat-dg2-9 fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9644 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-jsl-3:          [PASS][1] -> [ABORT][2] ([i915#5122])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#5334] / [i915#7872])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
    - fi-apl-guc:         [PASS][6] -> [DMESG-FAIL][7] ([i915#5334])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-dg2-11:         [PASS][8] -> [INCOMPLETE][9] ([i915#7609] / [i915#7913])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][10] ([i915#1886] / [i915#7913])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@migrate:
    - bat-rpls-1:         [PASS][11] -> [DMESG-FAIL][12] ([i915#7699])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-1/igt@i915_selftest@live@migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-1/igt@i915_selftest@live@migrate.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-jsl-3:          [PASS][13] -> [FAIL][14] ([fdo#103375])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][15] ([fdo#109271]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][16] ([i915#1845] / [i915#5354]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@mman:
    - bat-rpls-2:         [TIMEOUT][17] ([i915#6794] / [i915#7392]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-2/igt@i915_selftest@live@mman.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-2/igt@i915_selftest@live@mman.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-rpls-2:         [WARN][19] ([i915#8747]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html

  
#### Warnings ####

  * igt@kms_psr@primary_mmap_gtt:
    - bat-rplp-1:         [ABORT][21] ([i915#8469]) -> [ABORT][22] ([i915#8442] / [i915#8469] / [i915#8668])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#6794]: https://gitlab.freedesktop.org/drm/intel/issues/6794
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7609]: https://gitlab.freedesktop.org/drm/intel/issues/7609
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8469]: https://gitlab.freedesktop.org/drm/intel/issues/8469
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8747]: https://gitlab.freedesktop.org/drm/intel/issues/8747


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7451 -> IGTPW_9644

  CI-20190529: 20190529
  CI_DRM_13553: 2011895068e1c7cd8a98fc3dab0c399f3e320797 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9644: 9644
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@cpu_gpu_time@cpu-gpu-time
+igt@i915_pm_backlight@bad-brightness
+igt@i915_pm_backlight@basic-brightness
+igt@i915_pm_backlight@fade
+igt@i915_pm_backlight@fade-with-dpms
+igt@i915_pm_backlight@fade-with-suspend
+igt@i915_pm_dc@dc3co-vpb-simulation
+igt@i915_pm_dc@dc5-dpms
+igt@i915_pm_dc@dc5-dpms-negative
+igt@i915_pm_dc@dc5-psr
+igt@i915_pm_dc@dc6-dpms
+igt@i915_pm_dc@dc6-psr
+igt@i915_pm_dc@dc9-dpms
+igt@i915_pm_lpsp@kms-lpsp
+igt@i915_pm_lpsp@screens-disabled
+igt@i915_pm_rpm@basic-pci-d3-state
+igt@i915_pm_rpm@cursor
+igt@i915_pm_rpm@cursor-dpms
+igt@i915_pm_rpm@dpms-lpsp
+igt@i915_pm_rpm@dpms-mode-unset-lpsp
+igt@i915_pm_rpm@dpms-mode-unset-non-lpsp
+igt@i915_pm_rpm@dpms-non-lpsp
+igt@i915_pm_rpm@drm-resources-equal
+igt@i915_pm_rpm@fences-dpms
+igt@i915_pm_rpm@i2c
+igt@i915_pm_rpm@legacy-planes
+igt@i915_pm_rpm@legacy-planes-dpms
+igt@i915_pm_rpm@modeset-lpsp
+igt@i915_pm_rpm@modeset-lpsp-stress
+igt@i915_pm_rpm@modeset-lpsp-stress-no-wait
+igt@i915_pm_rpm@modeset-non-lpsp
+igt@i915_pm_rpm@modeset-non-lpsp-stress
+igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait
+igt@i915_pm_rpm@modeset-pc8-residency-stress
+igt@i915_pm_rpm@modeset-stress-extra-wait
+igt@i915_pm_rpm@system-suspend-modeset
+igt@i915_pm_rpm@universal-planes
+igt@i915_pm_rpm@universal-planes-dpms
-igt@kms_pm_backlight@bad-brightness
-igt@kms_pm_backlight@basic-brightness
-igt@kms_pm_backlight@fade
-igt@kms_pm_backlight@fade-with-dpms
-igt@kms_pm_backlight@fade-with-suspend
-igt@kms_pm_dc@dc3co-vpb-simulation
-igt@kms_pm_dc@dc5-dpms
-igt@kms_pm_dc@dc5-dpms-negative
-igt@kms_pm_dc@dc5-psr
-igt@kms_pm_dc@dc6-dpms
-igt@kms_pm_dc@dc6-psr
-igt@kms_pm_dc@dc9-dpms
-igt@kms_pm_lpsp@kms-lpsp
-igt@kms_pm_lpsp@screens-disabled
-igt@kms_pm_rpm@basic-pci-d3-state
-igt@kms_pm_rpm@cursor
-igt@kms_pm_rpm@cursor-dpms
-igt@kms_pm_rpm@dpms-lpsp
-igt@kms_pm_rpm@dpms-mode-unset-lpsp
-igt@kms_pm_rpm@dpms-mode-unset-non-lpsp
-igt@kms_pm_rpm@dpms-non-lpsp
-igt@kms_pm_rpm@drm-resources-equal
-igt@kms_pm_rpm@fences-dpms
-igt@kms_pm_rpm@i2c
-igt@kms_pm_rpm@legacy-planes
-igt@kms_pm_rpm@legacy-planes-dpms
-igt@kms_pm_rpm@modeset-lpsp
-igt@kms_pm_rpm@modeset-lpsp-stress
-igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
-igt@kms_pm_rpm@modeset-non-lpsp
-igt@kms_pm_rpm@modeset-non-lpsp-stress
-igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait
-igt@kms_pm_rpm@modeset-pc8-residency-stress
-igt@kms_pm_rpm@modeset-stress-extra-wait
-igt@kms_pm_rpm@system-suspend-modeset
-igt@kms_pm_rpm@universal-planes
-igt@kms_pm_rpm@universal-planes-dpms

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/index.html

--===============3359299311351093838==
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
<tr><td><b>Series:</b></td><td>i915/poc: Use semaphore wait to sync gpu and cpu times</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122803/">https://patchwork.freedesktop.org/series/122803/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13553 -&gt; IGTPW_9644</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): bat-dg2-9 fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9644 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-jsl-3/igt@gem_exec_suspend@basic-s0@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5122">i915#5122</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</p>
</li>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7609">i915#7609</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>bat-rpls-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-1/igt@i915_selftest@live@migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-1/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-jsl-3/igt@i915_suspend@basic-s3-without-i915.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-2/igt@i915_selftest@live@mman.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6794">i915#6794</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-2/igt@i915_selftest@live@mman.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-rpls-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8747">i915#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rpls-2/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@primary_mmap_gtt:<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13553/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9644/bat-rplp-1/igt@kms_psr@primary_mmap_gtt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8469">i915#8469</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7451 -&gt; IGTPW_9644</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13553: 2011895068e1c7cd8a98fc3dab0c399f3e320797 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9644: 9644<br />
  IGT_7451: 5d48d1fb231f449fe2f80cda14ea7a1ecfda59fa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@cpu_gpu_time@cpu-gpu-time<br />
+igt@i915_pm_backlight@bad-brightness<br />
+igt@i915_pm_backlight@basic-brightness<br />
+igt@i915_pm_backlight@fade<br />
+igt@i915_pm_backlight@fade-with-dpms<br />
+igt@i915_pm_backlight@fade-with-suspend<br />
+igt@i915_pm_dc@dc3co-vpb-simulation<br />
+igt@i915_pm_dc@dc5-dpms<br />
+igt@i915_pm_dc@dc5-dpms-negative<br />
+igt@i915_pm_dc@dc5-psr<br />
+igt@i915_pm_dc@dc6-dpms<br />
+igt@i915_pm_dc@dc6-psr<br />
+igt@i915_pm_dc@dc9-dpms<br />
+igt@i915_pm_lpsp@kms-lpsp<br />
+igt@i915_pm_lpsp@screens-disabled<br />
+igt@i915_pm_rpm@basic-pci-d3-state<br />
+igt@i915_pm_rpm@cursor<br />
+igt@i915_pm_rpm@cursor-dpms<br />
+igt@i915_pm_rpm@dpms-lpsp<br />
+igt@i915_pm_rpm@dpms-mode-unset-lpsp<br />
+igt@i915_pm_rpm@dpms-mode-unset-non-lpsp<br />
+igt@i915_pm_rpm@dpms-non-lpsp<br />
+igt@i915_pm_rpm@drm-resources-equal<br />
+igt@i915_pm_rpm@fences-dpms<br />
+igt@i915_pm_rpm@i2c<br />
+igt@i915_pm_rpm@legacy-planes<br />
+igt@i915_pm_rpm@legacy-planes-dpms<br />
+igt@i915_pm_rpm@modeset-lpsp<br />
+igt@i915_pm_rpm@modeset-lpsp-stress<br />
+igt@i915_pm_rpm@modeset-lpsp-stress-no-wait<br />
+igt@i915_pm_rpm@modeset-non-lpsp<br />
+igt@i915_pm_rpm@modeset-non-lpsp-stress<br />
+igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
+igt@i915_pm_rpm@modeset-pc8-residency-stress<br />
+igt@i915_pm_rpm@modeset-stress-extra-wait<br />
+igt@i915_pm_rpm@system-suspend-modeset<br />
+igt@i915_pm_rpm@universal-planes<br />
+igt@i915_pm_rpm@universal-planes-dpms<br />
-igt@kms_pm_backlight@bad-brightness<br />
-igt@kms_pm_backlight@basic-brightness<br />
-igt@kms_pm_backlight@fade<br />
-igt@kms_pm_backlight@fade-with-dpms<br />
-igt@kms_pm_backlight@fade-with-suspend<br />
-igt@kms_pm_dc@dc3co-vpb-simulation<br />
-igt@kms_pm_dc@dc5-dpms<br />
-igt@kms_pm_dc@dc5-dpms-negative<br />
-igt@kms_pm_dc@dc5-psr<br />
-igt@kms_pm_dc@dc6-dpms<br />
-igt@kms_pm_dc@dc6-psr<br />
-igt@kms_pm_dc@dc9-dpms<br />
-igt@kms_pm_lpsp@kms-lpsp<br />
-igt@kms_pm_lpsp@screens-disabled<br />
-igt@kms_pm_rpm@basic-pci-d3-state<br />
-igt@kms_pm_rpm@cursor<br />
-igt@kms_pm_rpm@cursor-dpms<br />
-igt@kms_pm_rpm@dpms-lpsp<br />
-igt@kms_pm_rpm@dpms-mode-unset-lpsp<br />
-igt@kms_pm_rpm@dpms-mode-unset-non-lpsp<br />
-igt@kms_pm_rpm@dpms-non-lpsp<br />
-igt@kms_pm_rpm@drm-resources-equal<br />
-igt@kms_pm_rpm@fences-dpms<br />
-igt@kms_pm_rpm@i2c<br />
-igt@kms_pm_rpm@legacy-planes<br />
-igt@kms_pm_rpm@legacy-planes-dpms<br />
-igt@kms_pm_rpm@modeset-lpsp<br />
-igt@kms_pm_rpm@modeset-lpsp-stress<br />
-igt@kms_pm_rpm@modeset-lpsp-stress-no-wait<br />
-igt@kms_pm_rpm@modeset-non-lpsp<br />
-igt@kms_pm_rpm@modeset-non-lpsp-stress<br />
-igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait<br />
-igt@kms_pm_rpm@modeset-pc8-residency-stress<br />
-igt@kms_pm_rpm@modeset-stress-extra-wait<br />
-igt@kms_pm_rpm@system-suspend-modeset<br />
-igt@kms_pm_rpm@universal-planes<br />
-igt@kms_pm_rpm@universal-planes-dpms</p>

</body>
</html>

--===============3359299311351093838==--
