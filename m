Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5510255617699211050=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Abhinav Kumar" <quic_abhinavk@quicinc.com>
Date: Sun, 27 Mar 2022 05:48:31 -0000
Message-ID: <164836011199.4441.13595706877809406331@emeril.freedesktop.org>
References: <1648251706-30978-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1648251706-30978-1-git-send-email-quic_abhinavk@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_check_if_second_primary_plane_is_valid_=28r?=
 =?utf-8?q?ev3=29?=
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

--===============5510255617699211050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_concurrent: check if second primary plane is valid (rev3)
URL   : https://patchwork.freedesktop.org/series/101755/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11407 -> IGTPW_6832
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html

Participating hosts (48 -> 42)
------------------------------

  Additional (1): bat-adlm-1 
  Missing    (7): shard-tglu fi-bsw-cyan bat-adlp-4 fi-kbl-x1275 shard-rkl shard-dg1 fi-bdw-samus 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6832:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_suspend@basic-s3@smem:
    - {bat-adlm-1}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html

  
Known issues
------------

  Here are the changes found in IGTPW_6832 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - fi-bsw-n3050:       NOTRUN -> [INCOMPLETE][2] ([i915#5441])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html
    - fi-cfl-guc:         NOTRUN -> [INCOMPLETE][3] ([i915#5441])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
    - fi-glk-dsi:         [PASS][4] -> [INCOMPLETE][5] ([i915#5441])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_tiled_blits@basic:
    - fi-cfl-8109u:       [PASS][6] -> [INCOMPLETE][7] ([i915#5441])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-8109u/igt@gem_tiled_blits@basic.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-8109u/igt@gem_tiled_blits@basic.html
    - fi-kbl-guc:         [PASS][8] -> [INCOMPLETE][9] ([i915#5441])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-guc/igt@gem_tiled_blits@basic.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-kbl-guc/igt@gem_tiled_blits@basic.html

  * igt@kms_chamelium@dp-edid-read:
    - fi-cfl-guc:         NOTRUN -> [SKIP][10] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][11] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-cfl-guc:         NOTRUN -> [SKIP][12] ([fdo#109271]) +9 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - fi-cfl-guc:         NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#533])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - fi-bsw-n3050:       NOTRUN -> [SKIP][14] ([fdo#109271]) +22 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@runner@aborted:
    - fi-glk-dsi:         NOTRUN -> [FAIL][15] ([i915#4312] / [k.org#202321])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-glk-dsi/igt@runner@aborted.html
    - fi-kbl-guc:         NOTRUN -> [FAIL][16] ([i915#4312])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-kbl-guc/igt@runner@aborted.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - {fi-ehl-2}:         [INCOMPLETE][17] ([i915#5441]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html
    - {bat-jsl-1}:        [INCOMPLETE][19] ([i915#1373]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_render_linear_blits@basic:
    - {fi-tgl-dsi}:       [INCOMPLETE][21] ([i915#5441]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html

  * igt@gem_render_tiled_blits@basic:
    - fi-bsw-n3050:       [INCOMPLETE][23] ([i915#5441]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html
    - {bat-rpls-2}:       [INCOMPLETE][25] ([i915#5441]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-rpls-2/igt@gem_render_tiled_blits@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-rpls-2/igt@gem_render_tiled_blits@basic.html

  * igt@gem_tiled_blits@basic:
    - fi-cfl-guc:         [INCOMPLETE][27] ([i915#5441]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-guc/igt@gem_tiled_blits@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@gem_tiled_blits@basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - fi-bsw-kefka:       [FAIL][29] ([i915#2122]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Warnings ####

  * igt@runner@aborted:
    - fi-bsw-n3050:       [FAIL][31] ([i915#3428] / [i915#4312]) -> [FAIL][32] ([i915#4312])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@runner@aborted.html

  
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
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3428]: https://gitlab.freedesktop.org/drm/intel/issues/3428
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3576]: https://gitlab.freedesktop.org/drm/intel/issues/3576
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4897]: https://gitlab.freedesktop.org/drm/intel/issues/4897
  [i915#5127]: https://gitlab.freedesktop.org/drm/intel/issues/5127
  [i915#5195]: https://gitlab.freedesktop.org/drm/intel/issues/5195
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5339]: https://gitlab.freedesktop.org/drm/intel/issues/5339
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5342]: https://gitlab.freedesktop.org/drm/intel/issues/5342
  [i915#5401]: https://gitlab.freedesktop.org/drm/intel/issues/5401
  [i915#5441]: https://gitlab.freedesktop.org/drm/intel/issues/5441
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6393 -> IGTPW_6832

  CI-20190529: 20190529
  CI_DRM_11407: a2fff1c90d9587c65608497d5bf5781c073bf46a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6832: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html
  IGT_6393: 1d267ea1b829fa10b31a37ccf6b4a970f032784a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html

--===============5510255617699211050==
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
<tr><td><b>Series:</b></td><td>tests/kms_concurrent: check if second primary plane is valid (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101755/">https://patchwork.freedesktop.org/series/101755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11407 -&gt; IGTPW_6832</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html</p>
<h2>Participating hosts (48 -&gt; 42)</h2>
<p>Additional (1): bat-adlm-1 <br />
  Missing    (7): shard-tglu fi-bsw-cyan bat-adlp-4 fi-kbl-x1275 shard-rkl shard-dg1 fi-bdw-samus </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6832:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_suspend@basic-s3@smem:<ul>
<li>{bat-adlm-1}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-adlm-1/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6832 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-glk-dsi/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-8109u/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-8109u/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-kbl-guc/igt@gem_tiled_blits@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-kbl-guc/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-fast:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@kms_chamelium@hdmi-crc-fast.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-glk-dsi:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-glk-dsi/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
<li>
<p>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-kbl-guc/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</p>
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
<p>{fi-ehl-2}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-ehl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>{bat-jsl-1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-jsl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_linear_blits@basic:</p>
<ul>
<li>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-tgl-dsi/igt@gem_render_linear_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>
<p>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@gem_render_tiled_blits@basic.html">PASS</a></p>
</li>
<li>
<p>{bat-rpls-2}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/bat-rpls-2/igt@gem_render_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/bat-rpls-2/igt@gem_render_tiled_blits@basic.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>fi-cfl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-cfl-guc/igt@gem_tiled_blits@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5441">i915#5441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-cfl-guc/igt@gem_tiled_blits@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-kefka/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11407/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3428">i915#3428</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6393 -&gt; IGTPW_6832</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11407: a2fff1c90d9587c65608497d5bf5781c073bf46a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_6832: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6832/index.html<br />
  IGT_6393: 1d267ea1b829fa10b31a37ccf6b4a970f032784a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5510255617699211050==--
