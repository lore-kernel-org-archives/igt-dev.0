Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Jul 2020 10:54:18 -0000
Message-ID: <159420565893.3840.16624502498103282275@emeril.freedesktop.org>
References: <20200707131814.17540-1-imre.deak@intel.com>
In-Reply-To: <20200707131814.17540-1-imre.deak@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fchamelium=3A_Sanitiz?=
 =?utf-8?q?e_the_init_error_and_deinit_path?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/igt_chamelium: Sanitize the init error and deinit path
URL   : https://patchwork.freedesktop.org/series/79192/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8709_full -> IGTPW_4744_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html

Known issues
------------

  Here are the changes found in IGTPW_4744_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl4/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#1930])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk1/igt@gem_exec_reloc@basic-concurrent0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw7/igt@gem_fence_thrash@bo-write-verify-x.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw4/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [PASS][9] -> [INCOMPLETE][10] ([i915#1602] / [i915#1887] / [i915#456])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb1/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][11] -> [DMESG-FAIL][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#93] / [i915#95]) +51 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +44 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl4/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2122])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2055])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#1635] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl6/igt@kms_prime@basic-crc@second-to-first.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl3/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl6/igt@kms_prime@basic-crc@second-to-first.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl2/igt@kms_prime@basic-crc@second-to-first.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#402]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb8/igt@perf_pmu@module-unload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb8/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#1820])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@i915_selftest@mock@requests:
    - shard-hsw:          [INCOMPLETE][39] ([i915#2110]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw1/igt@i915_selftest@mock@requests.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw6/igt@i915_selftest@mock@requests.html

  * igt@kms_addfb_basic@addfb25-yf-tiled:
    - shard-hsw:          [TIMEOUT][41] ([i915#1958] / [i915#2119]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw6/igt@kms_addfb_basic@addfb25-yf-tiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw1/igt@kms_addfb_basic@addfb25-yf-tiled.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-apl:          [DMESG-WARN][43] ([i915#1982]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [DMESG-FAIL][45] ([i915#54] / [i915#95]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_legacy@pipe-a-forked-move:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#95]) -> [PASS][48] +30 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl4/igt@kms_cursor_legacy@pipe-a-forked-move.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl2/igt@kms_cursor_legacy@pipe-a-forked-move.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-tglb:         [DMESG-WARN][49] ([i915#128]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb8/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb8/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1602] / [i915#456]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-snb:          [TIMEOUT][55] ([i915#1958] / [i915#2119]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-glk9/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
    - shard-hsw:          [INCOMPLETE][61] ([CI#80]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html

  * igt@kms_plane_cursor@pipe-b-overlay-size-64:
    - shard-tglb:         [DMESG-WARN][63] ([i915#402]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb6/igt@kms_plane_cursor@pipe-b-overlay-size-64.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb1/igt@kms_plane_cursor@pipe-b-overlay-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][65] ([fdo#109642] / [fdo#111068]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][67] ([i915#1911]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-tglb8/igt@kms_psr2_su@page_flip.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-tglb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][69] ([i915#31]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl2/igt@kms_setmode@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@invalid:
    - shard-kbl:          [DMESG-WARN][71] ([i915#93] / [i915#95]) -> [PASS][72] +44 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl3/igt@kms_vblank@invalid.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl1/igt@kms_vblank@invalid.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [INCOMPLETE][74] ([i915#794])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][75] ([i915#1958] / [i915#2119]) -> [FAIL][76] ([i915#1930])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_color@pipe-d-legacy-gamma:
    - shard-apl:          [SKIP][77] ([fdo#109271] / [i915#1635]) -> [SKIP][78] ([fdo#109271]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl1/igt@kms_color@pipe-d-legacy-gamma.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl7/igt@kms_color@pipe-d-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-75:
    - shard-apl:          [SKIP][79] ([fdo#109271] / [fdo#111827]) -> [SKIP][80] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-75.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl1/igt@kms_color_chamelium@pipe-c-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][81] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][82] ([fdo#110321] / [i915#1635] / [i915#95])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl8/igt@kms_content_protection@atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-snb:          [INCOMPLETE][83] ([i915#82]) -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-snb2/igt@kms_content_protection@lic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-snb6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-offscreen:
    - shard-snb:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-snb2/igt@kms_cursor_crc@pipe-d-cursor-64x64-offscreen.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-snb4/igt@kms_cursor_crc@pipe-d-cursor-64x64-offscreen.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-hsw:          [TIMEOUT][87] ([i915#1958] / [i915#2119]) -> [SKIP][88] ([fdo#109271]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][89] ([i915#93] / [i915#95]) -> [DMESG-WARN][90] ([i915#180] / [i915#93] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-apl:          [SKIP][91] ([fdo#109271]) -> [SKIP][92] ([fdo#109271] / [i915#1635]) +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [DMESG-WARN][94] ([i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          [DMESG-FAIL][95] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][96] ([fdo#108145] / [i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][97] ([fdo#108145] / [i915#95]) -> [FAIL][98] ([fdo#108145] / [i915#265])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [FAIL][99] ([i915#1542]) -> [DMESG-FAIL][100] ([i915#1635] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl7/igt@perf@polling-parameterized.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl6/igt@perf@polling-parameterized.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][101], [FAIL][102], [FAIL][103]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][104] ([i915#1635] / [i915#2110])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl7/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl7/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8709/shard-apl6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/shard-apl1/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5726 -> IGTPW_4744
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8709: b04f40402fb90e1be9f683434a9821a656be0952 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4744: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html
  IGT_5726: 5da80efbc7a2d5bd7b30c0f9eb4b5d001c99b558 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4744/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
