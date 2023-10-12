Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4198945688958396319=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Date: Thu, 12 Oct 2023 16:04:42 -0000
Message-ID: <169712668223.25006.3042605052578919275@emeril.freedesktop.org>
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_tests/kms=5Fcursor=5Fcrc=3A_Fi?=
 =?utf-8?q?x_tests_be_skipped_on_AMD_gpu_=28rev8=29?=
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

--===============4198945688958396319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu (rev8)
URL   : https://patchwork.freedesktop.org/series/124496/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13746 -> IGTPW_9993
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/index.html

Participating hosts (38 -> 36)
------------------------------

  Missing    (2): fi-kbl-soraka fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9993 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [PASS][1] -> [INCOMPLETE][2] ([i915#9275])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_suspend@basic-s3-without-i915:
    - bat-mtlp-8:         NOTRUN -> [SKIP][3] ([i915#6645])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:
    - bat-adlp-11:        [PASS][4] -> [FAIL][5] ([i915#6121]) +5 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:
    - bat-adlp-11:        [PASS][6] -> [DMESG-WARN][7] ([i915#6868])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7:
    - bat-adlp-11:        NOTRUN -> [ABORT][8] ([i915#8668])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][9] -> [ABORT][10] ([i915#8668])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@requests:
    - bat-mtlp-8:         [ABORT][11] ([i915#9414]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-mtlp-8/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-mtlp-8/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][13] ([i915#9500]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3:
    - bat-dg2-11:         [INCOMPLETE][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html

  
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6645]: https://gitlab.freedesktop.org/drm/intel/issues/6645
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9414]: https://gitlab.freedesktop.org/drm/intel/issues/9414
  [i915#9500]: https://gitlab.freedesktop.org/drm/intel/issues/9500


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7533 -> IGTPW_9993

  CI-20190529: 20190529
  CI_DRM_13746: a9b7e6821ff78edf00303dfb8d88353541fad3d0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9993: 9993
  IGT_7533: 7533


Testlist changes
----------------

-igt@drm_fdinfo@context-close-stress
-igt@drm_fdinfo@memory-info-active
-igt@drm_fdinfo@memory-info-idle
-igt@drm_fdinfo@memory-info-purgeable
-igt@drm_fdinfo@memory-info-resident
-igt@drm_fdinfo@memory-info-shared

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/index.html

--===============4198945688958396319==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,i-g-t] tests/kms_cursor_crc: Fix tests be skipped on AMD gpu (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124496/">https://patchwork.freedesktop.org/series/124496/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13746 -&gt; IGTPW_9993</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/index.html</p>
<h2>Participating hosts (38 -&gt; 36)</h2>
<p>Missing    (2): fi-kbl-soraka fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9993 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-mtlp-8/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6645">i915#6645</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-adlp-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c-dp-7.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-mtlp-8/igt@i915_selftest@live@requests.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9414">i915#9414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-mtlp-8/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9500">i915#9500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13746/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9993/bat-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7533 -&gt; IGTPW_9993</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13746: a9b7e6821ff78edf00303dfb8d88353541fad3d0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9993: 9993<br />
  IGT_7533: 7533</p>
<h2>Testlist changes</h2>
<p>-igt@drm_fdinfo@context-close-stress<br />
-igt@drm_fdinfo@memory-info-active<br />
-igt@drm_fdinfo@memory-info-idle<br />
-igt@drm_fdinfo@memory-info-purgeable<br />
-igt@drm_fdinfo@memory-info-resident<br />
-igt@drm_fdinfo@memory-info-shared</p>

</body>
</html>

--===============4198945688958396319==--
