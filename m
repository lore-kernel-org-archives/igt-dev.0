Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jul 2020 16:05:24 -0000
Message-ID: <159474272497.24020.5127382927279699317@emeril.freedesktop.org>
References: <20200714123644.447934-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200714123644.447934-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX3dz?=
 =?utf-8?q?im=3A_Use_CTX=5FTIMESTAMP_for_timed_spinners?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1483090404=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1483090404==
Content-Type: multipart/alternative;
 boundary="===============1394833862080127427=="

--===============1394833862080127427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_wsim: Use CTX_TIMESTAMP for timed spinners
URL   : https://patchwork.freedesktop.org/series/79472/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8744_full -> IGTPW_4762_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4762_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4762_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4762_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb6/igt@kms_dp_aux_dev.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb7/igt@kms_dp_aux_dev.html

  
Known issues
------------

  Here are the changes found in IGTPW_4762_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@unwedge-stress:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw7/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw7/igt@gem_eio@unwedge-stress.html

  * igt@gem_eio@wait-wedge-10ms:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1635] / [i915#95]) +30 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl1/igt@gem_eio@wait-wedge-10ms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl7/igt@gem_eio@wait-wedge-10ms.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#1436] / [i915#1635] / [i915#716])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][9] -> [DMESG-FAIL][10] ([i915#118] / [i915#95])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#1635] / [i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#1635] / [i915#95]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl1/igt@kms_draw_crc@fill-fb.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][19] -> [INCOMPLETE][20] ([i915#2055])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#668]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#93] / [i915#95]) +36 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb8/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#1542])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb1/igt@perf@blocking-parameterized.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb1/igt@perf@blocking-parameterized.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#1542])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb8/igt@perf@polling-parameterized.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb1/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [DMESG-WARN][41] ([i915#1635] / [i915#95]) -> [PASS][42] +33 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl4/igt@gem_exec_fence@syncobj-unused-fence.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl8/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#1436] / [i915#716]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-glk3/igt@gen9_exec_parse@allowed-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#454]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][49] ([i915#118] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][51] ([i915#93] / [i915#95]) -> [PASS][52] +44 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][53] ([i915#54] / [i915#95]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [FAIL][59] ([i915#247]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl3/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [FAIL][61] ([i915#1635] / [i915#247]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl3/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][63] ([i915#1635] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [DMESG-FAIL][65] ([i915#95]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][69] ([i915#31]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl4/igt@kms_setmode@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-hsw:          [TIMEOUT][71] ([i915#1958] / [i915#2119]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw2/igt@kms_vblank@pipe-a-query-busy-hang.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw7/igt@kms_vblank@pipe-a-query-busy-hang.html
    - shard-snb:          [TIMEOUT][73] ([i915#1958] / [i915#2119]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-snb1/igt@kms_vblank@pipe-a-query-busy-hang.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-snb1/igt@kms_vblank@pipe-a-query-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][75] ([i915#1185]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@testdisplay:
    - shard-kbl:          [TIMEOUT][77] ([i915#1692] / [i915#1958] / [i915#2119]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl2/igt@testdisplay.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl7/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_exec_balancer@full-late:
    - shard-hsw:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958] / [i915#2119]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw7/igt@gem_exec_balancer@full-late.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw2/igt@gem_exec_balancer@full-late.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-hsw:          [INCOMPLETE][81] ([i915#1958]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw2/igt@gen9_exec_parse@bb-start-far.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw7/igt@gen9_exec_parse@bb-start-far.html
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-snb1/igt@gen9_exec_parse@bb-start-far.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-snb6/igt@gen9_exec_parse@bb-start-far.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][85] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][86] ([i915#1319] / [i915#2119])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl6/igt@kms_content_protection@lic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][87] ([i915#2105]) -> [DMESG-FAIL][88] ([i915#95])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl7/igt@kms_content_protection@uevent.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#2105]) -> [DMESG-FAIL][90] ([i915#1635] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl2/igt@kms_content_protection@uevent.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958] / [i915#2119]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [DMESG-WARN][93] ([i915#1982]) -> [SKIP][94] ([i915#668])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][95] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][96] ([fdo#108145] / [i915#1635] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][97] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][98] ([fdo#108145] / [i915#1635] / [i915#265])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [DMESG-FAIL][99] ([fdo#108145] / [i915#95]) -> [FAIL][100] ([fdo#108145] / [i915#265])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          [FAIL][101] ([i915#265]) -> [DMESG-FAIL][102] ([i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-hsw:          [TIMEOUT][103] ([i915#1958] / [i915#2119]) -> [SKIP][104] ([fdo#109271]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-hsw2/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
    - shard-snb:          [TIMEOUT][105] ([i915#1958] / [i915#2119]) -> [SKIP][106] ([fdo#109271]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-snb1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-snb1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][107], [FAIL][108]) ([i915#1610] / [i915#1635] / [i915#2110]) -> ([FAIL][109], [FAIL][110]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl4/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl8/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5735 -> IGTPW_4762
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8744: beb1c0b42c5368a48e782e5556be95c8332d28c6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/index.html
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/index.html

--===============1394833862080127427==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>gem_wsim: Use CTX_TIMESTAMP for timed spinne=
rs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79472/">https://patchwork.freedesktop.org/series/79472/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4762/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4762/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8744_full -&gt; IGTPW_4762_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4762_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_4762_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4762=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_dp_aux_dev:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb6/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb7/igt@kms_dp=
_aux_dev.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4762_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-hsw7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-hsw7/igt@=
gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@wait-wedge-10ms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl1/igt@gem_eio@wait-wedge-10ms.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl7/igt=
@gem_eio@wait-wedge-10ms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +30 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl7/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shar=
d-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4762/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-glk8/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4762/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-unti=
led.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4762/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-unti=
led.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/54">i915#54</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl1/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@km=
s_draw_crc@fill-fb.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/sha=
rd-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrac=
k.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4762/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_4762/shard-tglb1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/668">i915#668</a>) +5 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl4/=
igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/93">i915#93</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +36 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-256:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
62/shard-kbl3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#9=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb8/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-=
clamping.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4762/shard-iclb2/igt@kms_plane_scaling@pipe-a-scaler-with-clip=
ping-clamping.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
762/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i91=
5#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4762/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4762/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/402">i915#402</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb1/igt@perf@blocking-parameterized.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-icl=
b1/igt@perf@blocking-parameterized.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb8/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-tglb=
1/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@syncobj-unused-fence:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl4/igt@gem_exec_fence@syncobj-unused-fence.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4762/shard-apl8/igt@gem_exec_fence@syncobj-unused-fence.html">PASS</=
a> +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority-all.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4762/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-=
all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-glk3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#14=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i9=
15#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4762/shard-glk7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-iclb5/ig=
t@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4762/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/93">i915=
#93</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i9=
15#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4762/shard-kbl4/igt@kms_color@pipe-a-ctm-blue-to-red.html">PASS</a> +44 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.htm=
l">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/54">i915#54</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4762/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.=
html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4762/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-=
gtt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4762/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb56=
5-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-kbl3/igt@kms_plane@plane-position-covered-pipe-b-planes.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
47">i915#247</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4762/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.h=
tml">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/247">i915#247</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4762/shard-apl3/igt@kms_plane@plane-position-covered-pipe-b-pl=
anes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-viewport-size-128:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4762/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.h=
tml">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4762/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html">P=
ASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard=
-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl4/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-kbl1/igt@kms=
_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-busy-hang:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-hsw2/igt@kms_vblank@pipe-a-query-busy-hang.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#=
1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119"=
>i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4762/shard-hsw7/igt@kms_vblank@pipe-a-query-busy-hang.html">PASS</a></=
p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-snb1/igt@kms_vblank@pipe-a-query-busy-hang.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#=
1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119"=
>i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4762/shard-snb1/igt@kms_vblank@pipe-a-query-busy-hang.html">PASS</a></=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4762/shard-iclb6/igt@kms_vblank@pipe-c-ts-continuation-dpm=
s-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl2/igt@testdisplay.html">TIMEOUT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1692">i915#1692</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard=
-kbl7/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@full-late:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-hsw7/igt@gem_exec_balancer@full-late.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/sh=
ard-hsw2/igt@gem_exec_balancer@full-late.html">TIMEOUT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-hsw2/igt@gen9_exec_parse@bb-start-far.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#19=
58</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_476=
2/shard-hsw7/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-snb1/igt@gen9_exec_parse@bb-start-far.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/sh=
ard-snb6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl6/igt@kms_content_protection@lic.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#=
1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119"=
>i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4762/shard-kbl6/igt@kms_content_protection@lic.html">TIMEOUT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#211=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-kbl7/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2105</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/sha=
rd-kbl4/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">i915#2=
105</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
62/shard-apl8/igt@kms_content_protection@uevent.html">DMESG-FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-sh=
rfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_4762/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2=
p-scndscrn-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-mult=
idraw.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4762/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-=
pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/668">i915#668</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.ht=
ml">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108=
145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4762/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.htm=
l">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-al=
pha-opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.htm=
l">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4762/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-op=
aque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8744/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-=
fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4762/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transpare=
nt-fb.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-overlay-size-128:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-hsw2/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">T=
IMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958=
">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4762/shard-hsw7/igt@kms_plane_cursor@pipe-d-overlay-size-128.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8744/shard-snb1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html">T=
IMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958=
">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4762/shard-snb1/igt@kms_plane_cursor@pipe-d-overlay-size-128.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_8744/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8744/shard-apl4/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2110">i915#2110</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_4762/shard-apl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/shard-ap=
l8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5735 -&gt; IGTPW_4762</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8744: beb1c0b42c5368a48e782e5556be95c8332d28c6 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4762: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4762/index.htm=
l<br />
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1394833862080127427==--

--===============1483090404==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1483090404==--
