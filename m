Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6899214122934259952=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jeevan B" <jeevan.b@intel.com>
Date: Thu, 07 Apr 2022 12:26:06 -0000
Message-ID: <164933436629.14671.13211219751162362870@emeril.freedesktop.org>
References: <20220407111924.21745-1-jeevan.b@intel.com>
In-Reply-To: <20220407111924.21745-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgZW5hYmxl?=
 =?utf-8?q?_4-tiled_ccs_modifiers_on_dg2?=
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

--===============6899214122934259952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: enable 4-tiled ccs modifiers on dg2
URL   : https://patchwork.freedesktop.org/series/102335/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11471 -> IGTPW_6892
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html

Participating hosts (49 -> 45)
------------------------------

  Additional (3): fi-tgl-u2 bat-hsw-1 fi-pnv-d510 
  Missing    (7): fi-kbl-soraka fi-bdw-5557u shard-tglu fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6892:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@core_hotunplug@unbind-rebind:
    - {bat-hsw-1}:        NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - {bat-rpls-1}:       NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/bat-rpls-1/igt@gem_lmem_swapping@parallel-random-engines.html

  
Known issues
------------

  Here are the changes found in IGTPW_6892 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@semaphore:
    - fi-hsw-4770:        NOTRUN -> [SKIP][3] ([fdo#109271] / [fdo#109315]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][4] ([fdo#109271]) +57 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html
    - fi-tgl-u2:          NOTRUN -> [SKIP][5] ([i915#2190])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html

  * igt@kms_busy@basic@flip:
    - fi-tgl-u2:          NOTRUN -> [DMESG-WARN][6] ([i915#402])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_busy@basic@flip.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-tgl-u2:          NOTRUN -> [SKIP][7] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-tgl-u2:          NOTRUN -> [SKIP][8] ([i915#4103]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_force_connector_basic@force-load-detect:
    - fi-tgl-u2:          NOTRUN -> [SKIP][9] ([fdo#109285])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-pnv-d510:        NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#5341])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - fi-tgl-u2:          NOTRUN -> [SKIP][11] ([i915#3555])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@gt_heartbeat:
    - {fi-tgl-dsi}:       [DMESG-FAIL][12] -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@hangcheck:
    - fi-hsw-4770:        [INCOMPLETE][14] ([i915#4785]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4785]: https://gitlab.freedesktop.org/drm/intel/issues/4785
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5537]: https://gitlab.freedesktop.org/drm/intel/issues/5537
  [i915#5552]: https://gitlab.freedesktop.org/drm/intel/issues/5552


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6415 -> IGTPW_6892

  CI-20190529: 20190529
  CI_DRM_11471: 7067f6f93e8c8b40c9b4592d7674d0ae0960bab6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6892: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-e-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-e-random-ccs-data-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-bad-pixel-format-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-bad-pixel-format-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-bad-rotation-90-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-bad-rotation-90-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-crc-primary-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-crc-primary-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs
+igt@kms_ccs@pipe-f-random-ccs-data-4_tiled_dg2_mc_ccs
+igt@kms_ccs@pipe-f-random-ccs-data-4_tiled_dg2_rc_ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html

--===============6899214122934259952==
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
<tr><td><b>Series:</b></td><td>enable 4-tiled ccs modifiers on dg2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/102335/">https://patchwork.freedesktop.org/series/102335/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11471 -&gt; IGTPW_6892</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html</p>
<h2>Participating hosts (49 -&gt; 45)</h2>
<p>Additional (3): fi-tgl-u2 bat-hsw-1 fi-pnv-d510 <br />
  Missing    (7): fi-kbl-soraka fi-bdw-5557u shard-tglu fi-bsw-cyan bat-adlp-4 fi-ctg-p8600 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6892:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>{bat-hsw-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/bat-rpls-1/igt@gem_lmem_swapping@parallel-random-engines.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6892 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@semaphore:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-hsw-4770/igt@amdgpu/amd_basic@semaphore.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +57 similar issues</p>
</li>
<li>
<p>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>fi-tgl-u2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-u2/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-tgl-dsi/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-4770:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11471/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4785">i915#4785</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/fi-hsw-4770/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6892</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11471: 7067f6f93e8c8b40c9b4592d7674d0ae0960bab6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6892: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6892/index.html<br />
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-e-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-e-random-ccs-data-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-bad-pixel-format-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-bad-pixel-format-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-bad-rotation-90-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-bad-rotation-90-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs<br />
+igt@kms_ccs@pipe-f-random-ccs-data-4_tiled_dg2_mc_ccs<br />
+igt@kms_ccs@pipe-f-random-ccs-data-4_tiled_dg2_rc_ccs</p>

</body>
</html>

--===============6899214122934259952==--
