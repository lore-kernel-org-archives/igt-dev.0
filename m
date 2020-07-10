Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 10 Jul 2020 19:29:25 -0000
Message-ID: <159440936543.20499.6763410169818748822@emeril.freedesktop.org>
References: <20200710140048.646121-1-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200710140048.646121-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsu=3A_Add_igt=5Fassert_when_the_failing_of_PSR2_en?=
 =?utf-8?q?abling?=
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
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_psr2_su: Add igt_assert when the failing of PSR2 enabling
URL   : https://patchwork.freedesktop.org/series/79343/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5731_full -> IGTPW_4755_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4755_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4755_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4755_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@queue-busy:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw1/igt@kms_sequence@queue-busy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw2/igt@kms_sequence@queue-busy.html

  
Known issues
------------

  Here are the changes found in IGTPW_4755_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-cpu-wc:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([i915#1958] / [i915#2119]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw1/igt@gem_exec_reloc@basic-cpu-wc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw6/igt@gem_exec_reloc@basic-cpu-wc.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk9/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk9/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][7] -> [FAIL][8] ([i915#1899])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb3/igt@i915_pm_dc@dc5-psr.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb8/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb1/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_selftest@mock@requests:
    - shard-snb:          [PASS][11] -> [INCOMPLETE][12] ([i915#2110] / [i915#82])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb2/igt@i915_selftest@mock@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb4/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl7/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1635] / [i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#95]) +43 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl2/igt@kms_color@pipe-b-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl4/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#1635] / [i915#95]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#83])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb4/igt@kms_panel_fitting@atomic-fastset.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-snb:          [PASS][31] -> [TIMEOUT][32] ([i915#1958] / [i915#2119]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb2/igt@kms_properties@connector-properties-atomic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb2/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb7/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl3/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][39] -> [DMESG-WARN][40] ([i915#402])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb2/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-iclb:         [PASS][41] -> [DMESG-WARN][42] ([i915#1982])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb6/igt@perf@whitelisted-registers-userspace-config.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb2/igt@perf@whitelisted-registers-userspace-config.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#1820])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl1/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#93] / [i915#95]) +43 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl3/igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl4/igt@syncobj_wait@multi-wait-all-for-submit-submitted-signaled.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb1/igt@gem_eio@kms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb1/igt@gem_eio@kms.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +48 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl6/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl1/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk5/igt@gem_exec_whisper@basic-fds-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][53] ([i915#402]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][55] ([i915#1519]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl2/igt@kms_color@pipe-a-ctm-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl7/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#95]) -> [PASS][62] +55 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-glk:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk8/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@pipe-a-torture-move:
    - shard-snb:          [TIMEOUT][65] ([i915#1958] / [i915#2119]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb6/igt@kms_cursor_legacy@pipe-a-torture-move.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb4/igt@kms_cursor_legacy@pipe-a-torture-move.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl4/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl1/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-glk:          [FAIL][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-glk5/igt@kms_prop_blob@blob-prop-lifetime.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-glk5/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw7/igt@kms_properties@crtc-properties-atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw8/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][87] ([i915#1911]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-tglb1/igt@kms_psr2_su@frontbuffer.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-tglb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][91] ([i915#2036]) -> [WARN][92] ([i915#2021])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb1/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb2/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [DMESG-FAIL][93] ([fdo#110321] / [i915#1635] / [i915#95]) -> [FAIL][94] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl1/igt@kms_content_protection@legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [TIMEOUT][96] ([i915#1958] / [i915#2119]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-hsw:          [SKIP][97] ([fdo#109271]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][100] ([fdo#108145] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
    - shard-apl:          [FAIL][101] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][102] ([fdo#108145] / [i915#1635] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [DMESG-FAIL][103] ([fdo#108145] / [i915#95]) -> [FAIL][104] ([fdo#108145] / [i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@prime_vgem@fence-write-hang:
    - shard-snb:          [TIMEOUT][105] ([i915#1958] / [i915#2119]) -> [SKIP][106] ([fdo#109271]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-snb6/igt@prime_vgem@fence-write-hang.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-snb4/igt@prime_vgem@fence-write-hang.html
    - shard-hsw:          [TIMEOUT][107] ([i915#1958] / [i915#2119]) -> [SKIP][108] ([fdo#109271]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-hsw7/igt@prime_vgem@fence-write-hang.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-hsw8/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][109], [FAIL][110]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][111] ([i915#1635] / [i915#2110])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl6/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5731/shard-apl8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5731 -> IGTPW_4755

  CI-20190529: 20190529
  CI_DRM_8728: f8a518551dbe5b5bc460555eb4b2af4f57b92335 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4755: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/index.html
  IGT_5731: 6c008a2fe5c8c46ad8c1871b030987eddaa17bd9 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4755/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
