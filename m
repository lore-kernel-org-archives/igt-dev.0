Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 06:39:50 -0000
Message-ID: <157621919062.23797.11250239373667902251@emeril.freedesktop.org>
References: <20191212134353.25663-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212134353.25663-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28rev22?=
 =?utf-8?q?=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: kms_plane_stress: Add plane stress test (rev22)
URL   : https://patchwork.freedesktop.org/series/58524/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7550_full -> IGTPW_3857_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3857_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3857_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3857_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@bonded-slice:
    - shard-iclb:         [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb5/igt@gem_exec_balancer@bonded-slice.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb2/igt@gem_exec_balancer@bonded-slice.html

  * {igt@i915_pipe_stress@stress-xrgb8888-untiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-snb6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-hsw:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-hsw1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-kbl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl2/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-apl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-apl6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-glk:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-glk1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7550_full and IGTPW_3857_full:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 5 fail(s) 1 pass(s)
    - Exec time: [0.0, 30.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_3857_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#679])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-glk9/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-glk7/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#110841])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-smoketest-blt:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111735])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb5/igt@gem_ctx_shared@q-smoketest-blt.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb6/igt@gem_ctx_shared@q-smoketest-blt.html

  * igt@gem_exec_async@concurrent-writes-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([fdo#111677])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb3/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#520])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl7/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [PASS][22] -> [TIMEOUT][23] ([i915#530])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb8/igt@gem_persistent_relocs@forked-thrashing.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][24] -> [DMESG-WARN][25] ([fdo#111870]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([i915#747])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-snb6/igt@i915_selftest@mock_sanitycheck.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-snb7/igt@i915_selftest@mock_sanitycheck.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl3/igt@i915_suspend@forcewake.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][30] -> [FAIL][31] ([i915#96])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-hsw5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#128])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-glk3/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-glk5/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#52] / [i915#54])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-tglb:         [PASS][36] -> [INCOMPLETE][37] ([i915#435] / [i915#456] / [i915#460])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][38] -> [DMESG-WARN][39] ([i915#180]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][40] -> [INCOMPLETE][41] ([i915#474] / [i915#667]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglb:         [PASS][42] -> [INCOMPLETE][43] ([i915#435] / [i915#474] / [i915#667])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_plane@pixel-format-pipe-a-planes:
    - shard-kbl:          [PASS][44] -> [INCOMPLETE][45] ([fdo#103665] / [i915#648] / [i915#667]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl6/igt@kms_plane@pixel-format-pipe-a-planes.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl2/igt@kms_plane@pixel-format-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][48] -> [DMESG-WARN][49] ([i915#402])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb3/igt@kms_psr@psr2_suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb7/igt@kms_psr@psr2_suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-kbl:          [DMESG-WARN][50] ([i915#180]) -> [PASS][51] +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl7/igt@gem_ctx_isolation@bcs0-s3.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl7/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][52] ([fdo#109276] / [fdo#112080]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55] +13 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][56] ([fdo#112146]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb6/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-iclb:         [DMESG-WARN][58] ([fdo#111764]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@gem_exec_suspend@basic-s0.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_mmap_gtt@hang:
    - shard-snb:          [INCOMPLETE][60] ([i915#82]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-snb6/igt@gem_mmap_gtt@hang.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-snb6/igt@gem_mmap_gtt@hang.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][62] ([i915#707] / [i915#796]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb6/igt@gem_pipe_control_store_loop@reused-buffer.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb5/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_sync@basic-many-each:
    - shard-tglb:         [INCOMPLETE][64] ([i915#472] / [i915#707]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb4/igt@gem_sync@basic-many-each.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb2/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][66] ([fdo#111870]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][68] ([i915#454]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-tglb:         [DMESG-WARN][70] ([i915#766]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb8/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding:
    - shard-hsw:          [DMESG-WARN][72] ([IGT#6]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-hsw6/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-hsw8/igt@kms_cursor_crc@pipe-b-cursor-256x256-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding:
    - shard-iclb:         [DMESG-WARN][74] ([IGT#6]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-256x256-sliding.html

  * igt@kms_cursor_legacy@pipe-c-forked-move:
    - shard-kbl:          [INCOMPLETE][76] ([fdo#103665]) -> [PASS][77] +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl1/igt@kms_cursor_legacy@pipe-c-forked-move.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl4/igt@kms_cursor_legacy@pipe-c-forked-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         [FAIL][78] ([i915#49]) -> [PASS][79] +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-tglb:         [INCOMPLETE][80] ([i915#435] / [i915#667]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][82] ([fdo#109441]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][84] ([i915#31]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-hsw5/igt@kms_setmode@basic.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-hsw5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][88] ([fdo#112080]) -> [PASS][89] +6 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][90] ([fdo#109276] / [fdo#112080]) -> [FAIL][91] ([IGT#28])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [FAIL][93] ([fdo#103375])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-kbl1/igt@kms_flip@flip-vs-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-kbl3/igt@kms_flip@flip-vs-suspend.html

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][94] ([fdo#111093]) -> ([FAIL][95], [FAIL][96]) ([fdo#108654] / [fdo#111093])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7550/shard-iclb6/igt@runner@aborted.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/shard-iclb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#6]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/6
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108654]: https://bugs.freedesktop.org/show_bug.cgi?id=108654
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111735]: https://bugs.freedesktop.org/show_bug.cgi?id=111735
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#766]: https://gitlab.freedesktop.org/drm/intel/issues/766
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3857
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7550: 27f0e06376a41073db2dd8e073af8edc2541e3a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3857: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3857/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
