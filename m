Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 24 Sep 2020 08:27:52 -0000
Message-ID: <160093607269.24488.14059868897025846577@emeril.freedesktop.org>
References: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200907032622.6837-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Test_HPD_for_a_connector_with_all_valid_pipe?=
 =?utf-8?q?s_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0254277258=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0254277258==
Content-Type: multipart/alternative;
 boundary="===============5255391428400064053=="

--===============5255391428400064053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_chamelium: Test HPD for a connector with all valid pipes (rev2)
URL   : https://patchwork.freedesktop.org/series/81404/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9045_full -> IGTPW_5007_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5007_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5007_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5007_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9045_full and IGTPW_5007_full:

### New IGT tests (3) ###

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5007_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@gem_exec_gttfill@all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@gem_exec_gttfill@all.html

  * igt@gem_exec_reloc@basic-many-active@bcs0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#2389])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@gem_exec_reloc@basic-many-active@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk7/igt@gem_exec_reloc@basic-many-active@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][7] -> [FAIL][8] ([i915#1635] / [i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#2190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl6/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check@a-dp1:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl1/igt@kms_flip@wf_vblank-ts-check@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl4/igt@kms_flip@wf_vblank-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb8/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][31] ([i915#118] / [i915#95]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][33] ([i915#2122]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - shard-snb:          [INCOMPLETE][35] ([i915#82]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-snb1/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-snb7/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_event_leak:
    - shard-glk:          [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk7/igt@kms_flip_event_leak.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@kms_flip_event_leak.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-iclb:         [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][45] ([fdo#109441]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [FAIL][47] ([i915#1722]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb3/igt@perf@polling-small-buf.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb6/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][49] ([i915#1319] / [i915#1635] / [i915#1958]) -> [FAIL][50] ([fdo#110321] / [i915#1635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl3/igt@kms_content_protection@srm.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl1/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-hsw:          [INCOMPLETE][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_5007
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9045: c090e19126310a35b72cafa971bdbdfa1c5c87db @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5007: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html

--===============5255391428400064053==
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
<tr><td><b>Series:</b></td><td>tests/kms_chamelium: Test HPD for a connector with all valid pipes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81404/">https://patchwork.freedesktop.org/series/81404/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9045_full -&gt; IGTPW_5007_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5007_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5007_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5007_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-128x42-offscreen.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9045_full and IGTPW_5007_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5007_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@gem_exec_gttfill@all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@gem_exec_gttfill@all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@gem_exec_reloc@basic-many-active@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk7/igt@gem_exec_reloc@basic-many-active@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl6/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/72">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl1/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl4/igt@kms_flip@wf_vblank-ts-check@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb8/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk7/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-snb1/igt@kms_flip@flip-vs-suspend@b-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-snb7/igt@kms_flip@flip-vs-suspend@b-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-kbl2/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-glk7/igt@kms_flip_event_leak.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-glk2/igt@kms_flip_event_leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb5/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-iclb3/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-iclb6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-apl3/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-apl1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9045/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5787 -&gt; IGTPW_5007</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9045: c090e19126310a35b72cafa971bdbdfa1c5c87db @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5007: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5007/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5255391428400064053==--

--===============0254277258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0254277258==--
