Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 Aug 2020 13:51:47 -0000
Message-ID: <159706750746.17062.2548005519787358906@emeril.freedesktop.org>
References: <20200810110617.2655-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200810110617.2655-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fmmap=5Foffset=3A_check_coherency_with_GEM=5FMMAP=5FOFFSET?=
 =?utf-8?q?_on_!llc?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1561675258=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1561675258==
Content-Type: multipart/alternative;
 boundary="===============4102051208374946352=="

--===============4102051208374946352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_mmap_offset: check coherency with GEM_MMAP_OFFSET on !llc
URL   : https://patchwork.freedesktop.org/series/80466/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8862_full -> IGTPW_4870_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8862_full and IGTPW_4870_full:

### New IGT tests (1) ###

  * igt@gem_mmap_offset@blt-coherency:
    - Statuses : 2 timeout(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4870_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [PASS][1] -> [FAIL][2] ([i915#2079])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@gem_exec_balancer@bonded-early.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl1/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk7/igt@gem_exec_whisper@basic-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk7/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@big-bo-tiledy:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb4/igt@gem_mmap_gtt@big-bo-tiledy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb2/igt@gem_mmap_gtt@big-bo-tiledy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#1635] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][11] -> [WARN][12] ([i915#1519])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-hsw:          [PASS][13] -> [TIMEOUT][14] ([i915#1958]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109441]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#1982]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@kms_vblank@pipe-b-query-idle-hang.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl7/igt@kms_vblank@pipe-b-query-idle-hang.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk2/igt@perf@invalid-oa-metric-set-id.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk4/igt@perf@invalid-oa-metric-set-id.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@perf_pmu@module-unload.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb5/igt@perf_pmu@module-unload.html

  * igt@prime_busy@after@rcs0:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#2258])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@after@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@prime_busy@after@rcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][29] ([i915#180]) -> [PASS][30] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_eio@kms:
    - shard-apl:          [DMESG-WARN][31] ([i915#1635] / [i915#1982]) -> [PASS][32] +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gem_eio@kms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl1/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][33] ([i915#118] / [i915#95]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][35] ([i915#155]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:
    - shard-glk:          [DMESG-WARN][37] ([i915#1982]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][39] ([i915#57]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][45] ([i915#1982]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
    - shard-iclb:         [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][49] ([i915#173]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@no_drrs.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb3/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][51] ([fdo#109441]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb5/igt@kms_psr@psr2_basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][53] ([i915#31]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-wait@vecs0:
    - shard-hsw:          [DMESG-WARN][55] ([i915#2316]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@perf_pmu@init-wait@vecs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw4/igt@perf_pmu@init-wait@vecs0.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [FAIL][57] ([i915#2258]) -> [PASS][58] +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@prime_busy@hang-wait@bcs0.html

  * {igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted}:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][61] ([i915#1930]) -> [TIMEOUT][62] ([i915#1958])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][63] ([i915#2036]) -> [WARN][64] ([i915#2021])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][65] ([i915#1958]) -> [SKIP][66] ([fdo#109271]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2316]: https://gitlab.freedesktop.org/drm/intel/issues/2316
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5765 -> IGTPW_4870
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8862: 147f0d3f7239756494adef31518f87e60a970878 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4870: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html
  IGT_5765: 9f0977284d54ed37496260988dfcd6d2ad72dd1e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html

--===============4102051208374946352==
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
<tr><td><b>Series:</b></td><td>tests/gem_mmap_offset: check coherency with GEM_MMAP_OFFSET on !llc</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80466/">https://patchwork.freedesktop.org/series/80466/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8862_full -&gt; IGTPW_4870_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8862_full and IGTPW_4870_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_mmap_offset@blt-coherency:<ul>
<li>Statuses : 2 timeout(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4870_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@bonded-early:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@gem_exec_balancer@bonded-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl1/igt@gem_exec_balancer@bonded-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2079">i915#2079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk7/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk7/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-bo-tiledy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb4/igt@gem_mmap_gtt@big-bo-tiledy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb2/igt@gem_mmap_gtt@big-bo-tiledy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-idle-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@kms_vblank@pipe-b-query-idle-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl7/igt@kms_vblank@pipe-b-query-idle-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk2/igt@perf@invalid-oa-metric-set-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk4/igt@perf@invalid-oa-metric-set-id.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb5/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@after@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@after@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@prime_busy@after@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-apl4/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-apl1/igt@gem_eio@kms.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-glk4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw2/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl1/igt@kms_flip@modeset-vs-vblank-race-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb3/igt@kms_psr@no_drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-iclb5/igt@kms_psr@psr2_basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-kbl4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-kbl6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@init-wait@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@perf_pmu@init-wait@vecs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2316">i915#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw4/igt@perf_pmu@init-wait@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw5/igt@prime_busy@hang-wait@bcs0.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted}:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw6/igt@syncobj_timeline@invalid-multi-wait-unsubmitted-submitted.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-spin-others@vcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2036">i915#2036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2021">i915#2021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8862/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
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
<li>IGT: IGT_5765 -&gt; IGTPW_4870</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8862: 147f0d3f7239756494adef31518f87e60a970878 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4870: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4870/index.html<br />
  IGT_5765: 9f0977284d54ed37496260988dfcd6d2ad72dd1e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4102051208374946352==--

--===============1561675258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1561675258==--
