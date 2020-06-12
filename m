Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Jun 2020 11:21:52 -0000
Message-ID: <159196091276.21338.8350147505534719772@emeril.freedesktop.org>
References: <20200612085135.18375-1-petri.latvala@intel.com>
In-Reply-To: <20200612085135.18375-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_scripts/verify-blacklist=3A_Sc?=
 =?utf-8?q?ript_for_checking_blacklist_files?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] scripts/verify-blacklist: Script for checking blacklist files
URL   : https://patchwork.freedesktop.org/series/78253/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8619_full -> IGTPW_4673_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4673_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4673_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4673_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb7/igt@gem_exec_endless@dispatch@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb7/igt@gem_exec_endless@dispatch@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4673_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#93] / [i915#95]) +48 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl1/igt@gem_ctx_shared@disjoint-timelines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#1930])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@implicit-write-read@rcs0:
    - shard-snb:          [PASS][9] -> [INCOMPLETE][10] ([i915#82])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb4/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb2/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk9/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#402]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb2/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb5/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@invalid-get-prop:
    - shard-snb:          [PASS][17] -> [TIMEOUT][18] ([i915#1958])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb5/igt@kms_addfb_basic@invalid-get-prop.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb6/igt@kms_addfb_basic@invalid-get-prop.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][21] -> [DMESG-FAIL][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [PASS][25] -> [DMESG-FAIL][26] ([i915#54] / [i915#95]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk6/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen:
    - shard-hsw:          [PASS][35] -> [TIMEOUT][36] ([i915#1958]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw1/igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw4/igt@kms_cursor_crc@pipe-c-cursor-64x21-offscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_lease@lease-uevent:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#95]) +31 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl7/igt@kms_lease@lease-uevent.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl4/igt@kms_lease@lease-uevent.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][45] -> [DMESG-FAIL][46] ([fdo#108145] / [i915#95])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@polling-parameterized:
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#1542])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw4/igt@perf@polling-parameterized.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw8/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][51] ([i915#82]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb6/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb2/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +50 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl2/igt@gem_exec_schedule@semaphore-codependency.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_schedule@smoketest-all:
    - shard-tglb:         [INCOMPLETE][55] ([i915#1318]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb8/igt@gem_exec_schedule@smoketest-all.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb6/igt@gem_exec_schedule@smoketest-all.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [DMESG-WARN][57] ([i915#118] / [i915#95]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk8/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][61] ([i915#1982]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-hsw:          [INCOMPLETE][65] ([i915#61]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge:
    - shard-snb:          [TIMEOUT][67] ([i915#1958]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb2/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html
    - shard-hsw:          [TIMEOUT][69] ([i915#1958]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw2/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw8/igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-glk5/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-glk1/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-apl:          [DMESG-FAIL][75] ([i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [DMESG-FAIL][77] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [DMESG-FAIL][79] ([fdo#108145] / [i915#54] / [i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@fill-fb:
    - shard-apl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl3/igt@kms_draw_crc@fill-fb.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-iclb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][91] ([i915#433]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][93] ([fdo#109642] / [fdo#111068]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][97] ([i915#31]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl7/igt@kms_setmode@basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl1/igt@kms_setmode@basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][99] ([i915#1542]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-iclb3/igt@perf@blocking-parameterized.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-iclb6/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][101] ([i915#402]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb5/igt@perf_pmu@module-unload.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb6/igt@perf_pmu@module-unload.html

  * igt@prime_vgem@basic-fence-flip:
    - shard-apl:          [DMESG-WARN][103] ([i915#95]) -> [PASS][104] +48 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl7/igt@prime_vgem@basic-fence-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl1/igt@prime_vgem@basic-fence-flip.html

  
#### Warnings ####

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-hsw:          [TIMEOUT][105] ([i915#1958]) -> [SKIP][106] ([fdo#109271]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][107] ([i915#468]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [DMESG-FAIL][109] ([i915#1021]) -> [DMESG-FAIL][110] ([i915#1759])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-tglb1/igt@i915_selftest@live@gt_pm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-tglb3/igt@i915_selftest@live@gt_pm.html

  * igt@kms_ccs@pipe-d-bad-rotation-90:
    - shard-snb:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb6/igt@kms_ccs@pipe-d-bad-rotation-90.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb2/igt@kms_ccs@pipe-d-bad-rotation-90.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][113] ([i915#1319] / [i915#1635]) -> [TIMEOUT][114] ([i915#1319])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl3/igt@kms_content_protection@atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [DMESG-FAIL][115] ([fdo#110321] / [i915#95]) -> [TIMEOUT][116] ([i915#1319] / [i915#1635])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          [TIMEOUT][117] ([i915#1319]) -> [TIMEOUT][118] ([i915#1319] / [i915#1958])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl7/igt@kms_content_protection@lic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][119] ([i915#1319] / [i915#1958]) -> [TIMEOUT][120] ([i915#1319])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl4/igt@kms_content_protection@srm.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][121] ([i915#357]) -> [DMESG-FAIL][122] ([i915#357] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl4/igt@kms_content_protection@uevent.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][123] ([i915#357]) -> [DMESG-FAIL][124] ([i915#357] / [i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl2/igt@kms_content_protection@uevent.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][125] ([fdo#109271]) -> [TIMEOUT][126] ([i915#1958]) +4 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][127] ([i915#1982] / [i915#93] / [i915#95]) -> [DMESG-WARN][128] ([i915#93] / [i915#95])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][129] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][130] ([fdo#108145] / [i915#95])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][131] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][132] ([fdo#108145] / [i915#95])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-hsw:          [SKIP][133] ([fdo#109271]) -> [TIMEOUT][134] ([i915#1958]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-hsw1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-hsw4/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][135] ([fdo#108145] / [i915#95]) -> [FAIL][136] ([fdo#108145] / [i915#265]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          [DMESG-FAIL][137] ([fdo#108145] / [i915#95]) -> [FAIL][138] ([fdo#108145] / [i915#265]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8619/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1021]: https://gitlab.freedesktop.org/drm/intel/issues/1021
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1318]: https://gitlab.freedesktop.org/drm/intel/issues/1318
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5706 -> IGTPW_4673
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8619: 0f425ca456b45b2bbe1534ecc25c74b657d0645f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4673: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/index.html
  IGT_5706: 08fdc87d48dba48fb82f9978e142d57b013ff29f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4673/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
