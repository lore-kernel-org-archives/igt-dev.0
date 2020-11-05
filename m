Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 05 Nov 2020 06:32:01 -0000
Message-ID: <160455792135.14957.13588110855349325776@emeril.freedesktop.org>
References: <20201105042851.19770-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20201105042851.19770-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkZWQg?=
 =?utf-8?q?test_description_for_test_case=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1314280733=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1314280733==
Content-Type: multipart/alternative;
 boundary="===============0479387830311428083=="

--===============0479387830311428083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added test description for test case.
URL   : https://patchwork.freedesktop.org/series/83519/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5833_full -> IGTPW_5132_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5132_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5132_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5132_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-glk:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
    - shard-snb:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@kms_flip@blocking-absolute-wf_vblank@c-dp1:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@kms_flip@blocking-absolute-wf_vblank@c-dp1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank@c-dp1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5132_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-apl:          [PASS][13] -> [SKIP][14] ([fdo#109271] / [i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@i915_pm_rpm@basic-pci-d3-state.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl2/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl1/igt@i915_pm_rpm@basic-pci-d3-state.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb3/igt@i915_pm_rpm@basic-pci-d3-state.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#1119])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#96])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-snb:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_flip@dpms-off-confusion@a-dp1:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@kms_flip@dpms-off-confusion@a-dp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@kms_flip@dpms-off-confusion@a-dp1.html

  * igt@kms_flip@modeset-vs-vblank-race@a-vga1:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw1/igt@kms_flip@modeset-vs-vblank-race@a-vga1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw1/igt@kms_flip@modeset-vs-vblank-race@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982]) +5 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-snb:          [PASS][35] -> [FAIL][36] ([i915#2546])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-none:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#1779])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_multiple@atomic-pipe-c-tiling-none.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@kms_plane_multiple@atomic-pipe-c-tiling-none.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@buffer-fill:
    - shard-hsw:          [PASS][41] -> [SKIP][42] ([fdo#109271]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw8/igt@perf@buffer-fill.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw7/igt@perf@buffer-fill.html
    - shard-kbl:          [PASS][43] -> [SKIP][44] ([fdo#109271] / [i915#1354])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl6/igt@perf@buffer-fill.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl3/igt@perf@buffer-fill.html
    - shard-tglb:         [PASS][45] -> [SKIP][46] ([i915#1354])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb8/igt@perf@buffer-fill.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb5/igt@perf@buffer-fill.html
    - shard-apl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1354] / [i915#1635])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl7/igt@perf@buffer-fill.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl8/igt@perf@buffer-fill.html
    - shard-glk:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk6/igt@perf@buffer-fill.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk7/igt@perf@buffer-fill.html
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([i915#1354])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb8/igt@perf@buffer-fill.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb6/igt@perf@buffer-fill.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-wakeup:
    - shard-kbl:          [INCOMPLETE][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@drm_read@short-buffer-wakeup.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@drm_read@short-buffer-wakeup.html

  * igt@gem_caching@writes:
    - shard-snb:          [INCOMPLETE][55] ([i915#82]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_caching@writes.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@gem_caching@writes.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][57] ([i915#454]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][59] ([i915#2521]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html
    - shard-apl:          [FAIL][61] ([i915#1635] / [i915#2521]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-hsw:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][67] ([i915#2598]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - shard-snb:          [DMESG-WARN][69] ([i915#42]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb4/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-snb:          [FAIL][73] ([i915#2546]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][75] ([i915#433]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-256:
    - shard-apl:          [DMESG-WARN][77] ([i915#1635] / [i915#1982]) -> [PASS][78] +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl2/igt@kms_plane_cursor@pipe-b-overlay-size-256.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl8/igt@kms_plane_cursor@pipe-b-overlay-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-glk:          [FAIL][79] ([i915#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-none.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-glk:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [SKIP][85] ([fdo#109271] / [i915#1354]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk6/igt@perf@polling-parameterized.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@perf@polling-parameterized.html
    - shard-iclb:         [SKIP][87] ([i915#1354]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@perf@polling-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb2/igt@perf@polling-parameterized.html

  * igt@perf@polling-small-buf:
    - shard-tglb:         [SKIP][89] ([i915#1354]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@perf@polling-small-buf.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb7/igt@perf@polling-small-buf.html
    - shard-apl:          [SKIP][91] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl2/igt@perf@polling-small-buf.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl7/igt@perf@polling-small-buf.html
    - shard-kbl:          [SKIP][93] ([fdo#109271] / [i915#1354]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@perf@polling-small-buf.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl7/igt@perf@polling-small-buf.html
    - shard-hsw:          [SKIP][95] ([fdo#109271]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw1/igt@perf@polling-small-buf.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw4/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [SKIP][98] ([i915#579])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb3/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1226]) -> [SKIP][100] ([fdo#109349])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          [FAIL][101] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][102] ([fdo#108145] / [i915#1982])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1779]: https://gitlab.freedesktop.org/drm/intel/issues/1779
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5833 -> IGTPW_5132

  CI-20190529: 20190529
  CI_DRM_9265: 4152d4ab08d937cfb9254d0e880f1daea64db549 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html
  IGT_5833: 212e55b9aa9e98a3ef63f37a50fd5b69761fbecd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html

--===============0479387830311428083==
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
<tr><td><b>Series:</b></td><td>Added test description for test case.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83519/">https://patchwork.freedesktop.org/series/83519/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5833_full -&gt; IGTPW_5132_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5132_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5132_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5132_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk2/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk7/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb5/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@kms_flip@blocking-absolute-wf_vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank@c-dp1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5132_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl2/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl1/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb3/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb4/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk1/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl1/igt@kms_flip@dpms-off-confusion@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@kms_flip@dpms-off-confusion@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw1/igt@kms_flip@modeset-vs-vblank-race@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw1/igt@kms_flip@modeset-vs-vblank-race@a-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-none:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_multiple@atomic-pipe-c-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk5/igt@kms_plane_multiple@atomic-pipe-c-tiling-none.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1779">i915#1779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw8/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw7/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl6/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl3/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb8/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb5/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl7/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl8/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk6/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk7/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb8/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb6/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-wakeup:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@drm_read@short-buffer-wakeup.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl2/igt@drm_read@short-buffer-wakeup.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@gem_caching@writes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb7/igt@gem_caching@writes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk8/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl8/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl1/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb2/igt@kms_flip@flip-vs-suspend@b-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/42">i915#42</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb4/igt@kms_flip@flip-vs-suspend@b-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-overlay-size-256:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl2/igt@kms_plane_cursor@pipe-b-overlay-size-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl8/igt@kms_plane_cursor@pipe-b-overlay-size-256.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-none.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/899">i915#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk4/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk6/igt@perf@polling-parameterized.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk3/igt@perf@polling-parameterized.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb6/igt@perf@polling-parameterized.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb5/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb7/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-apl2/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-apl7/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-kbl2/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-kbl7/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-hsw1/igt@perf@polling-small-buf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-hsw4/igt@perf@polling-small-buf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-tglb2/igt@i915_pm_rpm@basic-pci-d3-state.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-tglb3/igt@i915_pm_rpm@basic-pci-d3-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-iclb8/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5833/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
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
<li>IGT: IGT_5833 -&gt; IGTPW_5132</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9265: 4152d4ab08d937cfb9254d0e880f1daea64db549 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5132: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5132/index.html<br />
  IGT_5833: 212e55b9aa9e98a3ef63f37a50fd5b69761fbecd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============0479387830311428083==--

--===============1314280733==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1314280733==--
