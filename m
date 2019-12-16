Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Dec 2019 16:24:57 -0000
Message-ID: <157651349776.5614.14025780384035445426@emeril.freedesktop.org>
References: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191216093433.2517697-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9w?=
 =?utf-8?q?erf=3A_Skip_OA_testing_on_systems_too_old?=
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

Series: i915/perf: Skip OA testing on systems too old
URL   : https://patchwork.freedesktop.org/series/70973/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7573_full -> IGTPW_3864_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html

Known issues
------------

  Here are the changes found in IGTPW_3864_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl1/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl7/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#470])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb7/igt@gem_exec_schedule@smoketest-blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb6/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#520])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#472] / [i915#707])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb8/igt@gem_sync@basic-many-each.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb4/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([fdo#111764])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@i915_pm_rpm@system-suspend-modeset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb6/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_selftest@live_gt_timelines:
    - shard-tglb:         [PASS][27] -> [INCOMPLETE][28] ([i915#455])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb3/igt@i915_selftest@live_gt_timelines.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb6/igt@i915_selftest@live_gt_timelines.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_legacy@pipe-b-torture-bo:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#118] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk4/igt@kms_cursor_legacy@pipe-b-torture-bo.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-glk2/igt@kms_cursor_legacy@pipe-b-torture-bo.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#123] / [i915#140])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-rte.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#460])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@pixel-format-pipe-b-planes-source-clamping:
    - shard-iclb:         [PASS][43] -> [INCOMPLETE][44] ([i915#140] / [i915#246])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb1/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@kms_plane@pixel-format-pipe-b-planes-source-clamping.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb3/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl4/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl3/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][49] -> [FAIL][50] ([i915#31])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw5/igt@kms_setmode@basic.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-hsw5/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#112080]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@perf_pmu@busy-vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl6/igt@gem_ctx_isolation@rcs0-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-persistence:
    - shard-iclb:         [SKIP][55] ([fdo#109276] / [fdo#112080]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@gem_ctx_persistence@vcs1-persistence.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@gem_ctx_persistence@vcs1-persistence.html

  * igt@gem_eio@hibernate:
    - shard-tglb:         [INCOMPLETE][57] ([i915#456]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb8/igt@gem_eio@hibernate.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb9/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][59] ([i915#232]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb7/igt@gem_eio@reset-stress.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-snb7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +6 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@gem_exec_schedule@fifo-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb3/igt@gem_exec_schedule@in-order-bsd.html

  * {igt@gem_exec_schedule@pi-distinct-iova-bsd}:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][69] ([fdo#111870]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html

  * {igt@gen9_exec_parse@allowed-single}:
    - shard-apl:          [DMESG-WARN][71] ([i915#716]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-apl2/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][73] ([i915#460]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglb:         [INCOMPLETE][75] ([i915#456] / [i915#460] / [i915#516]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [INCOMPLETE][77] ([i915#474] / [i915#667]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-glk:          [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-iclb:         [INCOMPLETE][81] ([i915#123] / [i915#140]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][83] ([fdo#103665] / [i915#648] / [i915#667]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl1/igt@kms_plane@pixel-format-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-kbl3/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-tglb:         [INCOMPLETE][85] ([i915#456] / [i915#460]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-hsw:          [DMESG-FAIL][87] ([fdo#103166] / [i915#44]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw5/igt@kms_plane_lowres@pipe-b-tiling-none.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-hsw6/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +6 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-snb:          [INCOMPLETE][93] ([i915#82]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-snb1/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-snb6/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf_pmu@most-busy-check-all-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb5/igt@perf_pmu@most-busy-check-all-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb4/igt@perf_pmu@most-busy-check-all-vcs1.html

  
#### Warnings ####

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][97] ([i915#818]) -> [FAIL][98] ([i915#832])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-hsw6/igt@gem_tiled_blits@normal.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@kms_atomic_transition@6x-modeset-transitions:
    - shard-tglb:         [SKIP][99] ([fdo#112016] / [fdo#112021]) -> [SKIP][100] ([fdo#112021])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-tglb3/igt@kms_atomic_transition@6x-modeset-transitions.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-tglb9/igt@kms_atomic_transition@6x-modeset-transitions.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][101] ([fdo#109349]) -> [DMESG-WARN][102] ([fdo#107724])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7573/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103166]: https://bugs.freedesktop.org/show_bug.cgi?id=103166
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112021]: https://bugs.freedesktop.org/show_bug.cgi?id=112021
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#246]: https://gitlab.freedesktop.org/drm/intel/issues/246
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#455]: https://gitlab.freedesktop.org/drm/intel/issues/455
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#516]: https://gitlab.freedesktop.org/drm/intel/issues/516
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#819]: https://gitlab.freedesktop.org/drm/intel/issues/819
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#832]: https://gitlab.freedesktop.org/drm/intel/issues/832
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5349 -> IGTPW_3864
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7573: 5f2c1ea1bfb34f9777b829eec98a974edd82b885 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3864: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html
  IGT_5349: 048f58513d8b8ec6bb307a939f0ac959bc0f0e10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3864/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
