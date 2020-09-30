Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 30 Sep 2020 12:45:23 -0000
Message-ID: <160146992346.17418.1481137907938187916@emeril.freedesktop.org>
References: <20200929211238.2220951-1-matthew.d.roper@intel.com>
In-Reply-To: <20200929211238.2220951-1-matthew.d.roper@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgZHJtLXVh?=
 =?utf-8?q?pi=3A_Re-synchronize_drm=5Ffourcc=2Eh_with_kernel?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0361530109=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0361530109==
Content-Type: multipart/alternative;
 boundary="===============5435589525972075178=="

--===============5435589525972075178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm-uapi: Re-synchronize drm_fourcc.h with kernel
URL   : https://patchwork.freedesktop.org/series/82226/
State : success

== Summary ==

CI Bug Log - changes from IGT_5793_full -> IGTPW_5025_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html

Known issues
------------

  Here are the changes found in IGTPW_5025_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2] ([i915#1635])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl6/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl2/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][3] -> [INCOMPLETE][4] ([i915#1635] / [i915#2278])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl3/igt@i915_selftest@mock@contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl4/igt@i915_selftest@mock@contexts.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][5] -> [FAIL][6] ([i915#96])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#2370])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2122]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#49])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([i915#155])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#1911])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb8/igt@kms_psr2_su@frontbuffer.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1635] / [i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl2/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf@polling:
    - shard-glk:          [PASS][31] -> [SKIP][32] ([fdo#109271])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk7/igt@perf@polling.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk8/igt@perf@polling.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#405])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb7/igt@perf@polling.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb2/igt@perf@polling.html
    - shard-kbl:          [PASS][35] -> [SKIP][36] ([fdo#109271])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl3/igt@perf@polling.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl6/igt@perf@polling.html
    - shard-hsw:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw6/igt@perf@polling.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw1/igt@perf@polling.html
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([i915#405])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@perf@polling.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb7/igt@perf@polling.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-kbl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:
    - shard-glk:          [DMESG-WARN][45] ([i915#1982]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk3/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][47] ([i915#2122]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         [DMESG-WARN][49] ([i915#1982]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [FAIL][51] ([i915#49]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][57] ([i915#83]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [DMESG-WARN][59] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [DMESG-WARN][60] ([i915#2411])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb3/igt@gem_eio@in-flight-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb7/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][61] ([i915#454]) -> [FAIL][62] ([i915#1899])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [FAIL][63] ([i915#454]) -> [FAIL][64] ([i915#1899])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][65] ([i915#1319] / [i915#1635] / [i915#1958]) -> [FAIL][66] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][67] ([fdo#110321] / [i915#1635]) -> [TIMEOUT][68] ([i915#1319] / [i915#1635] / [i915#1958])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl1/igt@kms_content_protection@lic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl1/igt@kms_content_protection@lic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2469]: https://gitlab.freedesktop.org/drm/intel/issues/2469
  [i915#2476]: https://gitlab.freedesktop.org/drm/intel/issues/2476
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5793 -> IGTPW_5025

  CI-20190529: 20190529
  CI_DRM_9075: fd24361b2b76956b5c056bc430a4c77edecb7744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5025: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html
  IGT_5793: c34792447c9fc4d05dd75873cdb99d9ffe57ea23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html

--===============5435589525972075178==
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
<tr><td><b>Series:</b></td><td>drm-uapi: Re-synchronize drm_fourcc.h with kernel</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82226/">https://patchwork.freedesktop.org/series/82226/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5793_full -&gt; IGTPW_5025_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5025_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl6/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl3/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl4/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk3/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl3/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb8/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk7/igt@perf@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk8/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb7/igt@perf@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb2/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl3/igt@perf@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl6/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-hsw6/igt@perf@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-hsw1/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@perf@polling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb7/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk2/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl4/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk3/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk7/igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb3/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb7/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-tglb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl8/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=110336">fdo#110336</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5793/shard-apl1/igt@kms_content_protection@lic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110321">fdo#110321</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5793 -&gt; IGTPW_5025</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9075: fd24361b2b76956b5c056bc430a4c77edecb7744 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5025: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5025/index.html<br />
  IGT_5793: c34792447c9fc4d05dd75873cdb99d9ffe57ea23 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============5435589525972075178==--

--===============0361530109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0361530109==--
