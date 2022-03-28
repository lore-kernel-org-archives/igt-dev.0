Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8690863284031790862=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Mon, 28 Mar 2022 07:32:05 -0000
Message-ID: <164845272590.2847.12304466245616589292@emeril.freedesktop.org>
References: <20220328064722.127301-1-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-1-riana.tauro@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQmFzaWMg?=
 =?utf-8?q?Suspend/Resume_with_i915_unload_=28rev3=29?=
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

--===============8690863284031790862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Basic Suspend/Resume with i915 unload (rev3)
URL   : https://patchwork.freedesktop.org/series/101730/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11407 -> IGTPW_6834
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html

Participating hosts (48 -> 43)
------------------------------

  Additional (2): bat-adlm-1 fi-pnv-d510 
  Missing    (7): shard-tglu fi-bsw-cyan bat-adlp-4 fi-kbl-x1275 shard-rkl shard-dg1 fi-bdw-samus 

New tests
---------

  New tests have been introduced between CI_DRM_11407 and IGTPW_6834:

### New IGT tests (1) ###

  * igt@i915_suspend@system-suspend-without-i915:
    - Statuses : 1 dmesg-warn(s) 8 pass(s)
    - Exec time: [0.95, 17.83] s

  

Known issues
------------

  Here are the changes found in IGTPW_6834 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bsw-n3050:       NOTRUN -> [INCOMPLETE][1] ([i915#5441])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
    - fi-glk-dsi:         [PASS][2] -> [INCOMPLETE][3] ([i915#5441])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - fi-glk-dsi:         [PASS][4] -> [DMESG-WARN][5] ([i915#2943])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@gem_exec_suspend@basic-s0@smem.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_huc_copy@huc-copy:
    - fi-pnv-d510:        NOTRUN -> [SKIP][6] ([fdo#109271]) +9 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_linear_blits@basic:
    - fi-kbl-soraka:      [PASS][7] -> [INCOMPLETE][8] ([i915#5441])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html
    - fi-pnv-d510:        NOTRUN -> [INCOMPLETE][9] ([i915#5441])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@gem_render_linear_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-rkl-guc:         [PASS][10] -> [INCOMPLETE][11] ([i915#5441])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-rkl-guc/igt@gem_tiled_blits@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-rkl-guc/igt@gem_tiled_blits@basic.html
    - fi-cfl-8109u:       [PASS][12] -> [INCOMPLETE][13] ([i915#5441])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-8109u/igt@gem_tiled_blits@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-cfl-8109u/igt@gem_tiled_blits@basic.html
    - fi-kbl-7567u:       [PASS][14] -> [INCOMPLETE][15] ([i915#5441])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-7567u/igt@gem_tiled_blits@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-7567u/igt@gem_tiled_blits@basic.html

  * igt@i915_selftest@live@hangcheck:
    - bat-dg1-6:          NOTRUN -> [DMESG-FAIL][16] ([i915#4494] / [i915#4957])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-dg1-6/igt@i915_selftest@live@hangcheck.html

  * {igt@i915_suspend@system-suspend-without-i915} (NEW):
    - {bat-rpls-1}:       NOTRUN -> [DMESG-WARN][17] ([i915#4391])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-rpls-1/igt@i915_suspend@system-suspend-without-i915.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][19] ([fdo#109271]) +22 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@runner@aborted:
    - fi-pnv-d510:        NOTRUN -> [FAIL][20] ([i915#2403] / [i915#4312])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@runner@aborted.html
    - fi-glk-dsi:         NOTRUN -> [FAIL][21] ([i915#4312] / [k.org#202321])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@runner@aborted.html
    - fi-rkl-guc:         NOTRUN -> [FAIL][22] ([i915#4312])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-rkl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {bat-hsw-1}:        [INCOMPLETE][23] ([i915#5441]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html
    - {fi-adl-ddr5}:      [INCOMPLETE][25] ([i915#5441]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html
    - {fi-ehl-2}:         [INCOMPLETE][27] ([i915#5441]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
    - {bat-jsl-1}:        [INCOMPLETE][29] ([i915#1373]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-dg1-6:          [INCOMPLETE][31] ([i915#5441]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-dg1-6/igt@core_hotunplug@unbind-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-dg1-6/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_render_tiled_blits@basic:
    - fi-bsw-n3050:       [INCOMPLETE][33] ([i915#5441]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html
    - {bat-rpls-2}:       [INCOMPLETE][35] ([i915#5441]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-rpls-2/igt@gem_render_tiled_blits@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-rpls-2/igt@gem_render_tiled_blits@basic.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - {bat-adlp-6}:       [DMESG-WARN][37] ([i915#3576]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-bsw-kefka:       [FAIL][39] ([i915#2122]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-tgl-1115g4:      [INCOMPLETE][41] ([i915#1373]) -> [INCOMPLETE][42] ([i915#1373] / [i915#5441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
    - fi-kbl-7500u:       [INCOMPLETE][43] ([i915#1373]) -> [INCOMPLETE][44] ([i915#1373] / [i915#5441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html

  * igt@runner@aborted:
    - fi-bsw-n3050:       [FAIL][45] ([i915#3428] / [i915#4312]) -> [FAIL][46] ([i915#4312])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@runner@aborted.html

  
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
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2403]: https://gitlab.freedesktop.org/drm/intel/issues/2403
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2943]: https://gitlab.freedesktop.org/drm/intel/issues/2943
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4494]: https://gitlab.freedesktop.org/drm/intel/issues/4494
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#4957]: https://gitlab.freedesktop.org/drm/intel/issues/4957
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#5339]: https://gitlab.freedesktop.org/drm/intel/issues/5339
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5342]: https://gitlab.freedesktop.org/drm/intel/issues/5342
  [i915#5441]: https://gitlab.freedesktop.org/drm/intel/issues/5441
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6393 -> IGTPW_6834

  CI-20190529: 20190529
  CI_DRM_11407: a2fff1c90d9587c65608497d5bf5781c073bf46a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6834: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html
  IGT_6393: 1d267ea1b829fa10b31a37ccf6b4a970f032784a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git



== Testlist changes ==

+igt@i915_suspend@system-suspend-without-i915

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html

--===============8690863284031790862==
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
<tr><td><b>Series:</b></td><td>Basic Suspend/Resume with i915 unload (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101730/">https://patchwork.freedesktop.org/series/101730/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11407 -&gt; IGTPW_6834</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html</p>
<h2>Participating hosts (48 -&gt; 43)</h2>
<p>Additional (2): bat-adlm-1 fi-pnv-d510 <br />
  Missing    (7): shard-tglu fi-bsw-cyan bat-adlp-4 fi-kbl-x1275 shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11407 and IGTPW_6834:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@i915_suspend@system-suspend-without-i915:<ul>
<li>Statuses : 1 dmesg-warn(s) 8 pass(s)</li>
<li>Exec time: [0.95, 17.83] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6834 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@gem_exec_suspend@basic-s0@smem.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2943">i915#2943</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>
<p>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-soraka/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-rkl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-rkl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-rkl-guc/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-8109u/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-cfl-8109u/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-kbl-7567u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-7567u/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-7567u/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-dg1-6/igt@i915_selftest@live@hangcheck.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4494">i915#4494</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4957">i915#4957</a>)</li>
</ul>
</li>
<li>
<p>{igt@i915_suspend@system-suspend-without-i915} (NEW):</p>
<ul>
<li>{bat-rpls-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-rpls-1/igt@i915_suspend@system-suspend-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-pnv-d510/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2403">i915#2403</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-rkl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-rkl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>{bat-hsw-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-hsw-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{fi-adl-ddr5}:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-adl-ddr5/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg1-6:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-dg1-6/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-dg1-6/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-rpls-2/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-rpls-2/igt@gem_render_tiled_blits@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>{bat-adlp-6}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3576">i915#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/bat-adlp-6/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-tgl-1115g4:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-kbl-7500u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-kbl-7500u/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6393 -&gt; IGTPW_6834</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11407: a2fff1c90d9587c65608497d5bf5781c073bf46a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6834: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6834/index.html<br />
  IGT_6393: 1d267ea1b829fa10b31a37ccf6b4a970f032784a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<p>== Testlist changes ==</p>
<p>+igt@i915_suspend@system-suspend-without-i915</p>

</body>
</html>

--===============8690863284031790862==--
