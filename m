Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 17:55:21 -0000
Message-ID: <159189812176.22715.13985743279757070070@emeril.freedesktop.org>
References: <20200611123101.7468-1-mika.kahola@intel.com>
In-Reply-To: <20200611123101.7468-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fccs=3A_CCS_Clear_Color_test_=28rev3=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_ccs: CCS Clear Color test (rev3)
URL   : https://patchwork.freedesktop.org/series/76536/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8617_full -> IGTPW_4668_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4668_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4668_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4668_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf_pmu@init-busy@vcs0:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb5/igt@perf_pmu@init-busy@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-snb6/igt@perf_pmu@init-busy@vcs0.html

  * igt@perf_pmu@init-busy@vecs0:
    - shard-hsw:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw4/igt@perf_pmu@init-busy@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw2/igt@perf_pmu@init-busy@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4668_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +49 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@gem_exec_reloc@basic-gtt-read-active.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl7/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk6/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#402])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb6/igt@i915_module_load@reload.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb3/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1982])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][15] -> [DMESG-FAIL][16] ([i915#118] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#168])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl8/igt@kms_color@pipe-b-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl1/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#168])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#168])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk4/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk5/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#95]) +39 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#61]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1525])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk7/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-apl:          [FAIL][43] ([i915#1528]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][45] ([i915#93] / [i915#95]) -> [PASS][46] +48 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl7/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][47] ([i915#1930]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk7/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_mmap_gtt@ptrace:
    - shard-hsw:          [INCOMPLETE][49] ([i915#61]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw4/igt@gem_mmap_gtt@ptrace.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw4/igt@gem_mmap_gtt@ptrace.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [DMESG-WARN][51] ([i915#402]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][53] ([i915#1899]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][55] ([i915#1958]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw8/igt@kms_addfb_basic@bad-pitch-32.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw4/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][57] ([i915#1958]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb6/igt@kms_addfb_basic@bad-pitch-32.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-snb4/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][61] ([i915#54] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-apl:          [DMESG-WARN][63] ([i915#95]) -> [PASS][64] +37 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl2/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-apl:          [DMESG-FAIL][65] ([i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@dpms-off-confusion@a-hdmi-a1:
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-glk9/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-glk5/igt@kms_flip@dpms-off-confusion@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +7 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@plain-flip-ts-check@a-dp1:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_flip@plain-flip-ts-check@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl6/igt@kms_flip@plain-flip-ts-check@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb1/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb3/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][77] ([i915#433]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][83] ([i915#1911]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][87] ([i915#31]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl3/igt@kms_setmode@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-hsw:          [FAIL][89] ([i915#1542]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw1/igt@perf@blocking-parameterized.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw1/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_render_copy@yf-tiled-ccs-to-linear:
    - shard-snb:          [SKIP][91] ([fdo#109271]) -> [TIMEOUT][92] ([i915#1958]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb5/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-snb6/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
    - shard-hsw:          [SKIP][93] ([fdo#109271]) -> [TIMEOUT][94] ([i915#1958]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw1/igt@gem_render_copy@yf-tiled-ccs-to-linear.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw2/igt@gem_render_copy@yf-tiled-ccs-to-linear.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][95] ([i915#658]) -> [SKIP][96] ([i915#588])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#1899]) -> [FAIL][98] ([i915#454])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [DMESG-WARN][99] ([i915#93] / [i915#95]) -> [INCOMPLETE][100] ([i915#155])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl2/igt@i915_suspend@forcewake.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl3/igt@i915_suspend@forcewake.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][101] ([i915#1958]) -> [SKIP][102] ([fdo#109271]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-hsw8/igt@kms_busy@basic-flip-pipe-d.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-hsw4/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][103] ([i915#1319]) -> [FAIL][104] ([fdo#110321] / [fdo#110336])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][105] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][106] ([i915#1319])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl7/igt@kms_content_protection@legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][107] ([i915#1319]) -> [TIMEOUT][108] ([i915#1319] / [i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-apl6/igt@kms_content_protection@lic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][109] ([fdo#110321] / [i915#95]) -> [TIMEOUT][110] ([i915#1319])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl2/igt@kms_content_protection@srm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl7/igt@kms_content_protection@srm.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [FAIL][112] ([i915#64])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][113] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][114] ([fdo#108145] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][115] ([i915#1958]) -> [SKIP][116] ([fdo#109271]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-snb5/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][117] ([i915#1911]) -> [SKIP][118] ([fdo#109642] / [fdo#111068])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8617/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4668
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8617: 2100025f87587a1dcf07985174c79a68c4a550eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4668: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4668/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
