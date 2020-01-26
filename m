Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 26 Jan 2020 22:22:11 -0000
Message-ID: <158007733177.5254.15619158560012493968@emeril.freedesktop.org>
References: <20200124170337.346187-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200124170337.346187-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcGVyZjog?=
 =?utf-8?q?Treat_Cometlake_as_an_alias_for_Coffeelake?=
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

Series: perf: Treat Cometlake as an alias for Coffeelake
URL   : https://patchwork.freedesktop.org/series/72545/
State : success

== Summary ==

CI Bug Log - changes from IGT_5383_full -> IGTPW_3993_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/index.html

Known issues
------------

  Here are the changes found in IGTPW_3993_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-iclb:         [PASS][1] -> [FAIL][2] ([i915#570])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb8/igt@gem_ctx_persistence@processes.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb6/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@rcs0-mixed-process:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#679])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk7/igt@gem_ctx_persistence@rcs0-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-glk2/igt@gem_ctx_persistence@rcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +5 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_mmap_gtt@basic-small-bo-tiledy:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#478]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_mmap_gtt@basic-small-bo-tiledy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-snb5/igt@gem_mmap_gtt@basic-small-bo-tiledy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][17] -> [TIMEOUT][18] ([fdo#112271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl1/igt@i915_selftest@live_gtt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl4/igt@i915_selftest@live_gtt.html

  * igt@i915_selftest@mock_requests:
    - shard-kbl:          [PASS][19] -> [INCOMPLETE][20] ([fdo#103665])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@i915_selftest@mock_requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl2/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#79])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#49]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [PASS][29] -> [INCOMPLETE][30] ([i915#123] / [i915#140])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#84])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk2/igt@perf@oa-exponents.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-glk1/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#112080]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109276]) +20 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb7/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#831])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +13 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@bcs0-mixed-process:
    - shard-iclb:         [FAIL][45] ([i915#679]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb3/igt@gem_ctx_persistence@bcs0-mixed-process.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb5/igt@gem_ctx_persistence@bcs0-mixed-process.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +12 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb7/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb2/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [SKIP][51] ([fdo#112146]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@gem_exec_schedule@preempt-other-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb6/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [FAIL][53] ([i915#874]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw7/igt@gem_pipe_control_store_loop@reused-buffer.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][57] ([i915#818]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw5/igt@gem_tiled_blits@normal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][59] ([fdo#111870] / [i915#478]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb1/igt@gem_userptr_blits@dmabuf-sync.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][61] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][63] ([fdo#103665]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_selftest@live_hangcheck:
    - shard-tglb:         [INCOMPLETE][65] ([i915#472]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb4/igt@i915_selftest@live_hangcheck.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-tglb6/igt@i915_selftest@live_hangcheck.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [INCOMPLETE][67] ([i915#140]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb7/igt@i915_selftest@mock_requests.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb6/igt@i915_selftest@mock_requests.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_color@pipe-a-ctm-max:
    - shard-kbl:          [FAIL][71] ([i915#168]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_color@pipe-a-ctm-max.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl6/igt@kms_color@pipe-a-ctm-max.html
    - shard-apl:          [FAIL][73] ([i915#168]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl4/igt@kms_color@pipe-a-ctm-max.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl6/igt@kms_color@pipe-a-ctm-max.html
    - shard-glk:          [FAIL][75] ([i915#168]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk4/igt@kms_color@pipe-a-ctm-max.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-glk4/igt@kms_color@pipe-a-ctm-max.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][77] ([i915#71]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb4/igt@kms_color@pipe-a-gamma.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-tglb8/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen:
    - shard-glk:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][81] ([i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
    - shard-kbl:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          [FAIL][85] ([i915#49]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
    - shard-kbl:          [FAIL][87] ([i915#49]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [FAIL][91] ([i915#49]) -> [PASS][92] +8 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb7/igt@kms_psr@psr2_sprite_blt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][95] ([IGT#28]) -> [SKIP][96] ([fdo#109276] / [fdo#112080])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][97] ([i915#694]) -> [FAIL][98] ([i915#818])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5383/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/shard-hsw2/igt@gem_tiled_blits@interruptible.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5383 -> IGTPW_3993

  CI-20190529: 20190529
  CI_DRM_7809: 861f608ce6e3c1a1ad320a5d18055601cff36e45 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3993: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/index.html
  IGT_5383: 81948d9e088db962c1fd413c93920cbc826f3d25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3993/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
