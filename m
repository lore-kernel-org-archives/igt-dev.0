Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5700577050670475932=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Date: Tue, 14 Jun 2022 01:39:29 -0000
Message-ID: <165517076915.12486.9160408153833259152@emeril.freedesktop.org>
References: <20220614004720.45666-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20220614004720.45666-1-umesh.nerlige.ramappa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/drm=5Ffdinfo=3A_Parse_compute_as_well?=
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

--===============5700577050670475932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/drm_fdinfo: Parse compute as well
URL   : https://patchwork.freedesktop.org/series/105086/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11755 -> IGTPW_7295
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html

Participating hosts (44 -> 42)
------------------------------

  Additional (1): fi-icl-u2 
  Missing    (3): fi-cml-u2 bat-adlm-1 bat-jsl-2 

Known issues
------------

  Here are the changes found in IGTPW_7295 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - fi-icl-u2:          NOTRUN -> [SKIP][1] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@random-engines:
    - fi-icl-u2:          NOTRUN -> [SKIP][2] ([i915#4613]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html

  * igt@i915_selftest@live@coherency:
    - fi-bdw-5557u:       [PASS][3] -> [INCOMPLETE][4] ([i915#5674] / [i915#5685])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-bdw-5557u/igt@i915_selftest@live@coherency.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-bdw-5557u/igt@i915_selftest@live@coherency.html

  * igt@i915_selftest@live@requests:
    - fi-blb-e6850:       [PASS][5] -> [DMESG-FAIL][6] ([i915#4528])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-blb-e6850/igt@i915_selftest@live@requests.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-blb-e6850/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@basic-s3-without-i915:
    - fi-icl-u2:          NOTRUN -> [SKIP][7] ([i915#5903])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_busy@basic@modeset:
    - bat-adlp-4:         [PASS][8] -> [DMESG-WARN][9] ([i915#3576])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_busy@basic@modeset.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_busy@basic@modeset.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-icl-u2:          NOTRUN -> [SKIP][10] ([fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - fi-tgl-u2:          [PASS][11] -> [DMESG-WARN][12] ([i915#402]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - fi-icl-u2:          NOTRUN -> [WARN][13] ([i915#6008])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-kbl-guc:         NOTRUN -> [SKIP][14] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html
    - fi-icl-u2:          NOTRUN -> [SKIP][15] ([fdo#109285])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-icl-u2:          NOTRUN -> [SKIP][16] ([fdo#109278]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-icl-u2:          NOTRUN -> [SKIP][17] ([i915#3555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@prime_vgem@basic-userptr:
    - fi-icl-u2:          NOTRUN -> [SKIP][18] ([fdo#109295] / [i915#3301])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@i915_pm_rpm@module-reload:
    - fi-cfl-8109u:       [DMESG-FAIL][19] ([i915#62]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-jsl-1}:         [DMESG-FAIL][21] ([i915#5334]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [DMESG-FAIL][23] ([i915#4494] / [i915#4957]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][25] ([i915#5904]) -> [PASS][26] +29 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@sanitycheck:
    - {bat-dg2-9}:        [DMESG-WARN][27] ([i915#5763]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - fi-cfl-8109u:       [DMESG-WARN][29] ([i915#5904] / [i915#62]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - bat-adlp-4:         [DMESG-WARN][31] ([i915#3576]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][33] ([i915#3576]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - fi-cfl-8109u:       [DMESG-WARN][35] ([i915#62]) -> [PASS][36] +15 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@kms_busy@basic@flip:
    - bat-adlp-4:         [DMESG-WARN][37] ([i915#3576]) -> [DMESG-WARN][38] ([i915#1982] / [i915#3576])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_busy@basic@flip.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_busy@basic@flip.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5674]: https://gitlab.freedesktop.org/drm/intel/issues/5674
  [i915#5685]: https://gitlab.freedesktop.org/drm/intel/issues/5685
  [i915#5763]: https://gitlab.freedesktop.org/drm/intel/issues/5763
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#6008]: https://gitlab.freedesktop.org/drm/intel/issues/6008
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6522 -> IGTPW_7295

  CI-20190529: 20190529
  CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html
  IGT_6522: 5be5a1a1f168a59614101b77385f05f12ec7d30a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html

--===============5700577050670475932==
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
<tr><td><b>Series:</b></td><td>tests/i915/drm_fdinfo: Parse compute as well</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/105086/">https://patchwork.freedesktop.org/series/105086/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11755 -&gt; IGTPW_7295</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html</p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Additional (1): fi-icl-u2 <br />
  Missing    (3): fi-cml-u2 bat-adlm-1 bat-jsl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7295 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@coherency:</p>
<ul>
<li>fi-bdw-5557u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-bdw-5557u/igt@i915_selftest@live@coherency.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5674">i915#5674</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5685">i915#5685</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>fi-blb-e6850:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-blb-e6850/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-blb-e6850/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@i915_suspend@basic-s3-without-i915.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5903">i915#5903</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@modeset:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_busy@basic@modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_busy@basic@modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-tgl-u2/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_force_connector_basic@force-connector-state.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6008">i915#6008</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-kbl-guc/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-icl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-icl-u2/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@module-reload:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_pm_rpm@module-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-jsl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-jsl-1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@sanitycheck:</p>
<ul>
<li>{bat-dg2-9}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5763">i915#5763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-dg2-9/igt@i915_selftest@live@sanitycheck.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/fi-cfl-8109u/igt@kms_frontbuffer_tracking@basic.html">PASS</a> +15 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_busy@basic@flip:<ul>
<li>bat-adlp-4:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11755/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/bat-adlp-4/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6522 -&gt; IGTPW_7295</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11755: 65b93b94d6bc932ed60bb3fd9d68242db25b1f3b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_7295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7295/index.html<br />
  IGT_6522: 5be5a1a1f168a59614101b77385f05f12ec7d30a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5700577050670475932==--
