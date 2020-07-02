Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 23:28:44 -0000
Message-ID: <159373252437.5657.11786856470439708119@emeril.freedesktop.org>
References: <20200702123908.227124-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200702123908.227124-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Instantiate_a_local_drm=5Ffd_for_the_unprivileged_helper?=
 =?utf-8?q?_=28rev2=29?=
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

Series: i915/perf: Instantiate a local drm_fd for the unprivileged helper (rev2)
URL   : https://patchwork.freedesktop.org/series/79045/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8697_full -> IGTPW_4730_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4730_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4730_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4730_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_4730_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-glk9/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#1436] / [i915#716])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl7/igt@gen9_exec_parse@allowed-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [PASS][7] -> [WARN][8] ([i915#1519])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [PASS][9] -> [WARN][10] ([i915#1515])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@mock@requests:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#2110])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb6/igt@i915_selftest@mock@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb3/igt@i915_selftest@mock@requests.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#93] / [i915#95]) +40 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl4/igt@kms_addfb_basic@legacy-format.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl7/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958] / [i915#2119]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-hsw7/igt@kms_color@pipe-b-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-hsw7/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#1635] / [i915#54] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_lease@possible-crtcs-filtering:
    - shard-snb:          [PASS][27] -> [TIMEOUT][28] ([i915#1958] / [i915#2119]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-snb2/igt@kms_lease@possible-crtcs-filtering.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-snb2/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb6/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb3/igt@kms_plane_scaling@pipe-b-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1635] / [i915#95]) +29 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl4/igt@kms_vblank@pipe-c-wait-busy.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl1/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl3/igt@kms_vblank@pipe-c-wait-forked-busy.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-tglb:         [FAIL][41] ([i915#1528]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb7/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_ctx_shared@q-independent@vecs0:
    - shard-iclb:         [DMESG-WARN][43] ([i915#1226]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb2/igt@gem_ctx_shared@q-independent@vecs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb8/igt@gem_ctx_shared@q-independent@vecs0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-apl:          [DMESG-WARN][45] ([i915#1635] / [i915#95]) -> [PASS][46] +31 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl6/igt@gem_exec_whisper@basic-queues-priority.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl7/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_hangman@error-state-basic:
    - shard-kbl:          [DMESG-WARN][47] ([i915#93] / [i915#95]) -> [PASS][48] +38 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl1/igt@i915_hangman@error-state-basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl1/igt@i915_hangman@error-state-basic.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][49] ([i915#402]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb8/igt@i915_module_load@reload.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb1/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [INCOMPLETE][51] ([i915#926]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][57] ([i915#1149]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb8/igt@kms_color@pipe-a-gamma.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb5/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge:
    - shard-glk:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-glk9/igt@kms_cursor_edge_walk@pipe-c-64x64-bottom-edge.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +10 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-snb:          [TIMEOUT][65] ([i915#1958] / [i915#2119]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-snb4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][71] ([i915#433]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][73] ([fdo#108145] / [i915#95]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][75] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [DMESG-FAIL][77] ([i915#1635] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@syncobj_wait@reset-during-wait-for-submit:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-hsw2/igt@syncobj_wait@reset-during-wait-for-submit.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-hsw7/igt@syncobj_wait@reset-during-wait-for-submit.html

  
#### Warnings ####

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          [SKIP][83] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl7/igt@kms_chamelium@vga-edid-read.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl7/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          [SKIP][85] ([fdo#109271] / [fdo#111827]) -> [SKIP][86] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl3/igt@kms_chamelium@vga-hpd-after-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl6/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958] / [i915#2119]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-snb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-snb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][89] ([fdo#109349]) -> [DMESG-WARN][90] ([i915#1226])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-hsw:          [TIMEOUT][91] ([i915#1958] / [i915#2119]) -> [SKIP][92] ([fdo#109271]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-apl:          [SKIP][93] ([fdo#109271] / [i915#1635]) -> [SKIP][94] ([fdo#109271]) +7 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-snb:          [TIMEOUT][95] ([i915#1958] / [i915#2119]) -> [SKIP][96] ([fdo#109271]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-snb4/igt@kms_plane_lowres@pipe-b-tiling-y.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-snb5/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][97] ([i915#31]) -> [DMESG-FAIL][98] ([i915#31] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl3/igt@kms_setmode@basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl2/igt@kms_setmode@basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-apl:          [SKIP][99] ([fdo#109271]) -> [SKIP][100] ([fdo#109271] / [i915#1635]) +10 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl7/igt@kms_vrr@flip-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl7/igt@kms_vrr@flip-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][101], [FAIL][102], [FAIL][103]) ([i915#1436] / [i915#1784] / [i915#2110]) -> ([FAIL][104], [FAIL][105]) ([fdo#109271] / [i915#1436] / [i915#1784] / [i915#2110] / [i915#716])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl2/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl3/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-kbl7/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][106], [FAIL][107], [FAIL][108]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][109] ([i915#1635] / [i915#2110])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl4/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl1/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-apl4/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         [FAIL][110] ([i915#2110]) -> [FAIL][111] ([i915#1764] / [i915#2110])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8697/shard-tglb6/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/shard-tglb3/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5720 -> IGTPW_4730
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8697: a9230e22c3c6a16047315beb00f49eef2e74ea0a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4730: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/index.html
  IGT_5720: f35053d4b6d7bbcf6505ef67a8bd56acc7fb2eb2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4730/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
