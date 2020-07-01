Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Jul 2020 05:43:31 -0000
Message-ID: <159358221174.13865.7414334927660582094@emeril.freedesktop.org>
References: <20200630212515.1132791-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200630212515.1132791-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fclose=5Frace=3A_Mix_in_a_contexts_and_a_small_delay_to_clo?=
 =?utf-8?q?sure?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_close_race: Mix in a contexts and a small delay to closure
URL   : https://patchwork.freedesktop.org/series/78959/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8679_full -> IGTPW_4721_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/index.html

Known issues
------------

  Here are the changes found in IGTPW_4721_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster_vs_auth:
    - shard-snb:          [PASS][1] -> [TIMEOUT][2] ([i915#1958] / [i915#2119]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb4/igt@core_setmaster_vs_auth.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb4/igt@core_setmaster_vs_auth.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk3/igt@gem_exec_whisper@basic-fds-priority.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb3/igt@gem_exec_whisper@basic-normal.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb7/igt@gem_exec_whisper@basic-normal.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [PASS][7] -> [DMESG-WARN][8] ([i915#1982])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb8/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl6/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl3/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][15] -> [DMESG-FAIL][16] ([i915#54] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-random:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958] / [i915#2119]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw7/igt@kms_cursor_crc@pipe-b-cursor-256x85-random.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#70] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1635] / [i915#95]) +44 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#93] / [i915#95]) +52 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk4/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [PASS][33] -> [SKIP][34] ([fdo#109271])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb1/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb5/igt@kms_hdmi_inject@inject-audio.html
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#433])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
    - shard-kbl:          [PASS][37] -> [SKIP][38] ([fdo#109271])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl1/igt@kms_hdmi_inject@inject-audio.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl3/igt@kms_hdmi_inject@inject-audio.html
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([i915#433])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb2/igt@kms_hdmi_inject@inject-audio.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#1635] / [i915#95]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw4/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw6/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#1542])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb6/igt@perf@blocking-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb5/igt@perf@blocking-parameterized.html

  
#### Possible fixes ####

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][51] ([i915#1958]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb2/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][53] ([i915#1436] / [i915#716]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][55] ([i915#93] / [i915#95]) -> [PASS][56] +43 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl7/igt@i915_getparams_basic@basic-eu-total.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl4/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][57] ([i915#402]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb8/igt@i915_module_load@reload.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb1/igt@i915_module_load@reload.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][61] ([i915#79]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw6/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack:
    - shard-iclb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb7/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb1/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][71] ([i915#1958]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw4/igt@kms_lease@lessee_list.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw6/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-kbl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#1982] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
    - shard-apl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl1/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb3/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][85] ([i915#31]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl7/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl6/igt@kms_setmode@basic.html

  * igt@perf@blocking:
    - shard-glk:          [DMESG-WARN][87] ([i915#118] / [i915#95]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-glk9/igt@perf@blocking.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-glk4/igt@perf@blocking.html

  * igt@perf@invalid-oa-metric-set-id:
    - shard-apl:          [DMESG-WARN][89] ([i915#1635] / [i915#95]) -> [PASS][90] +31 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl3/igt@perf@invalid-oa-metric-set-id.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl3/igt@perf@invalid-oa-metric-set-id.html

  
#### Warnings ####

  * igt@gem_ctx_sseu@mmap-args:
    - shard-apl:          [SKIP][91] ([fdo#109271]) -> [SKIP][92] ([fdo#109271] / [i915#1635]) +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl1/igt@gem_ctx_sseu@mmap-args.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl1/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_balancer@hang:
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [TIMEOUT][94] ([i915#1958] / [i915#2119]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw4/igt@gem_exec_balancer@hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw7/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][95] ([i915#1958]) -> [TIMEOUT][96] ([i915#1958] / [i915#2119])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html
    - shard-hsw:          [TIMEOUT][97] ([i915#1958]) -> [TIMEOUT][98] ([i915#1958] / [i915#2119])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw4/igt@gem_exec_reloc@basic-concurrent16.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw7/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][99] ([i915#658]) -> [SKIP][100] ([i915#588])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [SKIP][102] ([fdo#109271] / [fdo#111827] / [i915#1635]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_concurrent@pipe-d:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [TIMEOUT][104] ([i915#1958] / [i915#2119]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb1/igt@kms_concurrent@pipe-d.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb4/igt@kms_concurrent@pipe-d.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][105] ([i915#1319] / [i915#1958]) -> [TIMEOUT][106] ([i915#1319] / [i915#1958] / [i915#2119]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl1/igt@kms_content_protection@atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][107] ([i915#180] / [i915#93] / [i915#95]) -> [DMESG-WARN][108] ([i915#180])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-random:
    - shard-apl:          [SKIP][109] ([fdo#109271] / [i915#1635]) -> [SKIP][110] ([fdo#109271]) +14 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-512x512-random.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][113] ([i915#1958]) -> [SKIP][114] ([fdo#109271])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-hsw4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-hsw4/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][115] ([i915#359]) -> [INCOMPLETE][116] ([i915#155])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [DMESG-FAIL][117] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][118] ([fdo#108145] / [i915#265])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-kbl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][122] ([fdo#108145] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][123] ([i915#1820]) -> [FAIL][124] ([i915#1820] / [i915#93] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-kbl7/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][125], [FAIL][126]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#716]) -> [FAIL][127] ([i915#1635])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl7/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-apl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][128], [FAIL][129]) ([i915#1764] / [i915#2110]) -> [FAIL][130] ([i915#2110])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8679/shard-tglb1/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/shard-tglb7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#359]: https://gitlab.freedesktop.org/drm/intel/issues/359
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4721
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8679: 3e20fe558381bf798308d3a1171948676af22376 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4721: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4721/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
