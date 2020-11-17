Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Nov 2020 13:48:52 -0000
Message-ID: <160562093256.25709.1539212448444892931@emeril.freedesktop.org>
References: <20201117125257.28089-1-tzimmermann@suse.de>
In-Reply-To: <20201117125257.28089-1-tzimmermann@suse.de>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgVGVzdCBj?=
 =?utf-8?q?ases_for_fbdev?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1678997566=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1678997566==
Content-Type: multipart/alternative;
 boundary="===============5082327565750357079=="

--===============5082327565750357079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test cases for fbdev
URL   : https://patchwork.freedesktop.org/series/83955/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9343 -> IGTPW_5177
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5177:

### IGT changes ###

#### Possible regressions ####

  * {igt@fbdev@read} (NEW):
    - {fi-dg1-1}:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-dg1-1/igt@fbdev@read.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9343 and IGTPW_5177:

### New IGT tests (6) ###

  * igt@fbdev@eof:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@fbdev@nullptr:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@fbdev@read:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 3.06] s

  * igt@fbdev@unaligned-read:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@fbdev@unaligned-write:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 1.03] s

  * igt@fbdev@write:
    - Statuses : 35 pass(s) 5 skip(s)
    - Exec time: [0.0, 2.05] s

  

Known issues
------------

  Here are the changes found in IGTPW_5177 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_suspend@basic-s0:
    - fi-apl-guc:         [PASS][2] -> [DMESG-WARN][3] ([i915#1635] / [i915#62]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-apl-guc/igt@gem_exec_suspend@basic-s0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-apl-guc/igt@gem_exec_suspend@basic-s0.html
    - fi-ilk-650:         [PASS][4] -> [DMESG-WARN][5] ([i915#164])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html

  * igt@i915_module_load@reload:
    - fi-tgl-u2:          [PASS][6] -> [DMESG-WARN][7] ([i915#1982] / [k.org#205379])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-u2/igt@i915_module_load@reload.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-u2/igt@i915_module_load@reload.html

  * igt@i915_selftest@live@execlists:
    - fi-glk-dsi:         [PASS][8] -> [INCOMPLETE][9] ([i915#1037])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-glk-dsi/igt@i915_selftest@live@execlists.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-glk-dsi/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-bsw-kefka:       [PASS][10] -> [DMESG-WARN][11] ([i915#1982])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - fi-icl-u2:          [PASS][12] -> [DMESG-WARN][13] ([i915#1982]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-c:
    - fi-tgl-y:           [PASS][14] -> [DMESG-WARN][15] ([i915#1982]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html

  * igt@prime_vgem@basic-read:
    - fi-tgl-y:           [PASS][16] -> [DMESG-WARN][17] ([i915#402]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@prime_vgem@basic-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@prime_vgem@basic-read.html

  
#### Possible fixes ####

  * igt@i915_module_load@reload:
    - fi-kbl-soraka:      [DMESG-WARN][18] ([i915#1982]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-kbl-soraka/igt@i915_module_load@reload.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-kbl-soraka/igt@i915_module_load@reload.html

  * igt@kms_busy@basic@flip:
    - {fi-kbl-7560u}:     [DMESG-WARN][20] ([i915#1982]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-kbl-7560u/igt@kms_busy@basic@flip.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-kbl-7560u/igt@kms_busy@basic@flip.html
    - {fi-tgl-dsi}:       [DMESG-WARN][22] ([i915#1982]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-dsi/igt@kms_busy@basic@flip.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-dsi/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - fi-apl-guc:         [DMESG-WARN][24] ([i915#1635] / [i915#1982]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_psr@sprite_plane_onoff:
    - fi-tgl-y:           [DMESG-WARN][26] ([i915#1982]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - fi-tgl-y:           [DMESG-WARN][28] ([i915#402]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Warnings ####

  * igt@debugfs_test@read_all_entries:
    - fi-tgl-y:           [DMESG-WARN][30] ([i915#402]) -> [DMESG-WARN][31] ([i915#1982])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@debugfs_test@read_all_entries.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@debugfs_test@read_all_entries.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1037]: https://gitlab.freedesktop.org/drm/intel/issues/1037
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#164]: https://gitlab.freedesktop.org/drm/intel/issues/164
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2268]: https://gitlab.freedesktop.org/drm/intel/issues/2268
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (45 -> 40)
------------------------------

  Additional (1): fi-blb-e6850 
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5177

  CI-20190529: 20190529
  CI_DRM_9343: e1757932e1d12120875a6f468de2583f1842eb2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@fbdev@eof
+igt@fbdev@nullptr
+igt@fbdev@read
+igt@fbdev@unaligned-read
+igt@fbdev@unaligned-write
+igt@fbdev@write
-igt@fbdev@mmap

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html

--===============5082327565750357079==
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
<tr><td><b>Series:</b></td><td>Test cases for fbdev</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83955/">https://patchwork.freedesktop.org/series/83955/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9343 -&gt; IGTPW_5177</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5177:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@fbdev@read} (NEW):<ul>
<li>{fi-dg1-1}:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-dg1-1/igt@fbdev@read.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9343 and IGTPW_5177:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 3.06] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.03] s</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>Statuses : 35 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 2.05] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5177 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>
<p>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-apl-guc/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-apl-guc/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +1 similar issue</p>
</li>
<li>
<p>fi-ilk-650:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-ilk-650/igt@gem_exec_suspend@basic-s0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/164">i915#164</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-tgl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-u2/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-u2/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>fi-glk-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-glk-dsi/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-glk-dsi/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1037">i915#1037</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-bsw-kefka:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-bsw-kefka/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-c:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@kms_pipe_crc_basic@read-crc-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@prime_vgem@basic-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@prime_vgem@basic-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>fi-kbl-soraka:      <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-kbl-soraka/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-kbl-soraka/igt@i915_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic@flip:</p>
<ul>
<li>
<p>{fi-kbl-7560u}:     <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-kbl-7560u/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-kbl-7560u/igt@kms_busy@basic@flip.html">PASS</a></p>
</li>
<li>
<p>{fi-tgl-dsi}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-dsi/igt@kms_busy@basic@flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-dsi/igt@kms_busy@basic@flip.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>fi-apl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@kms_psr@sprite_plane_onoff.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@prime_self_import@basic-with_one_bo_two_files.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@debugfs_test@read_all_entries:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/fi-tgl-y/igt@debugfs_test@read_all_entries.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (45 -&gt; 40)</h2>
<p>Additional (1): fi-blb-e6850 <br />
  Missing    (6): fi-ilk-m540 fi-hsw-4200u fi-bsw-cyan fi-ctg-p8600 fi-bdw-samus fi-kbl-r </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5177</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9343: e1757932e1d12120875a6f468de2583f1842eb2e @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5177: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5177/index.html<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@fbdev@eof<br />
+igt@fbdev@nullptr<br />
+igt@fbdev@read<br />
+igt@fbdev@unaligned-read<br />
+igt@fbdev@unaligned-write<br />
+igt@fbdev@write<br />
-igt@fbdev@mmap</p>

</body>
</html>

--===============5082327565750357079==--

--===============1678997566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1678997566==--
