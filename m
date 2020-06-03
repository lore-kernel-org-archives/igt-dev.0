Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 03 Jun 2020 11:24:30 -0000
Message-ID: <159118347009.12266.12631398149057518983@emeril.freedesktop.org>
References: <20200603081532.969938-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200603081532.969938-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcHl0aG9u?=
 =?utf-8?q?=3A_Stop_using_cElementTree?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: python: Stop using cElementTree
URL   : https://patchwork.freedesktop.org/series/77944/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5692_full -> IGTPW_4642_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4642_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4642_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4642_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-snb5/igt@gem_workarounds@suspend-resume-context.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-snb2/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb1/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb7/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  
Known issues
------------

  Here are the changes found in IGTPW_4642_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk5/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][7] -> [WARN][8] ([i915#1519])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#93] / [i915#95]) +42 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#1926])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#402]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-apl:          [PASS][25] -> [DMESG-FAIL][26] ([fdo#108145] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109642] / [fdo#111068])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#173])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-iclb3/igt@kms_psr@no_drrs.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-iclb1/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#31])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl3/igt@kms_setmode@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@rc6:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#95]) +32 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl3/igt@perf_pmu@rc6.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl6/igt@perf_pmu@rc6.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@processes:
    - shard-tglb:         [FAIL][39] ([i915#1528]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb8/igt@gem_ctx_persistence@processes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb5/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_params@cliprects-invalid:
    - shard-glk:          [DMESG-WARN][41] ([i915#1927]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk9/igt@gem_exec_params@cliprects-invalid.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk4/igt@gem_exec_params@cliprects-invalid.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-kbl:          [DMESG-WARN][43] ([i915#93] / [i915#95]) -> [PASS][44] +51 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl3/igt@gem_exec_reloc@basic-gtt-read-active.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl1/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][45] ([i915#180]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl1/igt@gem_workarounds@suspend-resume-context.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-tglb:         [DMESG-WARN][47] ([i915#402]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [DMESG-FAIL][49] ([i915#54] / [i915#95]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-apl:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
    - shard-kbl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [DMESG-WARN][55] ([i915#95]) -> [PASS][56] +48 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [DMESG-FAIL][57] ([i915#1926]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1602] / [i915#456]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1}:
    - shard-hsw:          [FAIL][61] ([i915#46]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-hsw4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-vga1-hdmi-a1.html

  * {igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1}:
    - shard-tglb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html

  * {igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1}:
    - shard-kbl:          [FAIL][65] ([i915#79]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1}:
    - shard-hsw:          [INCOMPLETE][69] ([i915#61]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-glk:          [TIMEOUT][71] -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-apl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl7/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
    - shard-kbl:          [DMESG-FAIL][77] ([i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@perf@invalid-oa-exponent:
    - shard-kbl:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl7/igt@perf@invalid-oa-exponent.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl4/igt@perf@invalid-oa-exponent.html

  * {igt@perf@polling-parameterized}:
    - shard-hsw:          [FAIL][81] ([i915#1542]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-hsw6/igt@perf@polling-parameterized.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-hsw1/igt@perf@polling-parameterized.html

  * {igt@perf_pmu@module-unload}:
    - shard-apl:          [TIMEOUT][83] ([i915#1635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl7/igt@perf_pmu@module-unload.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][85] -> [DMESG-WARN][86] ([i915#402])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][87] ([i915#588]) -> [SKIP][88] ([i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-apl:          [TIMEOUT][91] ([i915#1635]) -> [SKIP][92] ([fdo#109271]) +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
    - shard-glk:          [TIMEOUT][93] -> [SKIP][94] ([fdo#109271]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [FAIL][95] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][96] ([i915#1319] / [i915#1635])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl7/igt@kms_content_protection@atomic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [DMESG-FAIL][97] ([fdo#110321] / [i915#95]) -> [FAIL][98] ([fdo#110321] / [fdo#110336])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl1/igt@kms_content_protection@legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][99] ([i915#1319]) -> [TIMEOUT][100] ([i915#1319] / [i915#1635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-apl6/igt@kms_content_protection@lic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][102] ([i915#180])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][103] ([i915#1925] / [i915#1926]) -> [DMESG-WARN][104] ([i915#1926])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-glk7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][106] ([i915#93] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5692/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  
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
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1927]: https://gitlab.freedesktop.org/drm/intel/issues/1927
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5692 -> IGTPW_4642

  CI-20190529: 20190529
  CI_DRM_8574: bdf0c111ec1ac9a62dc082b887ea010605fdf1ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4642: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/index.html
  IGT_5692: c98c9ad6d06c4eb8b05b23ef0bbe0159730e387f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4642/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
