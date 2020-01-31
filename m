Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 05:48:42 -0000
Message-ID: <158044972274.13121.13698387931661893783@emeril.freedesktop.org>
References: <20200129065018.16971-1-swati2.sharma@intel.com>
In-Reply-To: <20200129065018.16971-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIHRl?=
 =?utf-8?q?sts_for_HDR_metadata_interfaces_and_bpc_switch_=28rev3=29?=
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add tests for HDR metadata interfaces and bpc switch (rev3)
URL   : https://patchwork.freedesktop.org/series/71524/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5396_full -> IGTPW_4024_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4024_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4024_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4024_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb5/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb1/igt@gem_exec_suspend@basic-s0.html

  * {igt@kms_hdr@bpc-switch-dpms} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw5/igt@kms_hdr@bpc-switch-dpms.html

  * {igt@kms_hdr@static-toggle} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb1/igt@kms_hdr@static-toggle.html

  * {igt@kms_hdr@static-toggle-dpms} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html

  
New tests
---------

  New tests have been introduced between IGT_5396_full and IGTPW_4024_full:

### New IGT tests (7) ###

  * igt@kms_hdr@bpc-switch:
    - Statuses : 1 fail(s) 5 pass(s)
    - Exec time: [0.65, 3.65] s

  * igt@kms_hdr@bpc-switch-dpms:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.82] s

  * igt@kms_hdr@bpc-switch-suspend:
    - Statuses : 1 fail(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 6.59] s

  * igt@kms_hdr@static-swap:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle-dpms:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_hdr@static-toggle-suspend:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4024_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#180]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_shared@exec-shared-gtt-blt:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#616])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-tglb7/igt@gem_ctx_shared@exec-shared-gtt-blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-blt.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#112080]) +7 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([i915#677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_partial_pwrite_pread@reads-snoop:
    - shard-hsw:          [PASS][16] -> [FAIL][17] ([i915#694])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw8/igt@gem_partial_pwrite_pread@reads-snoop.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw1/igt@gem_partial_pwrite_pread@reads-snoop.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#413])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#180]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled:
    - shard-snb:          [PASS][22] -> [SKIP][23] ([fdo#109271])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-xtiled.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][24] -> [SKIP][25] ([fdo#109441]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][26] -> [FAIL][27] ([i915#831])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109276]) +16 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-cleanup:
    - shard-iclb:         [SKIP][30] ([fdo#109276] / [fdo#112080]) -> [PASS][31] +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb7/igt@gem_ctx_persistence@vcs1-cleanup.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb4/igt@gem_ctx_persistence@vcs1-cleanup.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-tglb:         [FAIL][32] ([i915#616]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-tglb3/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][34] ([fdo#110841]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [INCOMPLETE][36] ([i915#61]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw2/igt@gem_exec_parallel@rcs0-fds.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw6/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][38] ([i915#677]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][40] ([fdo#112146]) -> [PASS][41] +7 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@gem_exec_schedule@preempt-bsd.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb8/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][42] ([fdo#109276]) -> [PASS][43] +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [FAIL][44] ([i915#694]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][46] ([i915#180]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][48] ([fdo#111870] / [i915#478]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][50] ([i915#58] / [k.org#198133]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][52] ([i915#79]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][56] ([fdo#109441]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][58] ([i915#31]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl7/igt@kms_setmode@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-apl6/igt@kms_setmode@basic.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [DMESG-WARN][60] ([i915#645]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@perf@disabled-read-error.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb1/igt@perf@disabled-read-error.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [SKIP][62] ([fdo#112080]) -> [PASS][63] +8 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb3/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-iclb2/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [FAIL][64] ([i915#914]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw1/igt@prime_mmap_coherency@read.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw7/igt@prime_mmap_coherency@read.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-10ms:
    - shard-apl:          [INCOMPLETE][66] ([CI#80] / [fdo#103927]) -> [TIMEOUT][67] ([fdo#112271])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl4/igt@gem_eio@in-flight-10ms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-apl6/igt@gem_eio@in-flight-10ms.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing:
    - shard-snb:          [DMESG-FAIL][68] ([i915#1045]) -> [FAIL][69] ([i915#1045])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-snb5/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrashing.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][70] ([i915#694]) -> [FAIL][71] ([i915#818])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw2/igt@gem_tiled_blits@interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][72] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][73] ([fdo#111870] / [i915#478])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-snb:          [SKIP][74] ([fdo#109271]) -> [INCOMPLETE][75] ([i915#82])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb6/igt@i915_pm_rpm@cursor-dpms.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-snb6/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][76] ([i915#180]) -> [INCOMPLETE][77] ([fdo#103665])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl4/igt@i915_suspend@debugfs-reader.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-kbl1/igt@i915_suspend@debugfs-reader.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][78] ([fdo#112271] / [i915#472]) -> [TIMEOUT][79] ([fdo#112271] / [i915#1085] / [i915#472])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
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
  [i915#1045]: https://gitlab.freedesktop.org/drm/intel/issues/1045
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5396 -> IGTPW_4024

  CI-20190529: 20190529
  CI_DRM_7833: 8210f0f999e2d396a8611e0cabc2f6c6a52468de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4024: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/index.html
  IGT_5396: b85f96d6aa71795684b14d3b3d4c752dd61ff62e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4024/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
