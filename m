Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 24 Jan 2020 16:06:11 -0000
Message-ID: <157988197108.15091.159983232495584517@emeril.freedesktop.org>
References: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fisolation=3A_Use_static_iterator?=
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_ctx_isolation: Use static iterator
URL   : https://patchwork.freedesktop.org/series/72461/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5379_full -> IGTPW_3977_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3977_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3977_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3977_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_vm_create@isolation:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk3/igt@gem_vm_create@isolation.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk4/igt@gem_vm_create@isolation.html

  
Known issues
------------

  Here are the changes found in IGTPW_3977_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#570])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl6/igt@gem_ctx_persistence@processes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-apl3/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#677]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb8/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb4/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-y:
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb4/igt@gem_fence_thrash@bo-write-verify-threaded-y.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb1/igt@gem_fence_thrash@bo-write-verify-threaded-y.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-snb:          [PASS][15] -> [INCOMPLETE][16] ([i915#82])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][17] -> [INCOMPLETE][18] ([fdo#103665]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl1/igt@gem_persistent_relocs@forked-thrashing.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-kbl6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#644])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][21] -> [INCOMPLETE][22] ([i915#58] / [k.org#198133])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_selftest@live_execlists:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103665] / [fdo#112259])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl3/igt@i915_selftest@live_execlists.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-kbl7/igt@i915_selftest@live_execlists.html

  * igt@i915_selftest@mock_requests:
    - shard-iclb:         [PASS][25] -> [INCOMPLETE][26] ([i915#140])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb3/igt@i915_selftest@mock_requests.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb1/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][27] -> [FAIL][28] ([i915#57])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#34])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#49]) +6 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [PASS][41] -> [FAIL][42] ([i915#31])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][43] -> [DMESG-WARN][44] ([i915#180]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][45] -> [INCOMPLETE][46] ([i915#61]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109276]) +13 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50] +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@vcs0-mixed-process:
    - shard-glk:          [FAIL][51] ([i915#679]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk2/igt@gem_ctx_persistence@vcs0-mixed-process.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk3/igt@gem_ctx_persistence@vcs0-mixed-process.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [fdo#112080]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb1/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#110841]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_exec_schedule@pi-userfault-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb5/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +19 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [FAIL][63] ([i915#520]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb1/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-apl:          [INCOMPLETE][65] ([fdo#103927] / [i915#530]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-apl3/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [INCOMPLETE][67] ([fdo#109100] / [i915#140]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb3/igt@gem_persistent_relocs@forked-thrashing.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-hsw:          [FAIL][69] ([i915#874]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw1/igt@gem_pipe_control_store_loop@reused-buffer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw6/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl2/igt@gem_softpin@noreloc-s3.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][73] ([fdo#111870] / [i915#478]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [INCOMPLETE][75] ([fdo#103665]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl1/igt@gem_workarounds@suspend-resume.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-kbl2/igt@gem_workarounds@suspend-resume.html

  * igt@i915_selftest@mock_requests:
    - shard-snb:          [INCOMPLETE][77] ([i915#82]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb6/igt@i915_selftest@mock_requests.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb5/igt@i915_selftest@mock_requests.html

  * igt@kms_cursor_crc@pipe-c-cursor-dpms:
    - shard-apl:          [FAIL][79] ([i915#54]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82] +8 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][83] ([i915#72]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-snb:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb5/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-toggle:
    - shard-hsw:          [INCOMPLETE][87] ([i915#61]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw4/igt@kms_cursor_legacy@cursora-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [FAIL][91] ([i915#49]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][95] ([IGT#28]) -> [SKIP][96] ([fdo#109276] / [fdo#112080])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][97] ([i915#530] / [i915#61]) -> [INCOMPLETE][98] ([i915#61]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw2/igt@gem_persistent_relocs@forked-thrashing.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw6/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][99] ([i915#818]) -> [FAIL][100] ([i915#694])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw2/igt@gem_tiled_blits@normal.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw1/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][101] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][102] ([fdo#111870] / [i915#478])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb6/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@reg-read-ioctl:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [INCOMPLETE][104] ([i915#82])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-snb5/igt@i915_pm_rpm@reg-read-ioctl.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-snb4/igt@i915_pm_rpm@reg-read-ioctl.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][105] ([i915#563]) -> [DMESG-FAIL][106] ([i915#553] / [i915#725])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5379/shard-hsw5/igt@i915_selftest@live_blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/shard-hsw1/igt@i915_selftest@live_blt.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#874]: https://gitlab.freedesktop.org/drm/intel/issues/874
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5379 -> IGTPW_3977

  CI-20190529: 20190529
  CI_DRM_7801: 6e1cfbab49286533a902e0c265249b80e5cf71da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html
  IGT_5379: b8d03fef6f135c27b3f45f820e62d40aac956471 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3977/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
