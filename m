Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 19:53:28 -0000
Message-ID: <159613880874.11114.8198240729824763792@emeril.freedesktop.org>
References: <20200730142133.2019343-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200730142133.2019343-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests=3A_Add_feature=5Fdiscove?=
 =?utf-8?q?ry?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1591940830=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1591940830==
Content-Type: multipart/alternative;
 boundary="===============4343141814528846117=="

--===============4343141814528846117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests: Add feature_discovery
URL   : https://patchwork.freedesktop.org/series/80097/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8817_full -> IGTPW_4830_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4830_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@feature_discovery@chamelium} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@feature_discovery@chamelium.html

  * {igt@feature_discovery@display-3x} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb4/igt@feature_discovery@display-3x.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8817_full and IGTPW_4830_full:

### New IGT tests (7) ###

  * igt@feature_discovery@chamelium:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@feature_discovery@display:
    - Statuses : 7 pass(s)
    - Exec time: [0.0] s

  * igt@feature_discovery@display-2x:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@feature_discovery@display-3x:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@feature_discovery@display-4x:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@feature_discovery@psr1:
    - Statuses : 2 pass(s) 5 skip(s)
    - Exec time: [0.0] s

  * igt@feature_discovery@psr2:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4830_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-10ms:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw6/igt@gem_eio@in-flight-10ms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw4/igt@gem_eio@in-flight-10ms.html

  * igt@gem_madvise@dontneed-before-mmap:
    - shard-snb:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb2/igt@gem_madvise@dontneed-before-mmap.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@gem_madvise@dontneed-before-mmap.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1899])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1982])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#49])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#1635] / [i915#49])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#31])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl6/igt@kms_setmode@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@kms_setmode@basic.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#1542])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb3/igt@perf@polling-parameterized.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb2/igt@perf@polling-parameterized.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#1820])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-iclb:         [FAIL][29] ([i915#2247]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb5/igt@core_setmaster@master-drop-set-user.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb4/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          [FAIL][31] ([i915#2247]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl3/igt@core_setmaster@master-drop-set-user.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl7/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          [FAIL][33] ([i915#2247]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb2/igt@core_setmaster@master-drop-set-user.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb2/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         [FAIL][35] ([i915#2247]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb2/igt@core_setmaster@master-drop-set-user.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb3/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          [FAIL][37] ([i915#1635] / [i915#2247]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl8/igt@core_setmaster@master-drop-set-user.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl6/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          [FAIL][39] ([i915#2247]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk7/igt@core_setmaster@master-drop-set-user.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk2/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          [FAIL][41] ([i915#2247]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw4/igt@core_setmaster@master-drop-set-user.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [FAIL][43] ([i915#1528] / [i915#1635]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl7/igt@gem_ctx_persistence@processes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl4/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_balancer@bonded-early:
    - shard-tglb:         [FAIL][45] ([i915#2079]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb1/igt@gem_exec_balancer@bonded-early.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@gem_exec_balancer@bonded-early.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][47] ([i915#118] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk2/igt@gem_exec_whisper@basic-forked.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk5/igt@gem_exec_whisper@basic-forked.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][49] ([i915#155]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl6/igt@i915_suspend@debugfs-reader.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-hsw:          [TIMEOUT][53] ([i915#1958] / [i915#2119]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][55] ([i915#118] / [i915#95]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-apl:          [FAIL][57] ([i915#1635] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-snb:          [TIMEOUT][59] ([i915#1958] / [i915#2119]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
    - shard-apl:          [DMESG-WARN][63] ([i915#1635] / [i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][67] ([fdo#109441]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][69] ([i915#454]) -> [FAIL][70] ([i915#1899])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][71] ([i915#1319] / [i915#2119]) -> [TIMEOUT][72] ([i915#1319] / [i915#1958] / [i915#2119])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_content_protection@atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-snb:          [TIMEOUT][73] ([i915#1958] / [i915#2119]) -> [SKIP][74] ([fdo#109271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-hsw:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [SKIP][76] ([fdo#109271]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-c:
    - shard-snb:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1958] / [i915#2119])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb6/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2079]: https://gitlab.freedesktop.org/drm/intel/issues/2079
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2247]: https://gitlab.freedesktop.org/drm/intel/issues/2247
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5752 -> IGTPW_4830
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8817: 9694a4caf26c3c4f3d50f335415218c709029450 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4830: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html

--===============4343141814528846117==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests: Add feature_discovery</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80097/">https://patchwork.freedesktop.org/series/80097/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8817_full -&gt; IGTPW_4830_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4830_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@feature_discovery@chamelium} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@feature_discovery@chamelium.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@feature_discovery@display-3x} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb4/igt@feature_discovery@display-3x.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8817_full and IGTPW_4830_full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>Statuses : 2 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4830_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-10ms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw6/igt@gem_eio@in-flight-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw4/igt@gem_eio@in-flight-10ms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-mmap:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb2/igt@gem_madvise@dontneed-before-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@gem_madvise@dontneed-before-mmap.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl7/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl1/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb3/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb2/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb4/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl3/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl7/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb2/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb3/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl8/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl6/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk7/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk2/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw4/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2247">i915#2247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl7/igt@gem_ctx_persistence@processes.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1528">i915#1528</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl4/igt@gem_ctx_persistence@processes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-early:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb1/igt@gem_exec_balancer@bonded-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2079">i915#2079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@gem_exec_balancer@bonded-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk2/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk5/igt@gem_exec_whisper@basic-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl6/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl7/igt@i915_suspend@sysfs-reader.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-random:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-glk9/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-apl4/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-apl1/igt@kms_cursor_edge_walk@pipe-b-64x64-right-edge.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-tglb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-tglb1/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-kbl2/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-c:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8817/shard-snb6/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/shard-snb4/igt@kms_universal_plane@cursor-fb-leak-pipe-c.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
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
<li>IGT: IGT_5752 -&gt; IGTPW_4830</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8817: 9694a4caf26c3c4f3d50f335415218c709029450 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4830: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4830/index.html<br />
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4343141814528846117==--

--===============1591940830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1591940830==--
