Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2116100818900157843=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 17 Aug 2023 11:38:58 -0000
Message-ID: <169227233875.12431.916272815196108082@emeril.freedesktop.org>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgRXh0ZW5k?=
 =?utf-8?q?_compute_square_to_i915_and_Xe?=
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

--===============2116100818900157843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend compute square to i915 and Xe
URL   : https://patchwork.freedesktop.org/series/122568/
State : success

== Summary ==

CI Bug Log - changes from IGT_7442 -> IGTPW_9610
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html

Participating hosts (40 -> 40)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9610 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@execlists:
    - fi-bsw-n3050:       [PASS][3] -> [ABORT][4] ([i915#7911] / [i915#7913])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-bsw-n3050/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-bsw-n3050/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271]) +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-dg2-11:         NOTRUN -> [SKIP][7] ([i915#1845] / [i915#5354]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [PASS][8] -> [ABORT][9] ([i915#8442] / [i915#8668])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - fi-ivb-3770:        NOTRUN -> [DMESG-WARN][10] ([i915#8841]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][11] ([i915#5334]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  
#### Warnings ####

  * igt@gem_exec_suspend@basic-s3@smem:
    - fi-ivb-3770:        [ABORT][13] ([i915#8841]) -> [DMESG-WARN][14] ([i915#8841])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-ivb-3770/igt@gem_exec_suspend@basic-s3@smem.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-ivb-3770/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@i915_module_load@load:
    - bat-adlp-11:        [DMESG-WARN][15] ([i915#4423]) -> [ABORT][16] ([i915#4423])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/bat-adlp-11/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-adlp-11/igt@i915_module_load@load.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#7359]: https://gitlab.freedesktop.org/drm/intel/issues/7359
  [i915#7911]: https://gitlab.freedesktop.org/drm/intel/issues/7911
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7953]: https://gitlab.freedesktop.org/drm/intel/issues/7953
  [i915#8442]: https://gitlab.freedesktop.org/drm/intel/issues/8442
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7442 -> IGTPW_9610

  CI-20190529: 20190529
  CI_DRM_13528: a7c0be10a6b6a23017681cc609c1353711dc70e7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9610: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html
  IGT_7442: f6eea5a02525d62d10596408d1175c83d6f4038e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@gem_compute@compute-square

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html

--===============2116100818900157843==
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
<tr><td><b>Series:</b></td><td>Extend compute square to i915 and Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122568/">https://patchwork.freedesktop.org/series/122568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7442 -&gt; IGTPW_9610</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9610 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-bsw-n3050/igt@i915_selftest@live@execlists.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7911">i915#7911</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-kbl-soraka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8442">i915#8442</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-ivb-3770/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>fi-ivb-3770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/fi-ivb-3770/igt@gem_exec_suspend@basic-s3@smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/fi-ivb-3770/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7442/bat-adlp-11/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/bat-adlp-11/igt@i915_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7442 -&gt; IGTPW_9610</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13528: a7c0be10a6b6a23017681cc609c1353711dc70e7 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9610: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9610/index.html<br />
  IGT_7442: f6eea5a02525d62d10596408d1175c83d6f4038e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@gem_compute@compute-square</p>

</body>
</html>

--===============2116100818900157843==--
