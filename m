Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 04 Sep 2020 03:22:18 -0000
Message-ID: <159918973894.8517.16944872876230633317@emeril.freedesktop.org>
References: <20200904005439.17146-1-abhinavk@codeaurora.org>
In-Reply-To: <20200904005439.17146-1-abhinavk@codeaurora.org>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_video_pattern_DP_CTS_for_MSM_chipsets?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0323738527=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0323738527==
Content-Type: multipart/alternative;
 boundary="===============4794000497245682918=="

--===============4794000497245682918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for video pattern DP CTS for MSM chipsets
URL   : https://patchwork.freedesktop.org/series/81311/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8961_full -> IGTPW_4950_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html

Known issues
------------

  Here are the changes found in IGTPW_4950_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-wc-read:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1635] / [i915#1982])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl3/igt@gem_exec_reloc@basic-wc-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl7/igt@gem_exec_reloc@basic-wc-read.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2346])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#49])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +7 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#83])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#83])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1911])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb2/igt@kms_psr@psr2_basic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb3/igt@kms_psr@psr2_basic.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#1542])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk6/igt@perf@polling-parameterized.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk2/igt@perf@polling-parameterized.html
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#1542])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb6/igt@perf@polling-parameterized.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb3/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][27] ([i915#2389]) -> [PASS][28] +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][29] ([i915#118] / [i915#95]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][33] ([i915#1635] / [i915#2278]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl8/igt@i915_selftest@mock@contexts.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl2/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][35] ([i915#1982]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][37] ([i915#407]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-hsw6/igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-hsw8/igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:
    - shard-glk:          [FAIL][43] ([i915#49]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-snb:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-tglb:         [DMESG-WARN][47] ([i915#1982]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-query-forked-hang:
    - shard-glk:          [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk5/igt@kms_vblank@pipe-b-query-forked-hang.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk5/igt@kms_vblank@pipe-b-query-forked-hang.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-apl:          [DMESG-WARN][53] ([i915#1635] / [i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_vblank@pipe-c-query-busy-hang.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl7/igt@kms_vblank@pipe-c-query-busy-hang.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][55] ([i915#1319] / [i915#1635]) -> [TIMEOUT][56] ([i915#1319] / [i915#1635] / [i915#1958])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][57] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][58] ([i915#1319] / [i915#1635] / [i915#1958])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_content_protection@lic.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][59] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][60] ([fdo#108145] / [i915#1635] / [i915#265]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5777 -> IGTPW_4950
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8961: a9f0150a8c09b7ea3802c923c599f3a1e4d27144 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4950: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html

--===============4794000497245682918==
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
<tr><td><b>Series:</b></td><td>Add support for video pattern DP CTS for MSM chipsets</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81311/">https://patchwork.freedesktop.org/series/81311/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8961_full -&gt; IGTPW_4950_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4950_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-wc-read:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl3/igt@gem_exec_reloc@basic-wc-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl7/igt@gem_exec_reloc@basic-wc-read.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk6/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb2/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb1/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb5/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb5/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk6/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk2/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb6/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb3/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk1/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk5/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk4/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl8/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl2/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl7/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk2/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/407">i915#407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk7/igt@kms_flip@2x-modeset-vs-vblank-race@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-hsw6/igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-hsw8/igt@kms_flip@2x-plain-flip-ts-check@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-glk5/igt@kms_vblank@pipe-b-query-forked-hang.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-glk5/igt@kms_vblank@pipe-b-query-forked-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_vblank@pipe-c-query-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl7/igt@kms_vblank@pipe-c-query-busy-hang.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl1/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl3/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8961/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5777 -&gt; IGTPW_4950</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8961: a9f0150a8c09b7ea3802c923c599f3a1e4d27144 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4950: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4950/index.html<br />
  IGT_5777: c240b5c00d58860e376b012cc3c883c17ae63f37 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4794000497245682918==--

--===============0323738527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0323738527==--
