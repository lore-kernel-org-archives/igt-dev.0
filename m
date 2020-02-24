Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 12:12:45 -0000
Message-ID: <158254636523.28361.17415421487791457216@emeril.freedesktop.org>
References: <20200221193808.2849185-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200221193808.2849185-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNTog?=
 =?utf-8?q?Drop_gem=5Fexec=5Freuse?=
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

Series: i915: Drop gem_exec_reuse
URL   : https://patchwork.freedesktop.org/series/73790/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5458_full -> IGTPW_4214_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4214_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4214_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4214_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@perf@invalid-remove-userspace-config.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb4/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][3] ([fdo#109289]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@perf@unprivileged-single-ctx-counters.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb5/igt@perf@unprivileged-single-ctx-counters.html

  
Known issues
------------

  Here are the changes found in IGTPW_4214_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +10 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb6/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [PASS][11] -> [DMESG-FAIL][12] ([i915#1233])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb3/igt@i915_selftest@live_gt_lrc.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb1/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl7/igt@i915_suspend@sysfs-reader.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +6 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#173])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@kms_psr@no_drrs.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109441])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb6/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@short-reads:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([fdo#112172]) +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb6/igt@perf@short-reads.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb1/igt@perf@short-reads.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109276]) +20 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         [PASS][27] -> [TIMEOUT][28] ([fdo#112271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb5/igt@sw_sync@sync_multi_producer_single_consumer.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb3/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][29] ([fdo#110854]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][31] ([fdo#112080]) -> [PASS][32] +11 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb2/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-both-bsd}:
    - shard-iclb:         [SKIP][33] ([i915#677]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd.html

  * {igt@gem_exec_schedule@implicit-both-bsd2}:
    - shard-iclb:         [SKIP][35] ([fdo#109276] / [i915#677]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd2.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][37] ([fdo#112146]) -> [PASS][38] +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40] +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][41] ([i915#644]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][43] ([fdo#111870] / [i915#478]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][45] ([i915#454]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][47] ([i915#413]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][51] ([i915#79]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-apl:          [DMESG-WARN][53] ([i915#1297]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl2/igt@kms_flip@flip-vs-rmfb.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-apl4/igt@kms_flip@flip-vs-rmfb.html
    - shard-kbl:          [DMESG-WARN][55] ([i915#1297]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl7/igt@kms_flip@flip-vs-rmfb.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl6/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [SKIP][57] ([i915#668]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-apl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@blocking:
    - shard-tglb:         [SKIP][63] ([fdo#112172]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb3/igt@perf@blocking.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb3/igt@perf@blocking.html

  * igt@perf@missing-sample-flags:
    - shard-iclb:         [SKIP][65] -> [PASS][66] +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb4/igt@perf@missing-sample-flags.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb1/igt@perf@missing-sample-flags.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-snb:          [TIMEOUT][67] ([fdo#112271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-snb4/igt@sw_sync@sync_multi_producer_single_consumer.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-snb6/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-iclb:         [TIMEOUT][69] ([fdo#112271]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@sw_sync@sync_multi_producer_single_consumer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][71] ([IGT#28]) -> [SKIP][72] ([fdo#112080])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          [TIMEOUT][73] ([fdo#112271] / [i915#727]) -> [TIMEOUT][74] ([fdo#112271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl7/igt@kms_content_protection@atomic-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][75] ([fdo#112271]) -> [TIMEOUT][76] ([fdo#112271] / [i915#727])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-kbl2/igt@kms_content_protection@srm.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-kbl2/igt@kms_content_protection@srm.html

  * igt@perf@mi-rpc:
    - shard-tglb:         [SKIP][77] ([fdo#112172]) -> [SKIP][78] ([fdo#109289]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb7/igt@perf@mi-rpc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb1/igt@perf@mi-rpc.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         [SKIP][79] -> [SKIP][80] ([fdo#109289])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-iclb3/igt@perf@per-context-mode-unprivileged.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-iclb6/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglb:         [SKIP][81] ([fdo#109289]) -> [SKIP][82] ([fdo#112172])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5458/shard-tglb6/igt@perf@unprivileged-single-ctx-counters.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/shard-tglb7/igt@perf@unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112172]: https://bugs.freedesktop.org/show_bug.cgi?id=112172
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5458 -> IGTPW_4214

  CI-20190529: 20190529
  CI_DRM_7982: f02659605b48dcabb562bbb96db2996b334e57fd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4214: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/index.html
  IGT_5458: 5f7e4ae6a91ed2c104593b8abd5b71a6cc96fc10 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4214/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
