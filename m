Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7478476563512965438=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 12 Oct 2023 10:40:08 -0000
Message-ID: <169710720847.25006.12389560268516006049@emeril.freedesktop.org>
References: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231012070133.31106-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fcreate=3A_Remove_create-invalid-size_subtest_=28rev2=29?=
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

--===============7478476563512965438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_create: Remove create-invalid-size subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/119866/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13744 -> IGTPW_9990
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Known issues
------------

  Here are the changes found in IGTPW_9990 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@basic-hwmon:
    - bat-adlp-6:         NOTRUN -> [SKIP][1] ([i915#9318])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@debugfs_test@basic-hwmon.html

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [PASS][2] -> [INCOMPLETE][3] ([i915#9275])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@gem_tiled_pread_basic:
    - bat-adlp-6:         NOTRUN -> [SKIP][4] ([i915#3282])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@gem_tiled_pread_basic.html

  * igt@i915_selftest@live@gt_heartbeat:
    - bat-jsl-1:          [PASS][5] -> [DMESG-FAIL][6] ([i915#5334])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-6:         NOTRUN -> [SKIP][7] ([i915#6645])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - bat-adlp-6:         NOTRUN -> [SKIP][8] ([i915#4103] / [i915#5608]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-6:         NOTRUN -> [SKIP][9] ([i915#3555] / [i915#3840])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp5:
    - bat-adlp-11:        [PASS][10] -> [DMESG-WARN][11] ([i915#6868])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html

  * igt@kms_flip@basic-flip-vs-dpms@d-dp6:
    - bat-adlp-11:        [PASS][12] -> [FAIL][13] ([i915#6121]) +4 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-11:        NOTRUN -> [SKIP][14] ([i915#3637])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-load-detect:
    - bat-adlp-6:         NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [PASS][16] -> [FAIL][17] ([IGT#3])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:
    - bat-adlp-11:        NOTRUN -> [ABORT][18] ([i915#8668])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-mtlp-6:         NOTRUN -> [SKIP][19] ([i915#1845] / [i915#4078])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-adlp-6:         [INCOMPLETE][20] ([i915#8449]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-6/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@i915_module_load@load.html

  * igt@i915_selftest@live@requests:
    - bat-mtlp-6:         [ABORT][22] ([i915#9414]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-mtlp-6/igt@i915_selftest@live@requests.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@i915_selftest@live@requests.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][24] ([i915#9276]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:
    - bat-adlp-11:        [DMESG-FAIL][26] ([i915#6868]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:
    - bat-adlp-11:        [FAIL][28] ([i915#9047]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:
    - bat-adlp-11:        [ABORT][30] ([i915#8668]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8449]: https://gitlab.freedesktop.org/drm/intel/issues/8449
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9047]: https://gitlab.freedesktop.org/drm/intel/issues/9047
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276
  [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7533 -> IGTPW_9990

  CI-20190529: 20190529
  CI_DRM_13744: 1a168ec6354efbc291080c8ba7e13cb87adc46f9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9990: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html
  IGT_7533: 7533


Testlist changes
----------------

-igt@xe_create@create-invalid-size

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html

--===============7478476563512965438==
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
<tr><td><b>Series:</b></td><td>tests/xe_create: Remove create-invalid-size subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/119866/">https://patchwork.freedesktop.org/series/119866/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13744 -&gt; IGTPW_9990</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9990 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9318">i915#9318</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@gem_tiled_pread_basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>bat-jsl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5608">i915#5608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@c-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-dpms@d-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-b-dp-6.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-6/igt@i915_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8449">i915#8449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-6/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-mtlp-6/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-mtlp-6/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-dp-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9047">i915#9047</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13744/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc@pipe-d-dp-5.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7533 -&gt; IGTPW_9990</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13744: 1a168ec6354efbc291080c8ba7e13cb87adc46f9 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9990: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9990/index.html<br />
  IGT_7533: 7533</p>
<h2>Testlist changes</h2>
<p>-igt@xe_create@create-invalid-size</p>

</body>
</html>

--===============7478476563512965438==--
