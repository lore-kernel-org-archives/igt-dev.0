Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 17 Nov 2020 14:51:54 -0000
Message-ID: <160562471491.25706.12322736953578648826@emeril.freedesktop.org>
References: <20201117120042.117738-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201117120042.117738-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv2=2C1/2=5D_lib/igt=5Fdevice=5Fscan?=
 =?utf-8?q?=3A_Remember_vendor/device_for_pci_devices?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1028378035=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1028378035==
Content-Type: multipart/alternative;
 boundary="===============2078201458386235714=="

--===============2078201458386235714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,v2,1/2] lib/igt_device_scan: Remember vendor/device for pci devices
URL   : https://patchwork.freedesktop.org/series/83954/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9343_full -> IGTPW_5176_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/index.html

Known issues
------------

  Here are the changes found in IGTPW_5176_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#794])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl7/igt@gem_exec_whisper@basic-fds-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk9/igt@gem_exec_whisper@basic-queues.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk9/igt@gem_exec_whisper@basic-queues.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt@i915_pm_rpm@pm-tiling.html
    - shard-kbl:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html
    - shard-apl:          [PASS][9] -> [SKIP][10] ([fdo#109271] / [i915#1635]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl1/igt@i915_pm_rpm@pm-tiling.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@i915_pm_rpm@pm-tiling.html
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk6/igt@i915_pm_rpm@pm-tiling.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@i915_pm_rpm@pm-tiling.html
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#579])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb8/igt@i915_pm_rpm@pm-tiling.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-a:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +7 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk4/igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-a.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk3/igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe-a.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2598])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [PASS][25] -> [FAIL][26] ([i915#2546])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][35] -> [INCOMPLETE][36] ([i915#1185] / [i915#2405])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-kbl:          [PASS][37] -> [INCOMPLETE][38] ([i915#155] / [i915#2405])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#2405] / [i915#2637])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-glk:          [PASS][41] -> [INCOMPLETE][42] ([i915#2405] / [i915#2635])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
    - shard-apl:          [PASS][43] -> [INCOMPLETE][44] ([i915#1635] / [i915#2405] / [i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@enable-disable:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#1354])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb5/igt@perf@enable-disable.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@perf@enable-disable.html
    - shard-kbl:          [PASS][47] -> [SKIP][48] ([fdo#109271] / [i915#1354])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl6/igt@perf@enable-disable.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl4/igt@perf@enable-disable.html
    - shard-apl:          [PASS][49] -> [SKIP][50] ([fdo#109271] / [i915#1354] / [i915#1635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl4/igt@perf@enable-disable.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl6/igt@perf@enable-disable.html
    - shard-tglb:         [PASS][51] -> [SKIP][52] ([i915#1354])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb7/igt@perf@enable-disable.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb2/igt@perf@enable-disable.html
    - shard-glk:          [PASS][53] -> [SKIP][54] ([fdo#109271] / [i915#1354])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk3/igt@perf@enable-disable.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk9/igt@perf@enable-disable.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         [DMESG-WARN][55] ([i915#1982]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb5/igt@core_hotunplug@hotrebind-lateclose.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_caching@read-writes:
    - shard-hsw:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw1/igt@gem_caching@read-writes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt@gem_caching@read-writes.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-snb5/igt@gem_eio@kms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-snb5/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][61] ([i915#2389]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [FAIL][63] ([i915#2389]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-softpin:
    - shard-hsw:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw8/igt@gem_exec_reloc@basic-softpin.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw2/igt@gem_exec_reloc@basic-softpin.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-hsw:          [TIMEOUT][67] ([i915#2502]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw1/igt@gem_exec_whisper@basic-contexts-forked.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb5/igt@gem_exec_whisper@basic-queues-forked-all.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_partial_pwrite_pread@write-display:
    - shard-hsw:          [FAIL][71] ([i915#1888]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw1/igt@gem_partial_pwrite_pread@write-display.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw7/igt@gem_partial_pwrite_pread@write-display.html

  * {igt@kms_async_flips@test-time-stamp}:
    - shard-tglb:         [FAIL][73] ([i915#2597]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][75] ([i915#2346]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-glk:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk8/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][79] ([i915#2055]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
    - shard-snb:          [FAIL][83] ([i915#2546]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglb:         [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][87] ([i915#433]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:
    - shard-kbl:          [FAIL][89] ([i915#2472]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl2/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
    - shard-apl:          [FAIL][91] ([i915#1635] / [i915#2472]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-WARN][93] ([i915#1635] / [i915#1982]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [SKIP][97] ([i915#1354]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb3/igt@perf@oa-exponents.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb6/igt@perf@oa-exponents.html
    - shard-glk:          [SKIP][99] ([fdo#109271] / [i915#1354]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk7/igt@perf@oa-exponents.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk6/igt@perf@oa-exponents.html
    - shard-apl:          [SKIP][101] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl6/igt@perf@oa-exponents.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl1/igt@perf@oa-exponents.html
    - shard-kbl:          [SKIP][103] ([fdo#109271] / [i915#1354]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl3/igt@perf@oa-exponents.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl3/igt@perf@oa-exponents.html
    - shard-iclb:         [SKIP][105] ([i915#1354]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb5/igt@perf@oa-exponents.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb8/igt@perf@oa-exponents.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][107] ([i915#1982] / [i915#262]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb7/igt@perf_pmu@module-unload.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb2/igt@perf_pmu@module-unload.html
    - shard-iclb:         [DMESG-WARN][109] ([i915#1982] / [i915#262]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb5/igt@perf_pmu@module-unload.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb6/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][111] ([i915#1373] / [i915#1436] / [i915#456]) -> [DMESG-WARN][112] ([i915#1436])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb6/igt@gem_softpin@noreloc-s3.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][113] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][114] ([i915#579])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][115] ([fdo#110892]) -> [SKIP][116] ([i915#579])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pm-tiling:
    - shard-tglb:         [DMESG-WARN][117] ([i915#2411]) -> [SKIP][118] ([i915#579])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb7/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][120] ([fdo#108145] / [i915#1635] / [i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][121] ([i915#2411]) -> [INCOMPLETE][122] ([i915#1436] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#456])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][123] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127]) ([i915#1611] / [i915#1814] / [i915#2263] / [i915#2295] / [i915#2439] / [i915#483] / [i915#602])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-kbl1/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][128], [FAIL][129]) ([i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb5/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][133], [FAIL][134]) ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl8/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][138], [FAIL][139]) ([i915#1611] / [i915#2295] / [i915#2439] / [i915#86] / [k.org#202321]) -> ([FAIL][140], [FAIL][141], [FAIL][142]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#483] / [i915#86] / [k.org#202321])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][143], [FAIL][144]) ([i915#2295] / [i915#2439]) -> ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1602] / [i915#2295] / [i915#2439])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2263]: https://gitlab.freedesktop.org/drm/intel/issues/2263
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5855 -> IGTPW_5176
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9343: e1757932e1d12120875a6f468de2583f1842eb2e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5176: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/index.html
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/index.html

--===============2078201458386235714==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,v2,1/2] lib/igt_=
device_scan: Remember vendor/device for pci devices</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83954/">https://patchwork.freedesktop.org/series/83954/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5176/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5176/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9343_full -&gt; IGTPW_5176_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5176_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-kbl7/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-k=
bl7/igt@gem_exec_whisper@basic-fds-all.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-glk9/igt@gem_exec_whisper@basic-queues.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-gl=
k9/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-hsw2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl6/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-apl1/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-glk6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb8/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb5/igt@=
i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking@hdmi-a-1-pipe=
-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-glk4/igt@kms_atomic_transition@plane-all-transition-nonb=
locking@hdmi-a-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5176/shard-glk3/igt@kms_atomic_transition@plane=
-all-transition-nonblocking@hdmi-a-1-pipe-a.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +7=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-apl2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5176/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/16=
35">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a=
-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5176/shard-kbl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5176/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_517=
6/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-in=
dfb-fullscreen.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5176/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-prim=
scrn-spr-indfb-fullscreen.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-stridechange.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
176/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
176/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/=
shard-kbl6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982<=
/a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb6/igt@=
kms_psr@psr2_suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5176/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1185">i915#1185</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2405">i915#2405</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5176/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2405">i915#2405</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5176/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-glk3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5176/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5176/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2405">i915#2405</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2635">i915#2635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb5/igt@perf@enable-disable.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb2/igt@pe=
rf@enable-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl6/igt@perf@enable-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kbl4/igt@perf=
@enable-disable.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-apl4/igt@perf@enable-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl6/igt@perf=
@enable-disable.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1354">i915#1354</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-tglb7/igt@perf@enable-disable.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb2/igt@pe=
rf@enable-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-glk3/igt@perf@enable-disable.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk9/igt@perf=
@enable-disable.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-iclb5/igt@core_hotunplug@hotrebind-lateclose.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5176/shard-iclb2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a>=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-hsw1/igt@gem_caching@read-writes.html">FAIL</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-hsw4/igt=
@gem_caching@read-writes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-snb5/igt@gem_eio@kms.html">INCOMPLETE</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-snb5/igt@gem_=
eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-glk5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5176/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915=
#2389</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5176/shard-hsw1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-softpin:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-hsw8/igt@gem_exec_reloc@basic-softpin.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
76/shard-hsw2/igt@gem_exec_reloc@basic-softpin.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-hsw1/igt@gem_exec_whisper@basic-contexts-forked.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2502"=
>i915#2502</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5176/shard-hsw4/igt@gem_exec_whisper@basic-contexts-forked.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-iclb5/igt@gem_exec_whisper@basic-queues-forked-all.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5176/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked-all.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-display:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-hsw1/igt@gem_partial_pwrite_pread@write-display.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i9=
15#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5176/shard-hsw7/igt@gem_partial_pwrite_pread@write-display.html">PASS</a>=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@test-time-stamp}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176=
/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5176/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-u=
ntiled.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5176/shard-glk8/igt@kms_draw_crc@draw-method-xrgb210=
1010-mmap-gtt-untiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">=
i915#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5176/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5176/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-badstride.html">PA=
SS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mma=
p-gtt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5176/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-=
draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-bl=
t.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5176/shard-tglb1/igt@kms_frontbuffer_tracking@psr-rgb1010=
10-draw-blt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shar=
d-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5176/shard-kbl2/igt@kms_plane@plane-position-hole-dpms-pipe-b-pl=
anes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pipe-b-planes=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5176/shard-apl4/igt@kms_plane@plane-position-hole-dpms-pip=
e-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-64:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5176/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.=
html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@perf@oa-exponents:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-tglb3/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb6/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-glk7/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-g=
lk6/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-apl6/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/s=
hard-apl1/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl3/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-k=
bl3/igt@perf@oa-exponents.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb5/igt@perf@oa-exponents.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-iclb8/ig=
t@perf@oa-exponents.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-tglb7/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#26=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176=
/shard-tglb2/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb5/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#26=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176=
/shard-iclb6/igt@perf_pmu@module-unload.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#=
1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">=
i915#456</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5176/shard-tglb1/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1116=
44">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stre=
ss-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1108=
92">fdo#110892</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5176/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
79">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb3/igt@i915_pm_rpm@pm-tiling.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/sha=
rd-tglb7/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">=
DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
08145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5176/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-al=
pha-basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5176/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpm=
s-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9343/shard-kbl1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/s=
hard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5176/shard-kbl2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-kb=
l6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5176/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1=
814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2263">=
i915#2263</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5176/shard-iclb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-ic=
lb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5176/shard-iclb3/igt@runner@aborted.html">FAIL</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915=
#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439=
">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-apl7/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-apl8/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/sha=
rd-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5176/shard-apl3/igt@runner@aborted.html">FAIL</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#16=
11</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-glk8/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/86">i915#86</a> / <a href=3D"https://bugzilla.kernel.=
org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_517=
6/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5176/shard-glk4/igt@runner@aborted.html">FAI=
L</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611">i9=
15#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
14">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/86">i915#86</a> / <a href=3D"https://bugzilla.kernel.or=
g/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9343/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9343/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5176/shard-tglb1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/shard-tglb7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5176/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i9=
15#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5855 -&gt; IGTPW_5176</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9343: e1757932e1d12120875a6f468de2583f1842eb2e @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5176: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5176/index.htm=
l<br />
  IGT_5855: d9b3c7058efe41e5224dd1e43fac05dc6d049380 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2078201458386235714==--

--===============1028378035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1028378035==--
