Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 22 Oct 2020 19:53:10 -0000
Message-ID: <160339639051.7803.4715290746470952577@emeril.freedesktop.org>
References: <20201022150943.3041180-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201022150943.3041180-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fmmap=5Fgtt=3A_Trim_object_size_for_ptracing?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1387144466=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1387144466==
Content-Type: multipart/alternative;
 boundary="===============5503004018304621471=="

--===============5503004018304621471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_mmap_gtt: Trim object size for ptracing
URL   : https://patchwork.freedesktop.org/series/82959/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9184_full -> IGTPW_5085_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5085_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5085_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5085_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_close_race@basic-threads:
    - shard-snb:          [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb7/igt@gem_close_race@basic-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb7/igt@gem_close_race@basic-threads.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [WARN][3] ([i915#2283]) -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html

  
Known issues
------------

  Here are the changes found in IGTPW_5085_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk3/igt@gem_exec_whisper@basic-contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk7/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#82])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb5/igt@gem_partial_pwrite_pread@reads-snoop.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl7/igt@i915_suspend@sysfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-snb:          [PASS][15] -> [FAIL][16] ([i915#2546])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#433])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#155])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#165] / [i915#78])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-x.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#1635] / [i915#31])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl4/igt@kms_setmode@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf@global-sseu-config:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([i915#1354])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb5/igt@perf@global-sseu-config.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb4/igt@perf@global-sseu-config.html
    - shard-apl:          [PASS][31] -> [SKIP][32] ([fdo#109271] / [i915#1354] / [i915#1635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl8/igt@perf@global-sseu-config.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl8/igt@perf@global-sseu-config.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#1354])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb2/igt@perf@global-sseu-config.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb8/igt@perf@global-sseu-config.html
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271] / [i915#1354])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk1/igt@perf@global-sseu-config.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk6/igt@perf@global-sseu-config.html
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271] / [i915#1354])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl2/igt@perf@global-sseu-config.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl6/igt@perf@global-sseu-config.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-iclb:         [DMESG-WARN][39] ([i915#1982]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_exec_reloc@basic-many-active@vecs0:
    - shard-glk:          [FAIL][41] ([i915#2389]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk5/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [FAIL][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][47] ([i915#155]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-apl:          [FAIL][49] ([i915#1635] / [i915#2521]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][53] ([i915#1635] / [i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-snb:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1:
    - shard-hsw:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk3/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][67] ([fdo#109642] / [fdo#111068]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][73] ([fdo#109271] / [i915#1354]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@perf@polling.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk1/igt@perf@polling.html
    - shard-tglb:         [SKIP][75] ([i915#1354]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb6/igt@perf@polling.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb6/igt@perf@polling.html
    - shard-apl:          [SKIP][77] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl3/igt@perf@polling.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl2/igt@perf@polling.html
    - shard-kbl:          [SKIP][79] ([fdo#109271] / [i915#1354]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl4/igt@perf@polling.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@perf@polling.html
    - shard-hsw:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@perf@polling.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw6/igt@perf@polling.html
    - shard-iclb:         [SKIP][83] ([i915#1354]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb7/igt@perf@polling.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@perf@polling.html

  * igt@prime_vgem@coherency-blt:
    - shard-hsw:          [FAIL][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@prime_vgem@coherency-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw6/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1226]) -> [SKIP][88] ([fdo#109349])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][90] ([i915#2411])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-tglb:         [DMESG-WARN][91] ([i915#2411]) -> [INCOMPLETE][92] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5085
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9184: f815594e102e8ca3bfd611f11fb68c3ddb18dcd6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html

--===============5503004018304621471==
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
<tr><td><b>Series:</b></td><td>i915/gem_mmap_gtt: Trim object size for ptracing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82959/">https://patchwork.freedesktop.org/series/82959/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9184_full -&gt; IGTPW_5085_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5085_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5085_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5085_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_close_race@basic-threads:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb7/igt@gem_close_race@basic-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb7/igt@gem_close_race@basic-threads.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-lateclose:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw5/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5085_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk3/igt@gem_exec_whisper@basic-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk7/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-snoop:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb5/igt@gem_partial_pwrite_pread@reads-snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@gem_partial_pwrite_pread@reads-snoop.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl7/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-gtt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl4/igt@kms_plane_lowres@pipe-c-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl2/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb5/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb4/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl8/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl8/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb2/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb8/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk1/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk6/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl2/igt@perf@global-sseu-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl6/igt@perf@global-sseu-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb7/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk2/igt@gem_exec_reloc@basic-many-active@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk8/igt@gem_exec_reloc@basic-many-active@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk3/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk5/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk3/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl7/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb3/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk3/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl7/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-glk4/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-glk1/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb6/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb6/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-apl3/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-apl2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-kbl4/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-kbl4/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw6/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb7/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb2/igt@perf@polling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-hsw2/igt@prime_vgem@coherency-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-hsw6/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9184/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
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
<li>IGT: IGT_5822 -&gt; IGTPW_5085</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9184: f815594e102e8ca3bfd611f11fb68c3ddb18dcd6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5085: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5085/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5503004018304621471==--

--===============1387144466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1387144466==--
