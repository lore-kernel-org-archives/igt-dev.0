Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 16:00:33 -0000
Message-ID: <158031363396.5462.1482388190200895357@emeril.freedesktop.org>
References: <20200128091217.27112-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200128091217.27112-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev5=29?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev5)
URL   : https://patchwork.freedesktop.org/series/71810/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7829_full -> IGTPW_4014_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4014_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4014_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4014_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  
Known issues
------------

  Here are the changes found in IGTPW_4014_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-apl7/igt@gem_ctx_isolation@bcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-apl6/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb4/igt@gem_ctx_isolation@vcs1-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb8/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +10 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb4/igt@gem_ctx_persistence@vcs1-queued.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb7/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110841])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#109276]) +13 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +5 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#110789] / [fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-kbl7/igt@i915_suspend@forcewake.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-c:
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-c.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-c.html
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-kbl7/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-c.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-kbl1/igt@kms_busy@extended-modeset-hang-oldfb-with-reset-render-pipe-c.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#61])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw2/igt@kms_flip@flip-vs-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb2/igt@kms_psr@psr2_basic.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb1/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([CI#80] / [i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw6/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw4/igt@kms_vblank@pipe-c-wait-busy-hang.html

  * igt@perf@short-reads:
    - shard-apl:          [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#51])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-apl6/igt@perf@short-reads.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-apl8/igt@perf@short-reads.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#831])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][39] ([fdo#112080]) -> [PASS][40] +14 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][41] ([i915#694]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw8/igt@gem_caching@reads.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw6/igt@gem_caching@reads.html

  * igt@gem_ctx_persistence@vcs1-persistence:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [fdo#112080]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb3/igt@gem_ctx_persistence@vcs1-persistence.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb2/igt@gem_ctx_persistence@vcs1-persistence.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][45] ([fdo#109276]) -> [PASS][46] +24 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb8/igt@gem_exec_schedule@independent-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][47] ([i915#677]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +8 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb6/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][51] ([i915#58] / [k.org#198133]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][53] ([i915#413]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb3/igt@i915_pm_rps@reset.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb8/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][55] ([i915#553] / [i915#725]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw5/igt@i915_selftest@live_blt.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@kms_busy@extended-modeset-hang-newfb-render-pipe-c:
    - shard-hsw:          [INCOMPLETE][57] ([CI#80] / [i915#61]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-hsw7/igt@kms_busy@extended-modeset-hang-newfb-render-pipe-c.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-hsw2/igt@kms_busy@extended-modeset-hang-newfb-render-pipe-c.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][65] ([fdo#109276] / [fdo#112080]) -> [FAIL][66] ([IGT#28])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][67] ([IGT#28]) -> [SKIP][68] ([fdo#109276] / [fdo#112080])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][69] ([fdo#109276] / [fdo#112080]) -> [SKIP][70] ([fdo#112080]) +9 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@in-flight-10ms:
    - shard-glk:          [TIMEOUT][71] ([fdo#112271]) -> [INCOMPLETE][72] ([CI#80] / [i915#58] / [k.org#198133])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk5/igt@gem_eio@in-flight-10ms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk3/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-glk:          [INCOMPLETE][73] ([CI#80] / [i915#58] / [k.org#198133]) -> [TIMEOUT][74] ([fdo#112271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk8/igt@gem_eio@in-flight-contexts-10ms.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk9/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@kms:
    - shard-glk:          [INCOMPLETE][75] ([CI#80] / [i915#58] / [k.org#198133]) -> [INCOMPLETE][76] ([i915#58] / [k.org#198133])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk7/igt@gem_eio@kms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk6/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [TIMEOUT][77] ([fdo#112271]) -> [FAIL][78] ([i915#232])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-glk8/igt@gem_eio@unwedge-stress.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-glk4/igt@gem_eio@unwedge-stress.html
    - shard-apl:          [TIMEOUT][79] ([fdo#112271]) -> [INCOMPLETE][80] ([CI#80] / [fdo#103927]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-apl4/igt@gem_eio@unwedge-stress.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-apl6/igt@gem_eio@unwedge-stress.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][81] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][82] ([fdo#110789] / [fdo#111870] / [i915#478])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][83] ([i915#468]) -> [FAIL][84] ([i915#454])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-snb:          [INCOMPLETE][85] ([i915#82]) -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7829/shard-snb2/igt@i915_pm_rpm@gem-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/shard-snb2/igt@i915_pm_rpm@gem-idle.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5392 -> IGTPW_4014
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7829: d7c77ce081cc74a8e9f14a68769509ebabab5aa5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4014: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/index.html
  IGT_5392: fb8487a63fcbe1c129206c9303bfcd5feb0e3ee1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4014/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
