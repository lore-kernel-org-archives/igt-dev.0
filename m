Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0277439929757056737=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Ser" <contact@emersion.fr>
Date: Wed, 18 Oct 2023 18:17:43 -0000
Message-ID: <169765306340.15109.3136642182931067214@emeril.freedesktop.org>
References: <20231018123159.54874-1-contact@emersion.fr>
In-Reply-To: <20231018123159.54874-1-contact@emersion.fr>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fclosefb=3A_add_CLOSEFB_IOCTL_test_=28rev2=29?=
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

--===============0277439929757056737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_closefb: add CLOSEFB IOCTL test (rev2)
URL   : https://patchwork.freedesktop.org/series/125174/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7545 -> IGTPW_10026
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_10026 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10026, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html

Participating hosts (34 -> 33)
------------------------------

  Additional (1): fi-ilk-650 
  Missing    (2): fi-snb-2520m fi-bsw-n3050 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10026:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@load:
    - bat-jsl-3:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-jsl-3/igt@i915_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-jsl-3/igt@i915_module_load@load.html
    - bat-adln-1:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-adln-1/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-adln-1/igt@i915_module_load@load.html

  
Known issues
------------

  Here are the changes found in IGTPW_10026 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7567u:       NOTRUN -> [ABORT][5] ([i915#8913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html

  * igt@gem_close_race@basic-process:
    - bat-dg1-5:          [PASS][6] -> [INCOMPLETE][7] ([i915#2295])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-dg1-5/igt@gem_close_race@basic-process.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-dg1-5/igt@gem_close_race@basic-process.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - bat-dg2-9:          [PASS][8] -> [INCOMPLETE][9] ([i915#9275])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - fi-cfl-8109u:       NOTRUN -> [SKIP][12] ([fdo#109271]) +9 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ilk-650:         NOTRUN -> [SKIP][13] ([fdo#109271]) +19 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-ilk-650/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - fi-kbl-7567u:       [INCOMPLETE][14] -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-kbl-7567u/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-7567u/igt@i915_module_load@load.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][16] ([i915#9276]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][18] ([IGT#3]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][20] ([i915#8668]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7545 -> IGTPW_10026

  CI-20190529: 20190529
  CI_DRM_13771: 1ba7a7c3ed3fc1ec846f5099a181993b6bc1b5b7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10026: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html
  IGT_7545: 4aac61139d076775a173a75a15156e408a366546 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_closefb@closefb-ioctl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html

--===============0277439929757056737==
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
<tr><td><b>Series:</b></td><td>tests/kms_closefb: add CLOSEFB IOCTL test (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125174/">https://patchwork.freedesktop.org/series/125174/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7545 -&gt; IGTPW_10026</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_10026 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10026, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html</p>
<h2>Participating hosts (34 -&gt; 33)</h2>
<p>Additional (1): fi-ilk-650 <br />
  Missing    (2): fi-snb-2520m fi-bsw-n3050 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10026:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>
<p>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-jsl-3/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-jsl-3/igt@i915_module_load@load.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adln-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-adln-1/igt@i915_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-adln-1/igt@i915_module_load@load.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10026 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@basic-process:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-dg1-5/igt@gem_close_race@basic-process.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-dg1-5/igt@gem_close_race@basic-process.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-cfl-8109u/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-ilk-650/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-kbl-7567u/igt@i915_module_load@load.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-7567u/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7545/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7545 -&gt; IGTPW_10026</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13771: 1ba7a7c3ed3fc1ec846f5099a181993b6bc1b5b7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10026: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10026/index.html<br />
  IGT_7545: 4aac61139d076775a173a75a15156e408a366546 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_closefb@closefb-ioctl</p>

</body>
</html>

--===============0277439929757056737==--
