Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Sep 2020 08:47:55 -0000
Message-ID: <160041887518.6345.5495761937741577241@emeril.freedesktop.org>
References: <20200918064318.2143-1-karthik.b.s@intel.com>
In-Reply-To: <20200918064318.2143-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Add_test_to_validate_asynchronous_flips_?=
 =?utf-8?b?KHJldjYp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0025489319=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0025489319==
Content-Type: multipart/alternative;
 boundary="===============8849613718020235192=="

--===============8849613718020235192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Add test to validate asynchronous flips (rev6)
URL   : https://patchwork.freedesktop.org/series/79701/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9023_full -> IGTPW_4997_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4997_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_async_flips@invalid-async-flip} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb6/igt@kms_async_flips@invalid-async-flip.html

  * {igt@kms_async_flips@test-cursor} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_async_flips@test-cursor.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9023_full and IGTPW_4997_full:

### New IGT tests (5) ###

  * igt@kms_async_flips@alternate-sync-async-flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@invalid-async-flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@test-cursor:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_async_flips@test-time-stamp:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4997_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1958] / [i915#2270])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@gem_exec_endless@dispatch@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-hsw:          [PASS][7] -> [INCOMPLETE][8] ([i915#151])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#541])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#1635] / [i915#54])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw6/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-wait-idle:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@kms_vblank@pipe-b-wait-idle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html

  * igt@prime_vgem@sync@vcs1:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#409])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@prime_vgem@sync@vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@prime_vgem@sync@vcs1.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotunbind-rebind}:
    - shard-iclb:         [DMESG-WARN][25] ([i915#1982]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb1/igt@core_hotunplug@hotunbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][27] ([i915#1436] / [i915#716]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-hsw:          [INCOMPLETE][31] ([CI#80]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][33] ([i915#96]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][35] ([i915#1982]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw5/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][37] ([i915#2122]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-iclb:         [INCOMPLETE][39] ([i915#2357]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb2/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][43] ([i915#1982]) -> [PASS][44] +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][45] ([fdo#109642] / [fdo#111068]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb3/igt@kms_psr2_su@page_flip.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][47] ([fdo#109441]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-apl:          [DMESG-WARN][49] ([i915#1635] / [i915#1982]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl8/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@perf@polling-parameterized:
    - shard-kbl:          [FAIL][51] ([i915#1542]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@perf@polling-parameterized.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [DMESG-WARN][53] ([i915#2411]) -> [SKIP][54] ([i915#1904])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][55] ([i915#454]) -> [FAIL][56] ([i915#1899])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][57] ([i915#1319] / [i915#1635] / [i915#1958]) -> [TIMEOUT][58] ([i915#1319] / [i915#1635])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl4/igt@kms_content_protection@legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][59] ([i915#1319] / [i915#1635] / [i915#1958]) -> [FAIL][60] ([fdo#110321] / [i915#1635])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl6/igt@kms_content_protection@lic.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [DMESG-WARN][61] ([i915#2411]) -> [INCOMPLETE][62] ([i915#1436] / [i915#1982])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2270]: https://gitlab.freedesktop.org/drm/intel/issues/2270
  [i915#2357]: https://gitlab.freedesktop.org/drm/intel/issues/2357
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#541]: https://gitlab.freedesktop.org/drm/intel/issues/541
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5787 -> IGTPW_4997
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9023: 5887fa2d8b9b7f6a278f9a1bc8642cb9d5d0279a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html

--===============8849613718020235192==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Add test to validate asynchronous flips (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79701/">https://patchwork.freedesktop.org/series/79701/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9023_full -&gt; IGTPW_4997_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4997_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_async_flips@invalid-async-flip} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-cursor} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_async_flips@test-cursor.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9023_full and IGTPW_4997_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4997_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2270">i915#2270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl7/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/151">i915#151</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-glk3/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/541">i915#541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw6/igt@kms_flip@2x-flip-vs-wf_vblank@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@kms_vblank@pipe-b-wait-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl3/igt@kms_vblank@pipe-b-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@prime_vgem@sync@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb8/igt@prime_vgem@sync@vcs1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/409">i915#409</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotunbind-rebind}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb1/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb8/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl1/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw7/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-hsw6/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-hsw5/igt@kms_flip@2x-dpms-vs-vblank-race@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb2/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2357">i915#2357</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb3/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl8/igt@kms_vblank@pipe-c-query-forked-hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-kbl2/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-kbl6/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb7/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl4/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl7/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-apl4/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9023/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
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
<li>IGT: IGT_5787 -&gt; IGTPW_4997</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9023: 5887fa2d8b9b7f6a278f9a1bc8642cb9d5d0279a @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4997: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4997/index.html<br />
  IGT_5787: 0ec962017c8131de14e0cb038f7f76b1f17ed637 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8849613718020235192==--

--===============0025489319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0025489319==--
