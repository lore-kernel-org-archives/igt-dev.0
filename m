Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 02 Jul 2020 10:14:09 -0000
Message-ID: <159368484995.5657.757478853668069555@emeril.freedesktop.org>
References: <20200702054243.9949-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200702054243.9949-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev12=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev12)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8691_full -> IGTPW_4727_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8691_full and IGTPW_4727_full:

### New IGT tests (11) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit-none:
    - Statuses : 7 pass(s)
    - Exec time: [3.15, 5.18] s

  * igt@api_intel_bb@intel-bb-blit-x:
    - Statuses : 7 pass(s)
    - Exec time: [2.54, 4.67] s

  * igt@api_intel_bb@intel-bb-blit-y:
    - Statuses : 7 pass(s)
    - Exec time: [2.56, 4.61] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 6 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4727_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][1] -> [DMESG-WARN][2] ([i915#118] / [i915#95]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk3/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][3] -> [SKIP][4] ([i915#1904])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#155])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_color@pipe-c-ctm-red-to-blue:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw1/igt@kms_color@pipe-c-ctm-red-to-blue.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw4/igt@kms_color@pipe-c-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#95]) +33 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [PASS][11] -> [DMESG-FAIL][12] ([i915#54] / [i915#95]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#54])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-apl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#1635] / [i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +7 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#1928])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([fdo#108145] / [i915#1635] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-c-primary-size-64:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#402])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb8/igt@kms_plane_cursor@pipe-c-primary-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-tglb8/igt@kms_plane_cursor@pipe-c-primary-size-64.html

  * igt@kms_sequence@get-busy:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#93] / [i915#95]) +44 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl7/igt@kms_sequence@get-busy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl2/igt@kms_sequence@get-busy.html

  * igt@kms_vblank@pipe-c-wait-idle-hang:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@kms_vblank@pipe-c-wait-idle-hang.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl2/igt@kms_vblank@pipe-c-wait-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-kbl:          [FAIL][39] ([i915#1528]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl7/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][41] ([i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk5/igt@gem_exec_whisper@basic-forked.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk8/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-hsw:          [TIMEOUT][43] ([i915#1958] / [i915#2119]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@gem_mmap_gtt@cpuset-basic-small-copy.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw8/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-tglb:         [DMESG-WARN][45] ([i915#402]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-tglb6/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [WARN][47] ([i915#1519]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_addfb_basic@size-max:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +44 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl7/igt@kms_addfb_basic@size-max.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl6/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][51] ([i915#118] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [DMESG-WARN][55] ([i915#1635] / [i915#95]) -> [PASS][56] +40 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-glk:          [DMESG-FAIL][59] ([i915#1982] / [i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [FAIL][61] ([i915#57]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-a-single-bo:
    - shard-glk:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_cursor_legacy@pipe-a-single-bo.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk6/igt@kms_cursor_legacy@pipe-a-single-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-glk:          [DMESG-FAIL][65] ([i915#118] / [i915#1982] / [i915#54] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [INCOMPLETE][67] ([i915#1185]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb2/igt@kms_fbcon_fbt@psr-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-iclb8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [DMESG-FAIL][77] ([i915#118] / [i915#1982] / [i915#49] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [INCOMPLETE][79] ([i915#1185] / [i915#250]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][81] ([i915#1635] / [i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [DMESG-FAIL][83] ([i915#95]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - shard-hsw:          [FAIL][89] ([i915#1958]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@perf_pmu@busy-double-start@vcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw7/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@perf_pmu@busy-double-start@vecs0:
    - shard-hsw:          [DMESG-FAIL][91] ([i915#2119]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@perf_pmu@busy-double-start@vecs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw7/igt@perf_pmu@busy-double-start@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-glk:          [INCOMPLETE][93] ([i915#58] / [k.org#198133]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-glk4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-glk4/igt@sysfs_timeslice_duration@timeout@vecs0.html
    - shard-apl:          [FAIL][95] ([i915#1732]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#658]) -> [SKIP][98] ([fdo#109271] / [i915#1635] / [i915#658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          [SKIP][99] ([fdo#109271]) -> [SKIP][100] ([fdo#109271] / [i915#1635]) +14 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl7/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - shard-apl:          [SKIP][101] ([fdo#109271] / [fdo#111827]) -> [SKIP][102] ([fdo#109271] / [fdo#111827] / [i915#1635]) +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl6/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][103] ([i915#1319] / [i915#1958] / [i915#2119]) -> [DMESG-FAIL][104] ([fdo#110321] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl6/igt@kms_content_protection@atomic.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl2/igt@kms_content_protection@atomic.html
    - shard-apl:          [FAIL][105] ([fdo#110321] / [fdo#110336]) -> [DMESG-FAIL][106] ([fdo#110321] / [i915#1635] / [i915#95])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl8/igt@kms_content_protection@atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][107] ([i915#1319] / [i915#2119]) -> [TIMEOUT][108] ([i915#1319] / [i915#1958] / [i915#2119])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl6/igt@kms_content_protection@lic.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180]) -> [FAIL][110] ([i915#54])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][113] ([i915#93] / [i915#95]) -> [DMESG-WARN][114] ([i915#180] / [i915#93] / [i915#95])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence:
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1635]) -> [SKIP][116] ([fdo#109271]) +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][117] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][118] ([fdo#108145] / [i915#95]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          [FAIL][119] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][120] ([fdo#108145] / [i915#1635] / [i915#95]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-apl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-none:
    - shard-hsw:          [TIMEOUT][121] ([i915#1958] / [i915#2119]) -> [SKIP][122] ([fdo#109271]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw7/igt@kms_plane_multiple@atomic-pipe-d-tiling-none.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][123], [FAIL][124]) ([i915#2110]) -> [FAIL][125] ([i915#1436] / [i915#2110])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw7/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8691/shard-hsw7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/shard-hsw7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1732]: https://gitlab.freedesktop.org/drm/intel/issues/1732
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5719 -> IGTPW_4727
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8691: 65f4b41f875158ce36b3571700c0f39e8321332a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4727: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html
  IGT_5719: 54731f017df8660f29cc8f5db0b570239729e808 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4727/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
