Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2485975415676879567=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Date: Thu, 05 Oct 2023 20:50:55 -0000
Message-ID: <169653905536.7515.6562678785457726946@emeril.freedesktop.org>
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_tests/kms=5Fcursor=5Fcrc=3A_Fi?=
 =?utf-8?q?x_tests_be_skipped_on_AMD_gpu_=28rev3=29?=
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

--===============2485975415676879567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu (rev3)
URL   : https://patchwork.freedesktop.org/series/124496/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13719 -> IGTPW_9931
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html

Participating hosts (41 -> 38)
------------------------------

  Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_9931 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [PASS][1] -> [DMESG-FAIL][2] ([i915#5334] / [i915#7872])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-9:         NOTRUN -> [SKIP][3] ([i915#3546]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:
    - bat-adlp-11:        [PASS][4] -> [ABORT][5] ([i915#8668] / [i915#9451])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-kbl-soraka:      [DMESG-WARN][6] ([i915#1982]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/fi-kbl-soraka/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/fi-kbl-soraka/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_lrc:
    - bat-adlp-9:         [INCOMPLETE][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - {bat-dg2-13}:       [DMESG-WARN][10] ([Intel XE#485]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
    - bat-adlp-11:        [DMESG-WARN][12] ([i915#6868]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp5:
    - bat-adlp-11:        [DMESG-FAIL][14] ([i915#6868]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp5:
    - bat-adlp-11:        [FAIL][16] ([i915#6121]) -> [PASS][17] +6 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:
    - bat-adlp-11:        [ABORT][18] ([i915#8668]) -> [DMESG-FAIL][19] ([i915#6868])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#485]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/485
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9451]: https://gitlab.freedesktop.org/drm/intel/issues/9451


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7517 -> IGTPW_9931

  CI-20190529: 20190529
  CI_DRM_13719: 68e5c10def179bde3bf44bd95d19eea796cbf7a3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9931: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@xe_mmap@cpu-caching-coh
-igt@xe_pat@pat-index-all
-igt@xe_pat@pat-index-common-blt
-igt@xe_pat@pat-index-common-render
-igt@xe_pat@userptr-coh-none

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html

--===============2485975415676879567==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124496/">https://patchwork.freedesktop.org/series/124496/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13719 -&gt; IGTPW_9931</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html</p>
<h2>Participating hosts (41 -&gt; 38)</h2>
<p>Missing    (3): fi-hsw-4770 fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9931 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-9/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9451">i915#9451</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/fi-kbl-soraka/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/fi-kbl-soraka/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>bat-adlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>{bat-dg2-13}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/485">Intel XE#485</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-dg2-13/igt@kms_chamelium_frames@dp-crc-fast.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13719/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-dp-5.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7517 -&gt; IGTPW_9931</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13719: 68e5c10def179bde3bf44bd95d19eea796cbf7a3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9931: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9931/index.html<br />
  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@xe_mmap@cpu-caching-coh<br />
-igt@xe_pat@pat-index-all<br />
-igt@xe_pat@pat-index-common-blt<br />
-igt@xe_pat@pat-index-common-render<br />
-igt@xe_pat@userptr-coh-none</p>

</body>
</html>

--===============2485975415676879567==--
