Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 17 Jul 2020 20:58:09 -0000
Message-ID: <159501948999.14919.17169718885386009306@emeril.freedesktop.org>
References: <20200717172343.1106631-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200717172343.1106631-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Change_to_igt=5Finfo_when_the_failing_of_PSR?=
 =?utf-8?q?2_enabling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1527692218=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1527692218==
Content-Type: multipart/alternative;
 boundary="===============7950869860109664676=="

--===============7950869860109664676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr2_su: Change to igt_info when the failing of PSR2 enabling
URL   : https://patchwork.freedesktop.org/series/79608/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8761_full -> IGTPW_4775_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/index.html

Known issues
------------

  Here are the changes found in IGTPW_4775_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-write-gtt-active:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2] ([i915#1958] / [i915#2119]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-snb5/igt@gem_exec_reloc@basic-write-gtt-active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb6/igt@gem_exec_reloc@basic-write-gtt-active.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw4/igt@gem_exec_whisper@basic-normal.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw4/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb7/igt@gem_partial_pwrite_pread@write-uncached.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1436] / [i915#716])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [PASS][17] -> [INCOMPLETE][18] ([i915#2055])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#247])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk1/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#1911])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb2/igt@kms_psr2_su@frontbuffer.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109642] / [fdo#111068]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [TIMEOUT][29] ([i915#1958] / [i915#1976] / [i915#2119]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-kbl:          [FAIL][31] ([i915#2079]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl4/igt@gem_exec_balancer@bonded-early.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl6/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][33] ([i915#118] / [i915#95]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk9/igt@gem_exec_create@madvise.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk1/igt@gem_exec_create@madvise.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][35] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl8/igt@gen9_exec_parse@allowed-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][37] ([i915#402]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb5/igt@i915_module_load@reload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb1/igt@i915_module_load@reload.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][39] ([i915#118] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-glk:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][45] ([i915#1635] / [i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_flip@flip-vs-panning@b-edp1:
    - shard-tglb:         [INCOMPLETE][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb6/igt@kms_flip@flip-vs-panning@b-edp1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb1/igt@kms_flip@flip-vs-panning@b-edp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][53] ([fdo#109441]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw8/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vblank@pipe-a-query-forked-busy-hang:
    - shard-snb:          [TIMEOUT][57] ([i915#1958] / [i915#2119]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb1/igt@kms_vblank@pipe-a-query-forked-busy-hang.html

  * igt@perf@missing-sample-flags:
    - shard-apl:          [SKIP][59] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl6/igt@perf@missing-sample-flags.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-apl1/igt@perf@missing-sample-flags.html
    - shard-glk:          [SKIP][61] ([fdo#109271] / [i915#1354]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-glk6/igt@perf@missing-sample-flags.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-glk8/igt@perf@missing-sample-flags.html
    - shard-iclb:         [SKIP][63] ([i915#1354]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-iclb4/igt@perf@missing-sample-flags.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-iclb1/igt@perf@missing-sample-flags.html
    - shard-hsw:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw1/igt@perf@missing-sample-flags.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw6/igt@perf@missing-sample-flags.html
    - shard-kbl:          [SKIP][67] ([fdo#109271] / [i915#1354]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl3/igt@perf@missing-sample-flags.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl6/igt@perf@missing-sample-flags.html
    - shard-tglb:         [SKIP][69] ([i915#1354]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-tglb6/igt@perf@missing-sample-flags.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb5/igt@perf@missing-sample-flags.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-hsw:          [SKIP][71] ([fdo#109271]) -> [TIMEOUT][72] ([i915#1958] / [i915#2119]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-hsw:          [SKIP][73] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][74] ([i915#1958] / [i915#2119])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw8/igt@kms_chamelium@vga-frame-dump.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw4/igt@kms_chamelium@vga-frame-dump.html
    - shard-snb:          [SKIP][75] ([fdo#109271] / [fdo#111827]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-snb4/igt@kms_chamelium@vga-frame-dump.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb6/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][77] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][78] ([i915#1319] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl7/igt@kms_content_protection@atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][79] ([i915#1319] / [i915#2119]) -> [TIMEOUT][80] ([i915#1319] / [i915#1958] / [i915#2119])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:
    - shard-snb:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-snb4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb1/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][87] ([i915#1436] / [i915#1784] / [i915#2110]) -> [FAIL][88] ([fdo#109271] / [i915#1436] / [i915#716])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-kbl4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][89], [FAIL][90], [FAIL][91]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][92] ([i915#1635] / [i915#2110])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl8/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl6/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl2/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-apl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1976]: https://gitlab.freedesktop.org/drm/intel/issues/1976
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5739 -> IGTPW_4775
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8761: b665aabc40b8c7e86f10a74171d3d3fd71251781 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4775: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/index.html
  IGT_5739: 9b964d7359db9799f2b5b905403dda668ae28c87 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/index.html

--===============7950869860109664676==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr2_su: Change to igt_info when t=
he failing of PSR2 enabling</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79608/">https://patchwork.freedesktop.org/series/79608/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4775/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4775/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8761_full -&gt; IGTPW_4775_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4775_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-active:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-snb5/igt@gem_exec_reloc@basic-write-gtt-active.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/=
shard-snb6/igt@gem_exec_reloc@basic-write-gtt-active.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#21=
19</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw4/igt@gem_exec_whisper@basic-normal.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hs=
w4/igt@gem_exec_whisper@basic-normal.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
75/shard-glk8/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#=
118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i9=
15#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-tglb7/igt@gem_partial_pwrite_pread@write-uncached.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
75/shard-tglb1/igt@gem_partial_pwrite_pread@write-uncached.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#=
402</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl3/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-kbl2=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shar=
d-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4775/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-128x128-top-edge.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
82">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4775/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/18=
0">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_4775/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cu=
r-indfb-onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4775/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-p=
rimscrn-cur-indfb-onoff.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk1/igt@kms_plane@plane-position-covered-pipe-b-planes.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4775/shard-glk1/igt@kms_plane@plane-position-covered-pipe-b-planes.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/247"=
>i915#247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-tglb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb5/ig=
t@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1911">i915#1911</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-iclb1/ig=
t@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>) +1 similar issue</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-=
iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw2/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1=
958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1976">=
i915#1976</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_4775/shard-hsw1/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-early:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl4/igt@gem_exec_balancer@bonded-early.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2079">i915#2079<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/s=
hard-kbl6/igt@gem_exec_balancer@bonded-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk9/igt@gem_exec_create@madvise.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/sh=
ard-glk1/igt@gem_exec_create@madvise.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-apl8/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#14=
36</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
16">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4775/shard-apl4/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-tglb5/igt@i915_module_load@reload.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/sha=
rd-tglb1/igt@i915_module_load@reload.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95=
">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4775/shard-glk2/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4775/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a>=
 +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4775/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS<=
/a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4775/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4775/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-tglb6/igt@kms_flip@flip-vs-panning@b-edp1.html">INCOMPLE=
TE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775=
/shard-tglb1/igt@kms_flip@flip-vs-panning@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-i=
ndfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-tglb3/igt@kms_frontbuffer_trac=
king@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-=
iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw8/igt@kms_setmode@invalid-clone-exclusive-crtc.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/195=
8">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4775/shard-hsw1/igt@kms_setmode@invalid-clone-exclusive-crtc.h=
tml">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked-busy-hang:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-snb4/igt@kms_vblank@pipe-a-query-forked-busy-hang.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/195=
8">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_4775/shard-snb1/igt@kms_vblank@pipe-a-query-forked-busy-hang.h=
tml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@missing-sample-flags:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-apl6/igt@perf@missing-sample-flags.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#135=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i9=
15#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4775/shard-apl1/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-glk6/igt@perf@missing-sample-flags.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#135=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775=
/shard-glk8/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-iclb4/igt@perf@missing-sample-flags.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-=
iclb1/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-hsw1/igt@perf@missing-sample-flags.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard=
-hsw6/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-kbl3/igt@perf@missing-sample-flags.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#135=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775=
/shard-kbl6/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-tglb6/igt@perf@missing-sample-flags.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-=
tglb5/igt@perf@missing-sample-flags.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4775/shard-hsw4/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i91=
5#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/211=
9">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-hsw8/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#=
111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4775/shard-hsw4/igt@kms_chamelium@vga-frame-dump.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119<=
/a>)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-snb4/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#=
111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_4775/shard-snb6/igt@kms_chamelium@vga-frame-dump.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119<=
/a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#131=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i9=
15#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/21=
19">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4775/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#131=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i9=
15#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-kbl7/igt@kms_content_protection@atomic-dpms.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i91=
5#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/211=
9">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_4775/shard-kbl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i915=
#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958=
">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-snb4/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4775/shard-snb1/igt@kms_cursor_edge_walk@pipe-c-128x128=
-bottom-edge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri=
-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-snb6/igt@kms_frontbuffer_tracki=
ng@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)=
 +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shr=
fb-msflip-blt.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1958">i915#1958</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-hsw1/igt@kms_frontbuffer_tracki=
ng@fbcpsr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8761/shard-kbl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1784">i915#1784</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/shard-=
kbl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8761/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8761/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8761/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_47=
75/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
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
<li>IGT: IGT_5739 -&gt; IGTPW_4775</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8761: b665aabc40b8c7e86f10a74171d3d3fd71251781 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4775: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4775/index.htm=
l<br />
  IGT_5739: 9b964d7359db9799f2b5b905403dda668ae28c87 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7950869860109664676==--

--===============1527692218==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1527692218==--
