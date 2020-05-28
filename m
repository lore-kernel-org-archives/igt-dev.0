Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 16:32:25 -0000
Message-ID: <159068354581.685.3520844937001037355@emeril.freedesktop.org>
References: <20200528133835.5087-1-rohan.garg@collabora.com>
In-Reply-To: <20200528133835.5087-1-rohan.garg@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcGFuZnJv?=
 =?utf-8?q?st=3A_Test_labeling_functionality?=
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
To: Rohan Garg <rohan.garg@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: panfrost: Test labeling functionality
URL   : https://patchwork.freedesktop.org/series/77742/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8547_full -> IGTPW_4619_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4619_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4619_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4619_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-gtt:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk7/igt@gem_exec_reloc@basic-gtt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk9/igt@gem_exec_reloc@basic-gtt.html

  
#### Warnings ####

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-glk:          [FAIL][3] ([fdo#108145] / [i915#265]) -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  
Known issues
------------

  Here are the changes found in IGTPW_4619_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#54] / [i915#93] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#52] / [i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#699] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#83])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb7/igt@kms_panel_fitting@atomic-fastset.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#83])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#53] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#53] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#265] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#1559] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#1559] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_plane_cursor@pipe-c-primary-size-256:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#1927] / [i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-hsw7/igt@kms_plane_cursor@pipe-c-primary-size-256.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-hsw2/igt@kms_plane_cursor@pipe-c-primary-size-256.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155] / [i915#794])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf@blocking:
    - shard-hsw:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-hsw4/igt@perf@blocking.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-hsw4/igt@perf@blocking.html
    - shard-glk:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk1/igt@perf@blocking.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk8/igt@perf@blocking.html
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#405])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb5/igt@perf@blocking.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-tglb6/igt@perf@blocking.html
    - shard-apl:          [PASS][45] -> [SKIP][46] ([fdo#109271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl3/igt@perf@blocking.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl3/igt@perf@blocking.html
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([i915#405])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb1/igt@perf@blocking.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb8/igt@perf@blocking.html
    - shard-kbl:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@perf@blocking.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl2/igt@perf@blocking.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-apl:          [TIMEOUT][51] ([i915#1635]) -> [PASS][52] +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl4/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][53] ([i915#1436] / [i915#716]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][55] ([i915#1904]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][57] ([i915#1899]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][59] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][61] ([i915#1119] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [FAIL][63] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [FAIL][65] ([fdo#108145] / [i915#71] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [FAIL][67] ([fdo#108145] / [i915#71] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl4/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][69] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [FAIL][73] ([i915#54]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][77] ([i915#61]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-hsw1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-hsw8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][85] ([i915#155]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][87] ([i915#1911]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-tglb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@i915-ref-count:
    - shard-iclb:         [SKIP][91] ([i915#405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb8/igt@perf@i915-ref-count.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-iclb4/igt@perf@i915-ref-count.html
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@perf@i915-ref-count.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl6/igt@perf@i915-ref-count.html
    - shard-apl:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@perf@i915-ref-count.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@perf@i915-ref-count.html
    - shard-glk:          [SKIP][97] ([fdo#109271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk6/igt@perf@i915-ref-count.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-glk1/igt@perf@i915-ref-count.html
    - shard-tglb:         [SKIP][99] ([i915#405]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb5/igt@perf@i915-ref-count.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-tglb6/igt@perf@i915-ref-count.html

  
#### Warnings ####

  * igt@kms_content_protection@legacy:
    - shard-apl:          [TIMEOUT][101] ([i915#1319] / [i915#1635]) -> [DMESG-FAIL][102] ([fdo#110321])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@kms_content_protection@legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][103] ([i915#1319] / [i915#1635]) -> [TIMEOUT][104] ([i915#1319])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@kms_content_protection@srm.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][105] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][106] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][107] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][108] ([fdo#108145] / [i915#265]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][109] ([fdo#108145] / [i915#265]) -> [FAIL][110] ([fdo#108145] / [i915#265] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][111] ([fdo#108145] / [i915#265]) -> [FAIL][112] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5682 -> IGTPW_4619
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8547: 055c59085e117a2433d3862d645e049e30f3a2dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4619: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html
  IGT_5682: e5371a99a877be134c6ad5361a5f03843a66f775 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4619/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
