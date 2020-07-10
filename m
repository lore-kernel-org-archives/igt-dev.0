Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jul 2020 14:07:41 -0000
Message-ID: <159439006125.20499.7558461410875681097@emeril.freedesktop.org>
References: <20200710121921.10928-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200710121921.10928-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUG9ydGlv?=
 =?utf-8?q?n_of_libdrm_removal_in_simple_tests_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Portion of libdrm removal in simple tests (rev2)
URL   : https://patchwork.freedesktop.org/series/79240/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8726_full -> IGTPW_4754_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4754_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4754_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4754_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@close-race:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-hsw2/igt@gem_mmap_gtt@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-hsw2/igt@gem_mmap_gtt@close-race.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  
Known issues
------------

  Here are the changes found in IGTPW_4754_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1958] / [i915#2119])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-iclb5/igt@gem_exec_endless@dispatch@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-iclb2/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk7/igt@gem_exec_whisper@basic-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk5/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@close-race:
    - shard-snb:          [PASS][11] -> [TIMEOUT][12] ([i915#1958] / [i915#2119])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-snb6/igt@gem_mmap_gtt@close-race.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-snb6/igt@gem_mmap_gtt@close-race.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#93] / [i915#95]) +42 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl6/igt@kms_addfb_basic@legacy-format.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl4/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#402]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb3/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#129] / [i915#1635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl4/igt@kms_color@pipe-b-ctm-green-to-red.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl7/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +34 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk7/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#1635] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#54] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#2122])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#79])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#1635] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#49])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_psr@cursor_mmap_cpu:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#668])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb2/igt@kms_psr@cursor_mmap_cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb2/igt@kms_psr@cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl2/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
    - shard-apl:          [PASS][49] -> [DMESG-WARN][50] ([i915#1635] / [i915#1982]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl2/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl8/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html

  * igt@perf@polling-small-buf:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#1722])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-iclb7/igt@perf@polling-small-buf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-iclb3/igt@perf@polling-small-buf.html

  
#### Possible fixes ####

  * igt@gem_partial_pwrite_pread@reads:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb3/igt@gem_partial_pwrite_pread@reads.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb2/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-hsw2/igt@gem_userptr_blits@create-destroy-sync.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-hsw5/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][57] ([i915#1515]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          [DMESG-WARN][59] ([i915#42]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-snb6/igt@i915_suspend@forcewake.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-snb1/igt@i915_suspend@forcewake.html
    - shard-kbl:          [INCOMPLETE][61] ([i915#155] / [i915#636]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl1/igt@i915_suspend@forcewake.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl6/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-FAIL][63] ([i915#1635] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [DMESG-FAIL][65] ([i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#95]) -> [PASS][68] +39 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl1/igt@kms_color@pipe-a-ctm-0-75.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][71] ([i915#1525]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][73] ([i915#64]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp1:
    - shard-kbl:          [DMESG-WARN][75] ([i915#165]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl2/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl2/igt@kms_flip@basic-flip-vs-dpms@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +6 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [INCOMPLETE][79] ([i915#1602] / [i915#1887] / [i915#456]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb6/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb5/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [DMESG-FAIL][83] ([fdo#108145] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [DMESG-FAIL][85] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [PASS][90] +44 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][91] ([i915#1820]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [INCOMPLETE][93] ([i915#409]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-hsw4/igt@prime_busy@hang-wait@bcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-apl:          [FAIL][95] ([i915#1930]) -> [FAIL][96] ([i915#1635] / [i915#1930])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl4/igt@gem_exec_reloc@basic-concurrent0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][97] ([i915#1930]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          [SKIP][99] ([fdo#109271] / [i915#1699]) -> [SKIP][100] ([fdo#109271] / [i915#1635] / [i915#1699]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl4/igt@gem_userptr_blits@process-exit-mmap@wb.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#658]) -> [SKIP][102] ([fdo#109271] / [i915#1635] / [i915#658])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][103] ([fdo#109271] / [fdo#111827]) -> [SKIP][104] ([fdo#109271] / [fdo#111827] / [i915#1635]) +80 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl1/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][105] ([fdo#110321] / [fdo#110336]) -> [FAIL][106] ([fdo#110321] / [fdo#110336] / [i915#1635]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][107] ([fdo#110321]) -> [FAIL][108] ([fdo#110321] / [i915#1635]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl3/igt@kms_content_protection@lic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          [FAIL][109] ([i915#2105]) -> [FAIL][110] ([i915#1635] / [i915#2105])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl1/igt@kms_content_protection@uevent.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-onscreen:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-hsw1/igt@kms_cursor_crc@pipe-d-cursor-64x21-onscreen.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-hsw2/igt@kms_cursor_crc@pipe-d-cursor-64x21-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958] / [i915#2119]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [FAIL][118] ([fdo#108145] / [i915#1635] / [i915#265]) +9 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#1635] / [i915#95])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          [FAIL][123] ([i915#265]) -> [DMESG-FAIL][124] ([i915#1635] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          [FAIL][125] ([i915#265]) -> [DMESG-FAIL][126] ([i915#95])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          [FAIL][127] ([i915#265]) -> [FAIL][128] ([i915#1635] / [i915#265])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][129] ([i915#31]) -> [FAIL][130] ([i915#1635] / [i915#31])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl6/igt@kms_setmode@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [FAIL][131] ([IGT#2]) -> [FAIL][132] ([IGT#2] / [i915#1635])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl7/igt@kms_sysfs_edid_timing.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl8/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          [SKIP][133] ([fdo#109271]) -> [SKIP][134] ([fdo#109271] / [i915#1635]) +808 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl4/igt@kms_vblank@pipe-d-ts-continuation-idle.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@perf@blocking-parameterized:
    - shard-apl:          [FAIL][135] ([i915#1542]) -> [FAIL][136] ([i915#1542] / [i915#1635])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl6/igt@perf@blocking-parameterized.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl1/igt@perf@blocking-parameterized.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][137], [FAIL][138]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][139] ([i915#1635] / [i915#2110])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-apl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([i915#2110] / [i915#2150]) -> [FAIL][145] ([i915#2110])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb8/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb2/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8726/shard-tglb6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1699]: https://gitlab.freedesktop.org/drm/intel/issues/1699
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2150]: https://gitlab.freedesktop.org/drm/intel/issues/2150
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#456]: https://gitl

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4754/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
