Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jul 2020 23:19:58 -0000
Message-ID: <159537359829.13675.11992055159433006320@emeril.freedesktop.org>
References: <20200721181522.20042-1-carlos.santa@intel.com>
In-Reply-To: <20200721181522.20042-1-carlos.santa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHM6?=
 =?utf-8?q?_add_missing_braces_around_initializer?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1140932323=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Carlos Santa <carlos.santa@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1140932323==
Content-Type: multipart/alternative;
 boundary="===============4338638516784603221=="

--===============4338638516784603221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests: add missing braces around initializer
URL   : https://patchwork.freedesktop.org/series/79735/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8774_full -> IGTPW_4787_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html

Known issues
------------

  Here are the changes found in IGTPW_4787_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk3/igt@gem_exec_whisper@basic-queues.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@gem_exec_whisper@basic-queues.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#402]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb7/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_sync@basic-all:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@gem_sync@basic-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@gem_sync@basic-all.html
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb5/igt@gem_sync@basic-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb6/igt@gem_sync@basic-all.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][9] -> [WARN][10] ([i915#1519])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1635] / [i915#1982]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#168])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl1/igt@kms_color@pipe-c-ctm-max.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#168])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_color@pipe-c-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl3/igt@kms_color@pipe-c-ctm-max.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#168])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk4/igt@kms_color@pipe-c-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk2/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1635] / [i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#83])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][35] -> [FAIL][36] ([i915#1542])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb6/igt@perf@blocking-parameterized.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb6/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_ctx_param@root-set:
    - shard-tglb:         [DMESG-WARN][37] ([i915#402]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb2/igt@gem_ctx_param@root-set.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb1/igt@gem_ctx_param@root-set.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [DMESG-WARN][39] ([i915#118] / [i915#95]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk2/igt@gem_exec_whisper@basic-fds.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk5/igt@gem_exec_whisper@basic-fds.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-random:
    - shard-kbl:          [FAIL][41] ([i915#54]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
    - shard-apl:          [FAIL][43] ([i915#1635] / [i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][45] ([i915#57]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-apl:          [FAIL][47] ([IGT#5] / [i915#1635]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][49] ([i915#1982]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][53] ([fdo#109642] / [fdo#111068]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - shard-apl:          [FAIL][57] ([i915#1635] / [i915#331]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
    - shard-kbl:          [FAIL][59] ([i915#331]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl6/igt@kms_vblank@pipe-c-accuracy-idle.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#1982]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl1/igt@kms_vblank@pipe-c-wait-busy-hang.html

  * igt@prime_mmap@test_correct:
    - shard-snb:          [TIMEOUT][67] ([i915#1958] / [i915#2119]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb6/igt@prime_mmap@test_correct.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb2/igt@prime_mmap@test_correct.html
    - shard-hsw:          [TIMEOUT][69] ([i915#1958] / [i915#2119]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@prime_mmap@test_correct.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw6/igt@prime_mmap@test_correct.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-glk:          [FAIL][71] ([i915#1755]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk5/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [TIMEOUT][74] ([i915#1958] / [i915#2119]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [TIMEOUT][76] ([i915#1958] / [i915#2119]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [DMESG-WARN][78] ([i915#180])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-snb:          [TIMEOUT][79] ([i915#1958] / [i915#2119]) -> [SKIP][80] ([fdo#109271]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [SKIP][82] ([fdo#109271]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5742 -> IGTPW_4787
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8774: 70b7db5621e150fe4a1f98420e51f963f863fbae @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4787: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html
  IGT_5742: 540f9de91ab2816885a9076a4c0835cb3dc67a97 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html

--===============4338638516784603221==
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
<tr><td><b>Series:</b></td><td>tests: add missing braces around initializer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79735/">https://patchwork.freedesktop.org/series/79735/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8774_full -&gt; IGTPW_4787_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4787_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk3/igt@gem_exec_whisper@basic-queues.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@gem_exec_whisper@basic-queues.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb7/igt@gem_render_copy@yf-tiled-to-vebox-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb8/igt@gem_render_copy@yf-tiled-to-vebox-linear.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@gem_sync@basic-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb5/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb6/igt@gem_sync@basic-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl1/igt@kms_color@pipe-c-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_color@pipe-c-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_color@pipe-c-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl3/igt@kms_color@pipe-c-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk4/igt@kms_color@pipe-c-ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk2/igt@kms_color@pipe-c-ctm-max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb2/igt@kms_panel_fitting@atomic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb6/igt@kms_panel_fitting@atomic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/83">i915#83</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb6/igt@perf@blocking-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb6/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_param@root-set:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb2/igt@gem_ctx_param@root-set.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb1/igt@gem_ctx_param@root-set.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk2/igt@gem_exec_whisper@basic-fds.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk5/igt@gem_exec_whisper@basic-fds.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/57">i915#57</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5">IGT#5</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk9/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-iclb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-functional:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl2/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/331">i915#331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl6/igt@kms_vblank@pipe-c-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl2/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy-hang:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-apl7/igt@kms_vblank@pipe-c-wait-busy-hang.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-apl1/igt@kms_vblank@pipe-c-wait-busy-hang.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_correct:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb6/igt@prime_mmap@test_correct.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb2/igt@prime_mmap@test_correct.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@prime_mmap@test_correct.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw6/igt@prime_mmap@test_correct.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-glk5/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1755">i915#1755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-glk6/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw4/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-snb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8774/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5742 -&gt; IGTPW_4787</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8774: 70b7db5621e150fe4a1f98420e51f963f863fbae @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4787: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4787/index.html<br />
  IGT_5742: 540f9de91ab2816885a9076a4c0835cb3dc67a97 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4338638516784603221==--

--===============1140932323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1140932323==--
