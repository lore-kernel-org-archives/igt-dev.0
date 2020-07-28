Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jul 2020 18:36:19 -0000
Message-ID: <159596137914.21870.3446639705980673057@emeril.freedesktop.org>
References: <20200728073359.15807-1-petri.latvala@intel.com>
In-Reply-To: <20200728073359.15807-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgYXV0b3Rv?=
 =?utf-8?q?ols=3A_Remove_=24=28HANG=29_handling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2075791020=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2075791020==
Content-Type: multipart/alternative;
 boundary="===============6542858712562363762=="

--===============6542858712562363762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: autotools: Remove $(HANG) handling
URL   : https://patchwork.freedesktop.org/series/79966/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8800_full -> IGTPW_4809_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.html

Known issues
------------

  Here are the changes found in IGTPW_4809_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2] ([i915#794])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk3/igt@gem_exec_create@madvise.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk1/igt@gem_exec_create@madvise.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][5] -> [DMESG-WARN][6] ([i915#402]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb5/igt@i915_module_load@reload.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb3/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][7] -> [INCOMPLETE][8] ([i915#2238])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-a:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([i915#1635])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-a.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl6/igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-a.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a:
    - shard-glk:          [PASS][11] -> [INCOMPLETE][12] ([i915#2242]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk8/igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c:
    - shard-tglb:         [PASS][13] -> [INCOMPLETE][14] ([i915#2242]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb1/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb7/igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#2242])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb5/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][17] -> [DMESG-FAIL][18] ([i915#118] / [i915#95]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#168])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl7/igt@kms_color@pipe-c-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#1635] / [i915#168])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@kms_color@pipe-c-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl6/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#2241])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-glk:          [PASS][25] -> [INCOMPLETE][26] ([i915#2241])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@nonexisting-fb-interruptible@a-edp1:
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#2240]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb6/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb7/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#2240]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb1/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb3/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html

  * igt@kms_flip@nonexisting-fb@b-dp1:
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#2240]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl6/igt@kms_flip@nonexisting-fb@b-dp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl7/igt@kms_flip@nonexisting-fb@b-dp1.html

  * igt@kms_flip@nonexisting-fb@b-vga1:
    - shard-snb:          [PASS][35] -> [INCOMPLETE][36] ([i915#82])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb1/igt@kms_flip@nonexisting-fb@b-vga1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb5/igt@kms_flip@nonexisting-fb@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-snb:          [PASS][39] -> [TIMEOUT][40] ([i915#1958] / [i915#2119])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1798] / [i915#456])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][49] -> [FAIL][50] ([i915#1820])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_engines@idempotent:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-hsw1/igt@gem_ctx_engines@idempotent.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-hsw4/igt@gem_ctx_engines@idempotent.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][55] ([i915#1519]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-apl:          [FAIL][57] ([i915#1635] / [i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
    - shard-kbl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-snb:          [TIMEOUT][61] ([i915#1958] / [i915#2119]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-hsw1/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][71] ([fdo#109642] / [fdo#111068]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#1635] / [i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl2/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-pipe-d-functional:
    - shard-tglb:         [DMESG-WARN][77] ([i915#402]) -> [PASS][78] +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@kms_universal_plane@universal-plane-pipe-d-functional.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb5/igt@kms_universal_plane@universal-plane-pipe-d-functional.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-apl:          [DMESG-WARN][79] ([i915#1635] / [i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb8/igt@perf_pmu@module-unload.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb7/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          [SKIP][83] ([fdo#109271] / [i915#1099]) -> [TIMEOUT][84] ([i915#1958] / [i915#2119])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb6/igt@gem_ctx_persistence@engines-hang.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb6/igt@gem_ctx_persistence@engines-hang.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][85] ([i915#658]) -> [SKIP][86] ([i915#588])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen:
    - shard-snb:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1958] / [i915#2119]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-snb:          [TIMEOUT][89] ([i915#1958] / [i915#2119]) -> [SKIP][90] ([fdo#109271])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][91] ([fdo#109349]) -> [DMESG-WARN][92] ([i915#1226])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][93], [FAIL][94], [FAIL][95], [FAIL][96], [FAIL][97], [FAIL][98], [FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106]) ([i915#1610] / [i915#1635] / [i915#2110] / [i915#637]) -> [FAIL][107] ([i915#1635] / [i915#2110])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl4/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl4/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl4/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl8/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl1/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl3/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl3/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123]) ([i915#2110]) -> ([FAIL][124], [FAIL][125]) ([i915#1602] / [i915#2110])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb3/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb1/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2238]: https://gitlab.freedesktop.org/drm/intel/issues/2238
  [i915#2240]: https://gitlab.freedesktop.org/drm/intel/issues/2240
  [i915#2241]: https://gitlab.freedesktop.org/drm/intel/issues/2241
  [i915#2242]: https://gitlab.freedesktop.org/drm/intel/issues/2242
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#637]: https://gitlab.freedesktop.org/drm/intel/issues/637
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5749 -> IGTPW_4809
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8800: 1672f7cc2771b120c1b5fffad3c51a22fb3c9644 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.html
  IGT_5749: 2fef871e791ceab7841b899691c443167550173d @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.html

--===============6542858712562363762==
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
<tr><td><b>Series:</b></td><td>autotools: Remove $(HANG) handling</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/79966/">https://patchwork.freedesktop.org/series/79966/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_4809/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4809/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8800_full -&gt; IGTPW_4809_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4809_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809=
/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk3/igt@gem_exec_create@madvise.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-glk1/igt=
@gem_exec_create@madvise.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb5/igt@i915_module_load@reload.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb3/i=
gt@i915_module_load@reload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/402">i915#402</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_4809/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2238">i915#2238</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@dp-1-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-apl1/igt@kms_atomic_transition@plane-all-modeset-transit=
ion@dp-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_4809/shard-apl6/igt@kms_atomic_transition@plane-all-mod=
eset-transition@dp-1-pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@hdmi-a-1-pipe-a:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transit=
ion@hdmi-a-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4809/shard-glk8/igt@kms_atomic_transition@plane-all=
-modeset-transition@hdmi-a-1-pipe-a.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2242">i915#2242</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@edp-1-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb1/igt@kms_atomic_transition@plane-all-transition-fen=
cing@edp-1-pipe-c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4809/shard-tglb7/igt@kms_atomic_transition@plane-all-=
transition-fencing@edp-1-pipe-c.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2242">i915#2242</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb5/igt@kms_atomic_transition@plane-toggle-modeset-tra=
nsition.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4809/shard-iclb2/igt@kms_atomic_transition@plane-toggle-modeset=
-transition.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2242">i915#2242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/sh=
ard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)=
 +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-kbl7/igt@kms_color@pipe-c-ctm-max.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl4/igt=
@kms_color@pipe-c-ctm-max.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-apl7/igt@kms_color@pipe-c-ctm-max.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl6/igt=
@kms_color@pipe-c-ctm-max.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/168">i915#168</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-tran=
sitions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_4809/shard-tglb6/igt@kms_cursor_legacy@cursora-vs-=
flipa-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2241">i915#2241</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_4809/shard-glk2/igt@kms_cursor_legacy@cursorb-vs-fl=
ipb-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2241">i915#2241</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1=
:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interrup=
tible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_4809/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb-interruptible@a-edp1:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-iclb6/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4809/shard-iclb7/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
240">i915#2240</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-tglb1/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4809/shard-tglb3/igt@kms_flip@nonexisting-fb-interruptible@a-edp1.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
240">i915#2240</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl6/igt@kms_flip@nonexisting-fb@b-dp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kb=
l7/igt@kms_flip@nonexisting-fb@b-dp1.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2240">i915#2240</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb1/igt@kms_flip@nonexisting-fb@b-vga1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-s=
nb5/igt@kms_flip@nonexisting-fb@b-vga1.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_4809/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-offscr=
en-pri-shrfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_4809/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/s=
hard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw=
-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4809/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-=
draw-render.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-=
iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb5/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4809/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1798">=
i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-kbl=
4/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_engines@idempotent:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-hsw1/igt@gem_ctx_engines@idempotent.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#=
2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4=
809/shard-hsw4/igt@gem_ctx_engines@idempotent.html">PASS</a> +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4809/shard-glk4/igt@gem_exec_whisper@basic-queues-priority.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/s=
hard-hsw2/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635=
">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_4809/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_8800/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">=
i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_4809/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">PAS=
S</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_4809/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-pwrit=
e-xtiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdm=
i-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_4809/shard-hsw1/igt@kms_flip@2x-flip-vs-panning-vs-han=
g@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_4809/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp=
1.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-glk7/igt@kms_frontbuffer_tracking@fbc-stridechange.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4809/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-i=
ndfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb5/igt@kms_frontbuffer_tracking=
@psr-1p-offscren-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
09/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/=
shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-apl7/igt@kms_setmode@basic.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/shard-apl2/i=
gt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-d-functional:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb6/igt@kms_universal_plane@universal-plane-pipe-d-fun=
ctional.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/402">i915#402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_4809/shard-tglb5/igt@kms_universal_plane@universal-pl=
ane-pipe-d-functional.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-hang:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_4809/shard-apl7/igt@kms_vblank@pipe-c-query-forked-hang.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb8/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/sh=
ard-iclb7/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb6/igt@gem_ctx_persistence@engines-hang.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1099">=
i915#1099</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_4809/shard-snb6/igt@gem_ctx_persistence@engines-hang.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2119">i91=
5#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/s=
hard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_4809/shard-snb6/igt@kms_cursor_crc@pipe-d-cursor-64x64-onscreen.ht=
ml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1958">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
58">i915#1958</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2119">i915#2119</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_4809/shard-snb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_48=
09/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_8800/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_88=
00/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl7/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/sh=
ard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_8800/shard-apl4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-a=
pl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8800/shard-apl8/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl2/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/CI_DRM_8800/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-apl3/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_8800/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#211=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/637">i91=
5#637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
4809/shard-apl4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_8800/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_8800/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb8/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_8800/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8=
800/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800=
/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/sh=
ard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard=
-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_8800/shard-tglb6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8800/shard-tg=
lb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_8800/shard-tglb2/igt@runner@aborted.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809=
/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_4809/shard-tglb1/igt@runner@aborted.html">FA=
IL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i=
915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
110">i915#2110</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5749 -&gt; IGTPW_4809</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8800: 1672f7cc2771b120c1b5fffad3c51a22fb3c9644 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_4809: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4809/index.htm=
l<br />
  IGT_5749: 2fef871e791ceab7841b899691c443167550173d @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6542858712562363762==--

--===============2075791020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2075791020==--
