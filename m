Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 11:07:00 -0000
Message-ID: <158167842030.9931.17554901119308802885@emeril.freedesktop.org>
References: <20200212124317.23017-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200212124317.23017-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fuserptr=5Fblits=3A_Enhance_invalid_mapping_exercise_=28re?=
 =?utf-8?b?djMp?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_userptr_blits: Enhance invalid mapping exercise (rev3)
URL   : https://patchwork.freedesktop.org/series/72411/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7921_full -> IGTPW_4136_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4136_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_userptr_blits@invalid-mmap-offset@gtt} (NEW):
    - shard-glk:          NOTRUN -> [WARN][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk5/igt@gem_userptr_blits@invalid-mmap-offset@gtt.html

  * {igt@gem_userptr_blits@invalid-mmap-offset@uc} (NEW):
    - shard-tglb:         NOTRUN -> [WARN][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb1/igt@gem_userptr_blits@invalid-mmap-offset@uc.html

  * {igt@gem_userptr_blits@invalid-mmap-offset@wb} (NEW):
    - shard-apl:          NOTRUN -> [WARN][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-apl3/igt@gem_userptr_blits@invalid-mmap-offset@wb.html
    - shard-iclb:         NOTRUN -> [WARN][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb5/igt@gem_userptr_blits@invalid-mmap-offset@wb.html

  * {igt@gem_userptr_blits@invalid-mmap-offset@wc} (NEW):
    - shard-hsw:          NOTRUN -> [WARN][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw1/igt@gem_userptr_blits@invalid-mmap-offset@wc.html
    - shard-kbl:          NOTRUN -> [WARN][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-kbl2/igt@gem_userptr_blits@invalid-mmap-offset@wc.html
    - shard-snb:          NOTRUN -> [WARN][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-snb5/igt@gem_userptr_blits@invalid-mmap-offset@wc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7921_full and IGTPW_4136_full:

### New IGT tests (5) ###

  * igt@gem_userptr_blits@invalid-mmap-offset:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_userptr_blits@invalid-mmap-offset@gtt:
    - Statuses : 7 warn(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_userptr_blits@invalid-mmap-offset@uc:
    - Statuses : 7 warn(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_userptr_blits@invalid-mmap-offset@wb:
    - Statuses : 7 warn(s)
    - Exec time: [0.00, 0.02] s

  * igt@gem_userptr_blits@invalid-mmap-offset@wc:
    - Statuses : 7 warn(s)
    - Exec time: [0.00, 0.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4136_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][8] -> [FAIL][9] ([i915#694]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-hsw5/igt@gem_caching@reads.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw5/igt@gem_caching@reads.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#110841])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [PASS][14] -> [TIMEOUT][15] ([fdo#112271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb3/igt@gem_exec_balancer@hang.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([i915#677])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([fdo#112146]) +5 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109276]) +20 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [PASS][22] -> [FAIL][23] ([i915#644])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([fdo#111870] / [i915#478])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#716])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#1172]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb6/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb8/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-red-to-blue:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#1149]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb7/igt@kms_color@pipe-a-ctm-red-to-blue.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb1/igt@kms_color@pipe-a-ctm-red-to-blue.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [PASS][32] -> [INCOMPLETE][33] ([i915#58] / [k.org#198133])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge:
    - shard-tglb:         [PASS][34] -> [FAIL][35] ([i915#70])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-128x128-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-tglb:         [PASS][36] -> [FAIL][37] ([i915#1173])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled:
    - shard-tglb:         [PASS][38] -> [DMESG-FAIL][39] ([i915#402]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb2/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb3/igt@kms_draw_crc@draw-method-rgb565-pwrite-xtiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-snb:          [PASS][40] -> [DMESG-WARN][41] ([i915#478])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-snb4/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#79])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][44] -> [DMESG-WARN][45] ([i915#180]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][46] -> [SKIP][47] ([i915#668]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-tglb:         [PASS][50] -> [DMESG-FAIL][51] ([i915#402] / [i915#65])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb8/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-tglb:         [PASS][52] -> [FAIL][53] ([i915#65])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][54] -> [TIMEOUT][55] ([fdo#112271] / [i915#1085])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb7/igt@perf@gen12-mi-rpc.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][56] -> [SKIP][57] ([fdo#112080]) +10 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb5/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_caching@read-writes:
    - shard-hsw:          [FAIL][58] ([i915#694]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-hsw7/igt@gem_caching@read-writes.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw7/igt@gem_caching@read-writes.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][60] ([i915#677]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-snb:          [DMESG-WARN][64] ([i915#478]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-snb6/igt@gem_mmap_gtt@basic-small-copy-xy.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-snb5/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][66] ([i915#447]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][68] ([i915#454]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][70] ([i915#413]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb8/igt@i915_pm_rps@reset.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_gtt:
    - shard-iclb:         [TIMEOUT][72] ([fdo#112271]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb8/igt@i915_selftest@live_gtt.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb1/igt@i915_selftest@live_gtt.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-tglb:         [FAIL][74] ([i915#1172]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb1/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb6/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-glk:          [FAIL][76] ([i915#117] / [i915#133]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled:
    - shard-tglb:         [DMESG-FAIL][78] ([i915#402]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite:
    - shard-glk:          [FAIL][80] ([i915#49]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_lease@simple_lease:
    - shard-hsw:          [DMESG-WARN][82] ([i915#44]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-hsw5/igt@kms_lease@simple_lease.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw2/igt@kms_lease@simple_lease.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [DMESG-WARN][84] ([i915#180]) -> [PASS][85] +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-tglb:         [FAIL][88] ([i915#1184]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][90] ([i915#899]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][92] ([fdo#109642] / [fdo#111068]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb3/igt@kms_psr2_su@frontbuffer.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][94] ([fdo#109441]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-tglb:         [FAIL][96] ([i915#199]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-tglb2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-tglb6/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][98] ([fdo#103665]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][100] ([fdo#112080]) -> [PASS][101] +12 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [INCOMPLETE][102] ([i915#61]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-hsw6/igt@perf_pmu@cpu-hotplug.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw8/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [FAIL][104] ([i915#914]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-hsw2/igt@prime_mmap_coherency@write.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-hsw7/igt@prime_mmap_coherency@write.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][106] ([fdo#109276]) -> [PASS][107] +13 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][108] ([fdo#112080]) -> [FAIL][109] ([IGT#28])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7921/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#117]: https://gitlab.freedesktop.org/drm/intel/issues/117
  [i915#1172]: https://gitlab.freedesktop.org/drm/intel/issues/1172
  [i915#1173]: https://gitlab.freedesktop.org/drm/intel/issues/1173
  [i915#1184]: https://gitlab.freedesktop.org/drm/intel/issues/1184
  [i915#133]: https://gitlab.freedesktop.org/drm/intel/issues/133
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#199]: https://gitlab.freedesktop.org/drm/intel/issues/199
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5436 -> IGTPW_4136
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7921: d37a3233e5ce572a2093d0a7ad7f5558ae4e844a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4136: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/index.html
  IGT_5436: 00a64098aaae2ac3154841d76c7b034165380282 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4136/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
