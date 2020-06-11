Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 12:11:14 -0000
Message-ID: <159187747411.22713.7698770669369637502@emeril.freedesktop.org>
References: <20200611034435.220350-1-rodrigo.vivi@intel.com>
In-Reply-To: <20200611034435.220350-1-rodrigo.vivi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_scripts/generate=5Fclear=5Fker?=
 =?utf-8?q?nel=3A_Improve_usage_instructions=2E?=
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] scripts/generate_clear_kernel: Improve usage instructions.
URL   : https://patchwork.freedesktop.org/series/78207/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8612_full -> IGTPW_4665_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/index.html

Known issues
------------

  Here are the changes found in IGTPW_4665_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-glk:          [PASS][1] -> [FAIL][2] ([i915#1528])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk9/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk2/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_mmap_wc@copy:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +54 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl6/igt@gem_mmap_wc@copy.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl7/igt@gem_mmap_wc@copy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1982]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#1149] / [i915#1897])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb1/igt@kms_color@pipe-a-gamma.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb3/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#61])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw4/igt@kms_cursor_edge_walk@pipe-b-128x128-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#95]) +41 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl4/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][17] -> [FAIL][18] ([i915#57])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk2/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk6/igt@kms_flip@2x-flip-vs-modeset@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl7/igt@kms_prime@basic-crc@second-to-first.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl8/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl7/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][33] -> [FAIL][34] ([i915#1542])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-iclb3/igt@perf@blocking-parameterized.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-iclb8/igt@perf@blocking-parameterized.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#1542])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw1/igt@perf@polling-parameterized.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw8/igt@perf@polling-parameterized.html

  * igt@syncobj_wait@single-wait-for-submit-unsubmitted:
    - shard-snb:          [PASS][37] -> [TIMEOUT][38] ([i915#1958])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb4/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb1/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html
    - shard-hsw:          [PASS][39] -> [TIMEOUT][40] ([i915#1958])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw1/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw1/igt@syncobj_wait@single-wait-for-submit-unsubmitted.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][41] ([i915#93] / [i915#95]) -> [PASS][42] +52 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl4/igt@gem_ctx_shared@disjoint-timelines.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_schedule@implicit-read-write@bcs0:
    - shard-snb:          [INCOMPLETE][43] ([i915#82]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb4/igt@gem_exec_schedule@implicit-read-write@bcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb5/igt@gem_exec_schedule@implicit-read-write@bcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][45] ([i915#1436] / [i915#716]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][47] ([i915#1899]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw6/igt@kms_addfb_basic@bad-pitch-32.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw4/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][51] ([i915#1958]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb6/igt@kms_addfb_basic@bad-pitch-32.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb2/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-apl:          [DMESG-WARN][53] ([i915#95]) -> [PASS][54] +36 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl7/igt@kms_atomic@atomic-invalid-params.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl6/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl4/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-tglb:         [DMESG-WARN][61] ([i915#402]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@pipe-c-single-bo:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw4/igt@kms_cursor_legacy@pipe-c-single-bo.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw6/igt@kms_cursor_legacy@pipe-c-single-bo.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][65] ([i915#79]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl4/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl7/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][69] ([i915#433]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [DMESG-FAIL][73] ([i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][77] ([i915#1911]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb7/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb5/igt@kms_vblank@pipe-a-query-forked-hang.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb4/igt@kms_vblank@pipe-a-query-forked-hang.html

  * igt@syncobj_basic@test-valid-cycle:
    - shard-glk:          [TIMEOUT][83] ([i915#1958]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk5/igt@syncobj_basic@test-valid-cycle.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk9/igt@syncobj_basic@test-valid-cycle.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-glk:          [TIMEOUT][85] ([i915#1958]) -> [INCOMPLETE][86] ([i915#1958] / [i915#58] / [k.org#198133])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk5/igt@gem_exec_reloc@basic-concurrent16.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-hsw:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw6/igt@gem_render_copy@linear-to-vebox-y-tiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw1/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][89] ([i915#658]) -> [SKIP][90] ([i915#588])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][91] ([i915#1899]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][93] ([i915#1958]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-hsw6/igt@kms_busy@basic-flip-pipe-d.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html
    - shard-glk:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-glk5/igt@kms_busy@basic-flip-pipe-d.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-glk7/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][97] ([i915#1319] / [i915#1635]) -> [FAIL][98] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][99] ([i915#1319]) -> [TIMEOUT][100] ([i915#1319] / [i915#1958])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl1/igt@kms_content_protection@legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl4/igt@kms_content_protection@legacy.html
    - shard-apl:          [FAIL][101] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][102] ([i915#1319] / [i915#1635])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl4/igt@kms_content_protection@legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][103] ([i915#1319]) -> [TIMEOUT][104] ([i915#1319] / [i915#1635]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl7/igt@kms_content_protection@lic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl2/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][105] ([i915#1319] / [i915#1958]) -> [TIMEOUT][106] ([i915#1319])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl4/igt@kms_content_protection@lic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][107] ([fdo#110321] / [i915#95]) -> [TIMEOUT][108] ([i915#1319])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl2/igt@kms_content_protection@srm.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl3/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][109] ([i915#357]) -> [DMESG-FAIL][110] ([i915#357] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-kbl2/igt@kms_content_protection@uevent.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][111] ([i915#357]) -> [DMESG-FAIL][112] ([i915#357] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl8/igt@kms_content_protection@uevent.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-apl:          [DMESG-WARN][113] ([i915#95]) -> [FAIL][114] ([i915#1181])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl1/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl6/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][119] ([i915#1958]) -> [SKIP][120] ([fdo#109271]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8612/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/shard-snb4/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1181]: https://gitlab.freedesktop.org/drm/intel/issues/1181
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1897]: https://gitlab.freedesktop.org/drm/intel/issues/1897
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4665
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8612: 5138b53ad9894aa63f4366ce0aa4f8764a10fd65 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4665: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4665/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
