Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Aug 2020 12:42:14 -0000
Message-ID: <159706333491.17062.3256566146225459935@emeril.freedesktop.org>
References: <20200810090034.158383-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20200810090034.158383-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=3A_Remove_subtests_that_rely_on_async_relocation_behavior?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0649724654=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0649724654==
Content-Type: multipart/alternative;
 boundary="===============5117840101714645421=="

--===============5117840101714645421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915: Remove subtests that rely on async relocation behavior
URL   : https://patchwork.freedesktop.org/series/80460/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8862_full -> IGTPW_4868_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html

Known issues
------------

  Here are the changes found in IGTPW_4868_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#93] / [i915#95])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#54])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1635] / [i915#54])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +11 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_lease@lease_invalid_crtc:
    - shard-hsw:          [PASS][13] -> [TIMEOUT][14] ([i915#1958]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_lease@lease_invalid_crtc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw8/igt@kms_lease@lease_invalid_crtc.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109441]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#1542])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb4/igt@perf@blocking-parameterized.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb6/igt@perf@blocking-parameterized.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@perf@polling-parameterized.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@perf@polling-parameterized.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#2258]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@after-wait@vcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw5/igt@prime_busy@after-wait@vcs0.html

  * igt@syncobj_wait@multi-wait-for-submit-submitted-signaled:
    - shard-snb:          [PASS][23] -> [TIMEOUT][24] ([i915#1958]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#1755])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk5/igt@sysfs_preempt_timeout@timeout@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk9/igt@sysfs_preempt_timeout@timeout@vecs0.html

  
#### Possible fixes ####

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [SKIP][27] ([i915#658]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb8/igt@feature_discovery@psr2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_eio@kms:
    - shard-apl:          [DMESG-WARN][31] ([i915#1635] / [i915#1982]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gem_eio@kms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-apl2/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][33] ([i915#118] / [i915#95]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk7/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][35] ([i915#1982]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][37] ([i915#57]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl4/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
    - shard-iclb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][47] ([i915#173]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb7/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][49] ([fdo#109441]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf_pmu@init-wait@vecs0:
    - shard-hsw:          [DMESG-WARN][51] ([i915#2316]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@perf_pmu@init-wait@vecs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw1/igt@perf_pmu@init-wait@vecs0.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][53] ([i915#2258]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html

  * {igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted}:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw2/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html

  
#### Warnings ####

  * igt@gem_ctx_engines@execute-one:
    - shard-snb:          [SKIP][57] ([fdo#109271]) -> [TIMEOUT][58] ([i915#1958]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@gem_ctx_engines@execute-one.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@gem_ctx_engines@execute-one.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][59] ([i915#1930]) -> [TIMEOUT][60] ([i915#1958])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][61] ([i915#1319] / [i915#1958]) -> [TIMEOUT][62] ([i915#1319])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl7/igt@kms_content_protection@lic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][63] ([i915#155]) -> [DMESG-WARN][64] ([i915#180])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][65] ([i915#1958]) -> [SKIP][66] ([fdo#109271]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_psr@primary_render:
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [TIMEOUT][68] ([i915#1958])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_psr@primary_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw8/igt@kms_psr@primary_render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2316]: https://gitlab.freedesktop.org/drm/intel/issues/2316
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5765 -> IGTPW_4868
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8862: 147f0d3f7239756494adef31518f87e60a970878 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4868: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html
  IGT_5765: 9f0977284d54ed37496260988dfcd6d2ad72dd1e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html

--===============5117840101714645421==
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
<tr><td><b>Series:</b></td><td>tests/i915: Remove subtests that rely on async relocation behavior</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80460/">https://patchwork.freedesktop.org/series/80460/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8862_full -&gt; IGTPW_4868_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4868_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/93">i915#93</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw6/igt@kms_flip@2x-flip-vs-fences-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_crtc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_lease@lease_invalid_crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw8/igt@kms_lease@lease_invalid_crtc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb4/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb6/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@perf@polling-parameterized.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@after-wait@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw5/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@multi-wait-for-submit-submitted-signaled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@syncobj_wait@multi-wait-for-submit-submitted-signaled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk5/igt@sysfs_preempt_timeout@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk9/igt@sysfs_preempt_timeout@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@feature_discovery@psr2}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-apl2/igt@gem_eio@kms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk7/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl4/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb7/igt@kms_psr@no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@init-wait@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@perf_pmu@init-wait@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2316">i915#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw1/igt@perf_pmu@init-wait@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw7/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted}:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw2/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@execute-one:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@gem_ctx_engines@execute-one.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@gem_ctx_engines@execute-one.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl7/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl6/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/shard-hsw8/igt@kms_psr@primary_render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5765 -&gt; IGTPW_4868</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8862: 147f0d3f7239756494adef31518f87e60a970878 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4868: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4868/index.html<br />
  IGT_5765: 9f0977284d54ed37496260988dfcd6d2ad72dd1e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5117840101714645421==--

--===============0649724654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0649724654==--
