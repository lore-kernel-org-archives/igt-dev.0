Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 26 Aug 2020 22:32:17 -0000
Message-ID: <159848113708.21253.8854971756542466700@emeril.freedesktop.org>
References: <20200826160621.92623-1-lyude@redhat.com>
In-Reply-To: <20200826160621.92623-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=3A_Generate_reference_CRCs_for_partial_coverage_too?=
 =?utf-8?q?_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0183198209=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0183198209==
Content-Type: multipart/alternative;
 boundary="===============7323549241085697108=="

--===============7323549241085697108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane: Generate reference CRCs for partial coverage too (rev5)
URL   : https://patchwork.freedesktop.org/series/74806/
State : success

== Summary ==

CI Bug Log - changes from IGT_5772_full -> IGTPW_4908_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html

Known issues
------------

  Here are the changes found in IGTPW_4908_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_gttfill@basic:
    - shard-apl:          [PASS][1] -> [TIMEOUT][2] ([i915#1635] / [i915#1958]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl8/igt@gem_exec_gttfill@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl6/igt@gem_exec_gttfill@basic.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#1635] / [i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-iclb:         [PASS][5] -> [TIMEOUT][6] ([i915#1958])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb4/igt@gem_exec_whisper@basic-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb4/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-kbl:          [PASS][7] -> [TIMEOUT][8] ([i915#1958])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl2/igt@gem_exec_whisper@basic-fds-forked.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl7/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk6/igt@gem_exec_whisper@basic-fds-priority-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][11] -> [TIMEOUT][12] ([i915#1958])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk9/igt@gem_exec_whisper@basic-queues.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk3/igt@gem_exec_whisper@basic-queues.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#79])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][15] -> [INCOMPLETE][16] ([i915#2055])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2122])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +6 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#1542])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb1/igt@perf@blocking-parameterized.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb7/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb7/igt@perf_pmu@module-unload.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb5/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_exec_nop@basic-sequential:
    - shard-tglb:         [TIMEOUT][29] ([i915#1958]) -> [PASS][30] +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb8/igt@gem_exec_nop@basic-sequential.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb8/igt@gem_exec_nop@basic-sequential.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-kbl:          [TIMEOUT][31] ([i915#1958]) -> [PASS][32] +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl4/igt@gem_exec_whisper@basic-forked.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [TIMEOUT][33] ([i915#1958]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_sync@basic-store-all:
    - shard-glk:          [FAIL][35] ([i915#2356]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk4/igt@gem_sync@basic-store-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk8/igt@gem_sync@basic-store-all.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [INCOMPLETE][37] ([i915#1635] / [i915#2278]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl4/igt@i915_selftest@mock@contexts.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl7/igt@i915_selftest@mock@contexts.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][39] ([i915#1119]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-hsw:          [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
    - shard-apl:          [FAIL][45] ([i915#1635] / [i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][49] ([i915#1982]) -> [PASS][50] +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-kbl:          [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-snb:          [DMESG-WARN][57] ([i915#42]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][59] ([i915#588]) -> [SKIP][60] ([i915#658])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [INCOMPLETE][62] ([i915#155] / [i915#794])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2356]: https://gitlab.freedesktop.org/drm/intel/issues/2356
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5772 -> IGTPW_4908

  CI-20190529: 20190529
  CI_DRM_8928: 58f2939dbc6d2e11838ad8ef87250fcd1e3408ee @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4908: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html
  IGT_5772: 53dfd92f87ecf44251948025533c88f6b889ffeb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html

--===============7323549241085697108==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane: Generate reference CRCs for partial coverage too (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/74806/">https://patchwork.freedesktop.org/series/74806/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5772_full -&gt; IGTPW_4908_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4908_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl8/igt@gem_exec_gttfill@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl6/igt@gem_exec_gttfill@basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb4/igt@gem_exec_whisper@basic-fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb4/igt@gem_exec_whisper@basic-fds.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl2/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl7/igt@gem_exec_whisper@basic-fds-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk6/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk9/igt@gem_exec_whisper@basic-queues.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk3/igt@gem_exec_whisper@basic-queues.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk7/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb1/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb7/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb5/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_nop@basic-sequential:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb8/igt@gem_exec_nop@basic-sequential.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb8/igt@gem_exec_nop@basic-sequential.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl4/igt@gem_exec_whisper@basic-forked.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@gem_exec_whisper@basic-forked.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-store-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk4/igt@gem_sync@basic-store-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2356">i915#2356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk8/igt@gem_sync@basic-store-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl7/igt@i915_selftest@mock@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-hsw2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-hsw8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +5 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/42">i915#42</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5772/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5772 -&gt; IGTPW_4908</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8928: 58f2939dbc6d2e11838ad8ef87250fcd1e3408ee @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4908: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4908/index.html<br />
  IGT_5772: 53dfd92f87ecf44251948025533c88f6b889ffeb @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============7323549241085697108==--

--===============0183198209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0183198209==--
