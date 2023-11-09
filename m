Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2596556030896697695=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 09 Nov 2023 18:39:42 -0000
Message-ID: <169955518263.26590.12052863384401705233@emeril.freedesktop.org>
References: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20231109171554.313952-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?xe=5Fevict=5Fccs=3A_Disable_compression_on_platforms_without_fl?=
 =?utf-8?q?atccs?=
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

--===============2596556030896697695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/xe_evict_ccs: Disable compression on platforms without flatccs
URL   : https://patchwork.freedesktop.org/series/126210/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13856 -> IGTPW_10154
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html

Participating hosts (34 -> 33)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (2): bat-rpls-1 bat-dg2-8 

Known issues
------------

  Here are the changes found in IGTPW_10154 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#4613]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@i915_module_load@load:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-WARN][3] ([i915#1982])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_module_load@load.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][4] ([i915#5334] / [i915#7872])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@gt_pm:
    - fi-kbl-soraka:      NOTRUN -> [DMESG-FAIL][5] ([i915#1886])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html

  * igt@kms_dsc@dsc-basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271]) +9 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset@a-dp5:
    - bat-adlp-11:        [PASS][7] -> [DMESG-WARN][8] ([i915#6868])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html

  * igt@kms_flip@basic-flip-vs-modeset@b-dp5:
    - bat-adlp-11:        [PASS][9] -> [FAIL][10] ([i915#6121]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-11:        NOTRUN -> [SKIP][11] ([i915#3637])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@gem_exec_suspend@basic-s0@lmem0:
    - bat-dg2-9:          [INCOMPLETE][12] ([i915#9275]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html

  * igt@i915_module_load@reload:
    - fi-skl-6600u:       [DMESG-WARN][14] ([i915#1982]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-skl-6600u/igt@i915_module_load@reload.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-skl-6600u/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-apl-guc:         [DMESG-FAIL][16] ([i915#5334]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-bsw-nick:        [FAIL][18] ([i915#9276]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - fi-kbl-guc:         [FAIL][20] ([IGT#3]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:
    - bat-rplp-1:         [ABORT][22] ([i915#8668]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html

  * igt@kms_psr@sprite_plane_onoff:
    - bat-jsl-3:          [SKIP][24] -> [PASS][25] +3 other tests pass
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#3]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1886]: https://gitlab.freedesktop.org/drm/intel/issues/1886
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6868]: https://gitlab.freedesktop.org/drm/intel/issues/6868
  [i915#7872]: https://gitlab.freedesktop.org/drm/intel/issues/7872
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#9275]: https://gitlab.freedesktop.org/drm/intel/issues/9275
  [i915#9276]: https://gitlab.freedesktop.org/drm/intel/issues/9276


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7580 -> IGTPW_10154

  CI-20190529: 20190529
  CI_DRM_13856: b81818fa6745cf79a86da57dc3a379bd80c7ea5f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen
+igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd
+igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen
+igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
+igt@xe_evict_ccs@evict-overcommit-simple
+igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen
+igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd
+igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen
+igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd
-igt@xe_engine_property@job_timeout_ms-property-min-max
-igt@xe_engine_property@persistence-set-property
-igt@xe_engine_property@preempt_timeout_us-property-min-max
-igt@xe_engine_property@priority-set-property
-igt@xe_engine_property@timeslice_duration_us-property-min-max
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-instantfree-reopen
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-instantfree-samefd
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-reopen
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd
-igt@xe_evict_ccs@evict-ccs-overcommit-simple
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-instantfree-reopen
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-instantfree-samefd
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-nofree-reopen
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-nofree-samefd

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html

--===============2596556030896697695==
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
<tr><td><b>Series:</b></td><td>tests/xe_evict_ccs: Disable compression on platforms without flatccs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126210/">https://patchwork.freedesktop.org/series/126210/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13856 -&gt; IGTPW_10154</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html</p>
<h2>Participating hosts (34 -&gt; 33)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (2): bat-rpls-1 bat-dg2-8 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10154 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7872">i915#7872</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1886">i915#1886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-soraka/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@a-dp5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6868">i915#6868</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp5:</p>
<ul>
<li>bat-adlp-11:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-modeset@b-dp5.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-adlp-11/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@lmem0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9275">i915#9275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-dg2-9/igt@gem_exec_suspend@basic-s0@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-skl-6600u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-skl-6600u/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-skl-6600u/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-apl-guc/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9276">i915#9276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-bsw-nick/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/3">IGT#3</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/fi-kbl-guc/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1:</p>
<ul>
<li>bat-rplp-1:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-rplp-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>bat-jsl-3:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13856/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/bat-jsl-3/igt@kms_psr@sprite_plane_onoff.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7580 -&gt; IGTPW_10154</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13856: b81818fa6745cf79a86da57dc3a379bd80c7ea5f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10154: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10154/index.html<br />
  IGT_7580: 847ee1e7d365e2fb08bf4198d3bf5ee8a852649f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen<br />
+igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd<br />
+igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen<br />
+igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd<br />
+igt@xe_evict_ccs@evict-overcommit-simple<br />
+igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen<br />
+igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd<br />
+igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen<br />
+igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd<br />
-igt@xe_engine_property@job_timeout_ms-property-min-max<br />
-igt@xe_engine_property@persistence-set-property<br />
-igt@xe_engine_property@preempt_timeout_us-property-min-max<br />
-igt@xe_engine_property@priority-set-property<br />
-igt@xe_engine_property@timeslice_duration_us-property-min-max<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-instantfree-reopen<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-instantfree-samefd<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-reopen<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-simple<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-instantfree-reopen<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-instantfree-samefd<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-nofree-reopen<br />
-igt@xe_evict_ccs@evict-ccs-overcommit-standalone-nofree-samefd</p>

</body>
</html>

--===============2596556030896697695==--
