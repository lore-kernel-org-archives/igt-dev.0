Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5107882614153562989=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 28 Mar 2022 12:21:36 -0000
Message-ID: <164847009689.2848.6581304958627214716@emeril.freedesktop.org>
References: <20220328064722.127301-1-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmFzaWMg?=
 =?utf-8?q?Suspend/Resume_with_i915_unload_=28rev4=29?=
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

--===============5107882614153562989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Basic Suspend/Resume with i915 unload (rev4)
URL   : https://patchwork.freedesktop.org/series/101730/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11409 -> IGTPW_6838
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html

Participating hosts (44 -> 41)
------------------------------

  Additional (1): fi-kbl-soraka 
  Missing    (4): fi-bsw-cyan shard-rkl shard-tglu fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11409 and IGTPW_6838:

### New IGT tests (1) ###

  * igt@i915_suspend@system-suspend-without-i915:
    - Statuses : 10 pass(s)
    - Exec time: [0.94, 17.70] s

  

Known issues
------------

  Here are the changes found in IGTPW_6838 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@amdgpu/amd_basic@query-info:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][1] ([fdo#109315])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@amdgpu/amd_basic@query-info.html

  * igt@amdgpu/amd_cs_nop@nop-gfx0:
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][2] ([fdo#109315] / [i915#2575]) +16 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@amdgpu/amd_cs_nop@nop-gfx0.html

  * igt@core_hotunplug@unbind-rebind:
    - fi-elk-e7500:       NOTRUN -> [INCOMPLETE][3] ([i915#5441])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html
    - fi-bsw-nick:        NOTRUN -> [INCOMPLETE][4] ([i915#5441])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_fence@basic-busy@bcs0:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][5] ([fdo#109271]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#2190])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - fi-kbl-soraka:      NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-kbl-soraka:      NOTRUN -> [INCOMPLETE][8] ([i915#5441])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html
    - fi-kbl-7500u:       [PASS][9] -> [INCOMPLETE][10] ([i915#5441])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-kbl-7500u/igt@gem_render_tiled_blits@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-7500u/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-ilk-650:         [PASS][11] -> [INCOMPLETE][12] ([i915#5441])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-ilk-650/igt@gem_tiled_blits@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-ilk-650/igt@gem_tiled_blits@basic.html
    - fi-cfl-8109u:       NOTRUN -> [INCOMPLETE][13] ([i915#5441])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-8109u/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          [PASS][14] -> [DMESG-FAIL][15] ([i915#4494] / [i915#4957])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-dg1-6/igt@i915_selftest@live@hangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@dp-crc-fast:
    - fi-bsw-nick:        NOTRUN -> [SKIP][16] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-elk-e7500:       NOTRUN -> [SKIP][17] ([fdo#109271]) +28 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
    - fi-bsw-nick:        NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#5341])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-bwr-2160:        NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#5341])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#5341])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-bwr-2160:        NOTRUN -> [SKIP][21] ([fdo#109271]) +45 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-bsw-nick:        NOTRUN -> [SKIP][22] ([fdo#109271]) +37 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html

  * igt@runner@aborted:
    - fi-kbl-soraka:      NOTRUN -> [FAIL][23] ([i915#4312])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-1115g4:      [INCOMPLETE][24] ([i915#1373] / [i915#5441]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
    - {fi-ehl-2}:         [INCOMPLETE][26] ([i915#5441]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - {bat-rpls-2}:       [SKIP][28] ([i915#2582]) -> [PASS][29] +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-2/igt@fbdev@nullptr.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-2/igt@fbdev@nullptr.html

  * igt@gem_render_linear_blits@basic:
    - fi-bsw-nick:        [INCOMPLETE][30] ([i915#5441]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@gem_render_linear_blits@basic.html
    - fi-elk-e7500:       [INCOMPLETE][32] ([i915#5441]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@gem_render_linear_blits@basic.html
    - {fi-tgl-dsi}:       [INCOMPLETE][34] ([i915#5441]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-cfl-8109u:       [INCOMPLETE][36] ([i915#5441]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-cfl-8109u/igt@gem_render_tiled_blits@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-8109u/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - {bat-rpls-1}:       [INCOMPLETE][38] ([i915#5441]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-1/igt@gem_tiled_blits@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-1/igt@gem_tiled_blits@basic.html
    - {fi-adl-ddr5}:      [INCOMPLETE][40] ([i915#5441]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-adl-ddr5/igt@gem_tiled_blits@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-adl-ddr5/igt@gem_tiled_blits@basic.html
    - {bat-adlp-6}:       [INCOMPLETE][42] ([i915#5441]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-adlp-6/igt@gem_tiled_blits@basic.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-adlp-6/igt@gem_tiled_blits@basic.html
    - {bat-rpls-2}:       [INCOMPLETE][44] ([i915#5441]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-2/igt@gem_tiled_blits@basic.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-2/igt@gem_tiled_blits@basic.html
    - fi-bwr-2160:        [INCOMPLETE][46] ([i915#5441]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-bwr-2160/igt@gem_tiled_blits@basic.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@gem_tiled_blits@basic.html

  
#### Warnings ####

  * igt@gem_tiled_blits@basic:
    - fi-cfl-guc:         [INCOMPLETE][48] ([i915#5441]) -> [INCOMPLETE][49] ([i915#1982] / [i915#5441])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-cfl-guc/igt@gem_tiled_blits@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-guc/igt@gem_tiled_blits@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#5280]: https://gitlab.freedesktop.org/drm/intel/issues/5280
  [i915#5323]: https://gitlab.freedesktop.org/drm/intel/issues/5323
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5441]: https://gitlab.freedesktop.org/drm/intel/issues/5441


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6395 -> IGTPW_6838

  CI-20190529: 20190529
  CI_DRM_11409: 1445e850bf64ad27709fe64cde9e549149227534 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6838: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html
  IGT_6395: 9cba01635ccbce91e9205f68b8d540805d45c11f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@i915_suspend@system-suspend-without-i915

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html

--===============5107882614153562989==
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
<tr><td><b>Series:</b></td><td>Basic Suspend/Resume with i915 unload (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101730/">https://patchwork.freedesktop.org/series/101730/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11409 -&gt; IGTPW_6838</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html</p>
<h2>Participating hosts (44 -&gt; 41)</h2>
<p>Additional (1): fi-kbl-soraka <br />
  Missing    (4): fi-bsw-cyan shard-rkl shard-tglu fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11409 and IGTPW_6838:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_suspend@system-suspend-without-i915:<ul>
<li>Statuses : 10 pass(s)</li>
<li>Exec time: [0.94, 17.70] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6838 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@amdgpu/amd_basic@query-info:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@amdgpu/amd_basic@query-info.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>)</li>
</ul>
</li>
<li>
<p>igt@amdgpu/amd_cs_nop@nop-gfx0:</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@amdgpu/amd_cs_nop@nop-gfx0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-busy@bcs0:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_exec_fence@basic-busy@bcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-kbl-7500u/igt@gem_render_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-7500u/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-ilk-650/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-ilk-650/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-8109u/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@kms_chamelium@dp-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>
<p>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
<li>
<p>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5341">i915#5341</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>fi-bwr-2160:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-kbl-soraka:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-kbl-soraka/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-2/igt@fbdev@nullptr.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>
<p>fi-bsw-nick:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bsw-nick/igt@gem_render_linear_blits@basic.html">PASS</a></p>
</li>
<li>
<p>fi-elk-e7500:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-elk-e7500/igt@gem_render_linear_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-cfl-8109u/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-8109u/igt@gem_render_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>{bat-rpls-1}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-1/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-1/igt@gem_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{fi-adl-ddr5}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-adl-ddr5/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-adl-ddr5/igt@gem_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-adlp-6/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-adlp-6/igt@gem_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/bat-rpls-2/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/bat-rpls-2/igt@gem_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>fi-bwr-2160:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-bwr-2160/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-bwr-2160/igt@gem_tiled_blits@basic.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_tiled_blits@basic:<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/fi-cfl-guc/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/fi-cfl-guc/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6395 -&gt; IGTPW_6838</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11409: 1445e850bf64ad27709fe64cde9e549149227534 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6838: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6838/index.html<br />
  IGT_6395: 9cba01635ccbce91e9205f68b8d540805d45c11f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_suspend@system-suspend-without-i915</p>

</body>
</html>

--===============5107882614153562989==--
