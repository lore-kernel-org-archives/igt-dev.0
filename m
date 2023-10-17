Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3573542505529343565=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: sai.gowtham.ch@intel.com
Date: Tue, 17 Oct 2023 14:52:31 -0000
Message-ID: <169755435128.14377.6245168609568262562@emeril.freedesktop.org>
References: <20231017140530.547-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231017140530.547-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQWRkIGNv?=
 =?utf-8?q?py_basic_test_to_exercise_blt_commands_=28rev8=29?=
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

--===============3573542505529343565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add copy basic test to exercise blt commands (rev8)
URL   : https://patchwork.freedesktop.org/series/122615/
State : success

== Summary ==

CI Bug Log - changes from IGT_7543 -> IGTPW_10018
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html

Participating hosts (31 -> 33)
------------------------------

  Additional (4): bat-kbl-2 fi-ivb-3770 fi-ilk-650 fi-bsw-n3050 
  Missing    (2): fi-snb-2520m bat-jsl-3 

Known issues
------------

  Here are the changes found in IGTPW_10018 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@info:
    - bat-kbl-2:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1849])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-kbl-2/igt@fbdev@info.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - bat-dg2-11:         [PASS][2] -> [INCOMPLETE][3] ([i915#8575])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg2-11/igt@gem_exec_suspend@basic-s3@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg2-11/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - bat-kbl-2:          NOTRUN -> [SKIP][4] ([fdo#109271]) +39 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][5] ([fdo#109271]) +18 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][6] ([i915#8841]) +6 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_flip@basic-plain-flip@a-dp6:
    - bat-adlp-11:        [PASS][7] -> [DMESG-WARN][8] ([i915#6868])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html

  * igt@kms_flip@basic-plain-flip@b-dp6:
    - bat-adlp-11:        [PASS][9] -> [FAIL][10] ([i915#6121]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-bsw-n3050:       NOTRUN -> [FAIL][11] ([IGT#3])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][12] -> [ABORT][13] ([i915#8668])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_psr@cursor_plane_move:
    - fi-ivb-3770:        NOTRUN -> [SKIP][14] ([fdo#109271]) +19 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html
    - fi-ilk-650:         NOTRUN -> [SKIP][15] ([fdo#109271]) +19 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ilk-650/igt@kms_psr@cursor_plane_move.html

  
#### Possible fixes ####

  * igt@i915_suspend@basic-s2idle-without-i915:
    - bat-dg1-5:          [INCOMPLETE][16] -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - bat-dg2-8:          [INCOMPLETE][18] -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-edid:
    - bat-adlp-11:        [SKIP][20] ([i915#4093]) -> [FAIL][21] ([i915#8803])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#4093]: https://gitlab.freedesktop.org/drm/intel/issues/4093
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#8575]: https://gitlab.freedesktop.org/drm/intel/issues/8575
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8803]: https://gitlab.freedesktop.org/drm/intel/issues/8803
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8981]: https://gitlab.freedesktop.org/drm/intel/issues/8981


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7543 -> IGTPW_10018

  CI-20190529: 20190529
  CI_DRM_13765: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html
  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_copy_basic@mem-copy-linear-0x3fff
+igt@xe_copy_basic@mem-copy-linear-0x369
+igt@xe_copy_basic@mem-copy-linear-0xfd
+igt@xe_copy_basic@mem-copy-linear-0xfffe
+igt@xe_copy_basic@mem-set-linear-0x3fff
+igt@xe_copy_basic@mem-set-linear-0x369
+igt@xe_copy_basic@mem-set-linear-0xfd
+igt@xe_copy_basic@mem-set-linear-0xfffe

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html

--===============3573542505529343565==
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
<tr><td><b>Series:</b></td><td>Add copy basic test to exercise blt commands (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122615/">https://patchwork.freedesktop.org/series/122615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7543 -&gt; IGTPW_10018</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html</p>
<h2>Participating hosts (31 -&gt; 33)</h2>
<p>Additional (4): bat-kbl-2 fi-ivb-3770 fi-ilk-650 fi-bsw-n3050 <br />
  Missing    (2): fi-snb-2520m bat-jsl-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10018 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-kbl-2/igt@fbdev@info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg2-11/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg2-11/igt@gem_exec_suspend@basic-s3@smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8575">i915#8575</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-kbl-2/igt@gem_lmem_swapping@parallel-random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-bsw-n3050/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ivb-3770/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_flip@basic-plain-flip@a-dp6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp6:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_flip@basic-plain-flip@b-dp6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-bsw-n3050/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>
<p>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ivb-3770/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 other tests skip</p>
</li>
<li>
<p>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/fi-ilk-650/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +19 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>bat-dg1-5:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg1-5/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>bat-dg2-8:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-edid:<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7543/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4093">i915#4093</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/bat-adlp-11/igt@kms_force_connector_basic@force-edid.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8803">i915#8803</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7543 -&gt; IGTPW_10018</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13765: 201c8a7bd1f3f415920a2df4b8a8817e973f42fe @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10018: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10018/index.html<br />
  IGT_7543: 688f12831f876590e084e9b13b4d5ab85fe13d51 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_copy_basic@mem-copy-linear-0x3fff<br />
+igt@xe_copy_basic@mem-copy-linear-0x369<br />
+igt@xe_copy_basic@mem-copy-linear-0xfd<br />
+igt@xe_copy_basic@mem-copy-linear-0xfffe<br />
+igt@xe_copy_basic@mem-set-linear-0x3fff<br />
+igt@xe_copy_basic@mem-set-linear-0x369<br />
+igt@xe_copy_basic@mem-set-linear-0xfd<br />
+igt@xe_copy_basic@mem-set-linear-0xfffe</p>

</body>
</html>

--===============3573542505529343565==--
