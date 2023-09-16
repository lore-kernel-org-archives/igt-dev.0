Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5838870335556302675=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 16 Sep 2023 01:07:25 -0000
Message-ID: <169482644524.10846.16407980464205717383@emeril.freedesktop.org>
References: <20230915233304.2241426-1-matthew.brost@intel.com>
In-Reply-To: <20230915233304.2241426-1-matthew.brost@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/3=5D_xe=5Fexec=5Fbalancer=3A_Enable_paralle?=
 =?utf-8?q?l_submission_and_compute_mode?=
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

--===============5838870335556302675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] xe_exec_balancer: Enable parallel submission and compute mode
URL   : https://patchwork.freedesktop.org/series/123821/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13643 -> IGTPW_9809
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html

Participating hosts (40 -> 40)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_9809 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-hsw-4770:        [PASS][1] -> [INCOMPLETE][2] ([i915#2295])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/fi-hsw-4770/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-hsw-4770/igt@gem_close_race@basic-threads.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#2190])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886] / [i915#7913])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-9:          [DMESG-FAIL][7] ([i915#7913]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/bat-dg2-9/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/bat-dg2-9/igt@i915_selftest@live@workarounds.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][9] ([IGT#3] / [i915#6121]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][11] ([i915#8668]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#7913]: https://gitlab.freedesktop.org/drm/intel/issues/7913
  [i915#7952]: https://gitlab.freedesktop.org/drm/intel/issues/7952
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7490 -> IGTPW_9809

  CI-20190529: 20190529
  CI_DRM_13643: dc4cd6e4e53d46211952fe7c0e408fce3e212993 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html
  IGT_7490: 7490


Testlist changes
----------------

+igt@xe_exec_balancer@many-cm-parallel-basic
+igt@xe_exec_balancer@many-cm-parallel-rebind
+igt@xe_exec_balancer@many-cm-parallel-userptr
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@many-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@many-execqueues-cm-parallel-basic
+igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@no-exec-cm-parallel-basic
+igt@xe_exec_balancer@no-exec-cm-parallel-rebind
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@once-cm-parallel-basic
+igt@xe_exec_balancer@once-cm-parallel-rebind
+igt@xe_exec_balancer@once-cm-parallel-userptr
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@once-cm-parallel-userptr-rebind
+igt@xe_exec_balancer@twice-cm-parallel-basic
+igt@xe_exec_balancer@twice-cm-parallel-rebind
+igt@xe_exec_balancer@twice-cm-parallel-userptr
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race
+igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind
-igt@kms_writeback@writeback-check-output-xrgb2101010
-igt@kms_writeback@writeback-fb-id-xrgb2101010

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html

--===============5838870335556302675==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] xe_exec_balancer: Enable parallel submission and compute mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123821/">https://patchwork.freedesktop.org/series/123821/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13643 -&gt; IGTPW_9809</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html</p>
<h2>Participating hosts (40 -&gt; 40)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9809 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_close_race@basic-threads:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/fi-hsw-4770/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-hsw-4770/igt@gem_close_race@basic-threads.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/bat-dg2-9/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7913">i915#7913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/bat-dg2-9/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7490 -&gt; IGTPW_9809</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13643: dc4cd6e4e53d46211952fe7c0e408fce3e212993 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9809/index.html<br />
  IGT_7490: 7490</p>
<h2>Testlist changes</h2>
<p>+igt@xe_exec_balancer@many-cm-parallel-basic<br />
+igt@xe_exec_balancer@many-cm-parallel-rebind<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@many-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-basic<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-rebind<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-basic<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-rebind<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@no-exec-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@once-cm-parallel-basic<br />
+igt@xe_exec_balancer@once-cm-parallel-rebind<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@once-cm-parallel-userptr-rebind<br />
+igt@xe_exec_balancer@twice-cm-parallel-basic<br />
+igt@xe_exec_balancer@twice-cm-parallel-rebind<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-invalidate-race<br />
+igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind<br />
-igt@kms_writeback@writeback-check-output-xrgb2101010<br />
-igt@kms_writeback@writeback-fb-id-xrgb2101010</p>

</body>
</html>

--===============5838870335556302675==--
