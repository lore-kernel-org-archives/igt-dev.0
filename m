Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 11 Aug 2020 12:13:24 -0000
Message-ID: <159714800470.3767.15908684414566438192@emeril.freedesktop.org>
References: <20200811093241.19910-1-guillaume.tucker@collabora.com>
In-Reply-To: <20200811093241.19910-1-guillaume.tucker@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRG9ja2Vy?=
 =?utf-8?q?file=2Ebuild-debian-mips=3A_use_buster_with_libunwind_fix?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0767930328=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0767930328==
Content-Type: multipart/alternative;
 boundary="===============8900942963880796111=="

--===============8900942963880796111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Dockerfile.build-debian-mips: use buster with libunwind fix
URL   : https://patchwork.freedesktop.org/series/80523/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8868_full -> IGTPW_4874_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4874_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4874_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4874_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-hsw:          [SKIP][1] ([fdo#109271]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4874_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#1622])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb6/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#1904])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_atomic_interruptible@atomic-setmode.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw6/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#79])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_flip_tiling@flip-y-tiled:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl2/igt@kms_flip_tiling@flip-y-tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl3/igt@kms_flip_tiling@flip-y-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk5/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#83])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#83])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#173])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb3/igt@kms_psr@no_drrs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][33] -> [INCOMPLETE][34] ([i915#1602] / [i915#1887] / [i915#456])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb6/igt@kms_psr@psr2_suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl3/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-snb:          [PASS][39] -> [SKIP][40] ([fdo#109271])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@prime_busy@hang-wait@bcs0:
    - shard-hsw:          [PASS][41] -> [FAIL][42] ([i915#2258]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][43] ([i915#1930]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk9/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][47] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][49] ([i915#118] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][51] ([i915#96]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-apl:          [TIMEOUT][53] ([i915#1635] / [i915#1958]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +11 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_event_leak:
    - shard-snb:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58] +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@kms_flip_event_leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@kms_flip_event_leak.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][59] ([i915#49]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][61] ([i915#49]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][63] ([i915#1635] / [i915#49]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][67] ([i915#433]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-glk:          [FAIL][73] ([i915#31]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk8/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][75] ([i915#155]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@prime_busy@after-wait@vcs0:
    - shard-hsw:          [FAIL][77] ([i915#2258]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw6/igt@prime_busy@after-wait@vcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@prime_busy@after-wait@vcs0.html

  * igt@syncobj_wait@invalid-signal-illegal-handle:
    - shard-hsw:          [TIMEOUT][79] ([i915#1958]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@syncobj_wait@invalid-signal-illegal-handle.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@syncobj_wait@invalid-signal-illegal-handle.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][81] ([i915#1958]) -> [FAIL][82] ([i915#1930])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-apl:          [TIMEOUT][83] ([i915#1635] / [i915#1958]) -> [INCOMPLETE][84] ([i915#1635] / [i915#1958])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][85] ([i915#1899]) -> [FAIL][86] ([i915#454])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-iclb:         [DMESG-FAIL][87] ([i915#1149] / [i915#1226]) -> [FAIL][88] ([i915#1149] / [i915#315])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb1/igt@kms_color@pipe-a-ctm-0-75.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb2/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][89] ([i915#1226]) -> [SKIP][90] ([fdo#109349])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958]) -> [SKIP][92] ([fdo#109271]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-snb:          [TIMEOUT][93] ([i915#1958]) -> [SKIP][94] ([fdo#109271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
    - shard-apl:          [TIMEOUT][95] ([i915#1635] / [i915#1958]) -> [SKIP][96] ([fdo#109271] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1622]: https://gitlab.freedesktop.org/drm/intel/issues/1622
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5766 -> IGTPW_4874
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8868: 8013d0a5f31046f2be4ea965ec59c70b39c54186 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4874: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html
  IGT_5766: fc9f95086fc23f7f2226f7603241fbad3a214ee1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html

--===============8900942963880796111==
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
<tr><td><b>Series:</b></td><td>Dockerfile.build-debian-mips: use buster with libunwind fix</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80523/">https://patchwork.freedesktop.org/series/80523/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8868_full -&gt; IGTPW_4874_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_4874_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4874_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4874_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_big_fb@y-tiled-16bpp-rotate-0:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw7/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw6/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4874_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@gem_ctx_persistence@engines-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb6/igt@gem_ctx_persistence@engines-hang@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1622">i915#1622</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk4/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1904">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_atomic_interruptible@atomic-setmode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw6/igt@kms_atomic_interruptible@atomic-setmode.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-64x64-offscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/72">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-y-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl2/igt@kms_flip_tiling@flip-y-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl3/igt@kms_flip_tiling@flip-y-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk5/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb5/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb3/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb3/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb6/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb2/igt@kms_psr@psr2_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl3/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw6/igt@prime_busy@hang-wait@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw8/igt@prime_busy@hang-wait@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +9 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk9/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@kms_flip_event_leak.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@kms_flip_event_leak.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-glk8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-glk7/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-kbl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@after-wait@vcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw6/igt@prime_busy@after-wait@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@prime_busy@after-wait@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-signal-illegal-handle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@syncobj_wait@invalid-signal-illegal-handle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw2/igt@syncobj_wait@invalid-signal-illegal-handle.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl8/igt@gem_exec_reloc@basic-concurrent16.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-tglb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb1/igt@kms_color@pipe-a-ctm-0-75.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb2/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-snb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-snb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8868/shard-apl2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5766 -&gt; IGTPW_4874</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8868: 8013d0a5f31046f2be4ea965ec59c70b39c54186 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4874: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4874/index.html<br />
  IGT_5766: fc9f95086fc23f7f2226f7603241fbad3a214ee1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============8900942963880796111==--

--===============0767930328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0767930328==--
