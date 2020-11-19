Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Nov 2020 14:45:13 -0000
Message-ID: <160579711340.18187.10542180161693580801@emeril.freedesktop.org>
References: <20201119104630.71385-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201119104630.71385-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_verify_reason_field_in_OA_reports_is_never_0?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0190750949=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0190750949==
Content-Type: multipart/alternative;
 boundary="===============7459725365123355007=="

--===============7459725365123355007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf: verify reason field in OA reports is never 0
URL   : https://patchwork.freedesktop.org/series/84059/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9359_full -> IGTPW_5195_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9359_full and IGTPW_5195_full:

### New IGT tests (1) ###

  * igt@perf@non-zero-reason:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5195_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#1635] / [i915#2389])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][5] -> [INCOMPLETE][6] ([i915#1635] / [i915#2405] / [i915#2635])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#1185] / [i915#2405])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [PASS][9] -> [INCOMPLETE][10] ([i915#2405] / [i915#2635])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([i915#155] / [i915#2405])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2346]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +6 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk8/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@blocking-wf_vblank@a-dp1:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl6/igt@kms_flip@blocking-wf_vblank@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl6/igt@kms_flip@blocking-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2122])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2598])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_gtt.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [DMESG-WARN][33] ([i915#2635]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-apl:          [INCOMPLETE][35] ([i915#1635] / [i915#2635]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-kbl:          [INCOMPLETE][37] ([i915#794]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [INCOMPLETE][39] ([i915#1373]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk8/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_pm_rpm@cursor:
    - shard-kbl:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@i915_pm_rpm@cursor.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl4/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][45] ([i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@i915_pm_rpm@cursor.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb8/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@i915_pm_rpm@cursor.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk7/igt@i915_pm_rpm@cursor.html
    - shard-apl:          [SKIP][49] ([fdo#109271] / [i915#1635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@i915_pm_rpm@cursor.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl2/igt@i915_pm_rpm@cursor.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][51] ([i915#1635] / [i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-kbl:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [FAIL][57] ([i915#1635] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-glk:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [FAIL][63] ([i915#2346]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][65] ([i915#2598]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-tglb:         [INCOMPLETE][75] -> [DMESG-WARN][76] ([i915#2411])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1436]) -> [DMESG-WARN][78] ([i915#2411])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][79] ([i915#579]) -> [DMESG-WARN][80] ([i915#2411])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@i915_pm_rpm@cursor.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb5/igt@i915_pm_rpm@cursor.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][81] ([i915#2411]) -> [INCOMPLETE][82] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][83] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][84] ([i915#2411])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][85] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][86] ([fdo#108145] / [i915#1635] / [i915#1982])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][87], [FAIL][88]) ([i915#1436] / [i915#1611] / [i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][89], [FAIL][90]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl2/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl4/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][91], [FAIL][92]) ([i915#2295] / [i915#2439]) -> ([FAIL][93], [FAIL][94]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb8/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][95], [FAIL][96]) ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439]) -> ([FAIL][97], [FAIL][98]) ([i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl1/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][99], [FAIL][100], [FAIL][101]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#402]) -> ([FAIL][102], [FAIL][103]) ([i915#1602] / [i915#2295] / [i915#2439])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5858 -> IGTPW_5195
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9359: 5529f30897761dc08c5cfcefc6d1659f9250d622 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5195: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/index.html
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/index.html

--===============7459725365123355007==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf: verify reason field in OA r=
eports is never 0</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84059/">https://patchwork.freedesktop.org/series/84059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5195/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5195/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9359_full -&gt; IGTPW_5195_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/index.=
html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9359_full and IGTPW_5195_f=
ull:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@perf@non-zero-reason:<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5195_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/s=
hard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</=
a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/s=
hard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/sh=
ard-apl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#24=
05</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-iclb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/s=
hard-iclb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#=
2405</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/sh=
ard-glk6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#26=
35</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/sh=
ard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5195/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5195/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i9=
15#2346</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-snb7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtil=
ed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5195/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-xtile=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk3/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible@a=
b-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5195/shard-glk8/igt@kms_flip@2x-dpms-vs-vblank-race-i=
nterruptible@ab-hdmi-a1-hdmi-a2.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl6/igt@kms_flip@blocking-wf_vblank@a-dp1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shar=
d-kbl6/igt@kms_flip@blocking-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a=
-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5195/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_519=
5/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-badstride.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_519=
5/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1=
982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-ic=
lb6/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5195/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5195/shard-glk1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5195/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794=
">i915#794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5195/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS<=
/a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-iclb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
73">i915#1373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5195/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">P=
ASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5195/shard-glk8/igt@gem_exec_whisper@basic-queues-priority-all.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl4/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-iclb2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb8/igt=
@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-glk7/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl6/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-=
apl2/igt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">=
i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5195/shard-apl6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5195/shard-kbl4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5195/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5195/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5195/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5195/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
46">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5195/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2598">i915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5195/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb6/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5195/shard-kbl3/igt@kms_plane@plane-panning-botto=
m-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#1110=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_519=
5/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5195/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
436">i915#1436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5195/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb5/ig=
t@i915_pm_rpm@cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5195/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCO=
MPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436=
">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb2/igt@kms_pipe_crc_basic@suspen=
d-read-crc-pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5195/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.=
html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195=
/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5195/shard-iclb8/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-iclb1/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5195/shard-apl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/sha=
rd-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9359/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/s=
hard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5195/shard-tglb7/igt@runner@aborted.html">FAIL=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i91=
5#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/229=
5">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5858 -&gt; IGTPW_5195</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9359: 5529f30897761dc08c5cfcefc6d1659f9250d622 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5195: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5195/index.htm=
l<br />
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7459725365123355007==--

--===============0190750949==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0190750949==--
