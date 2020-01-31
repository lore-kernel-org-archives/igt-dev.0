Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jan 2020 02:50:38 -0000
Message-ID: <158043903896.13120.1526700707979050531@emeril.freedesktop.org>
References: <20200129032605.9007-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200129032605.9007-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev8=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev8)
URL   : https://patchwork.freedesktop.org/series/72334/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5396_full -> IGTPW_4023_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4023_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4023_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4023_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  
Known issues
------------

  Here are the changes found in IGTPW_4023_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +13 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb7/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +8 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-kbl3/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb7/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#413])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-random:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#54]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x42-random.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#34])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_mmap_coherency@write:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#914])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw2/igt@prime_mmap_coherency@write.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw1/igt@prime_mmap_coherency@write.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109276]) +13 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@hang}:
    - shard-kbl:          [FAIL][35] ([i915#1074]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl1/igt@gem_ctx_persistence@hang.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-kbl2/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@vcs1-hostile-preempt:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [fdo#112080]) -> [PASS][38] +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb3/igt@gem_ctx_persistence@vcs1-hostile-preempt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb4/igt@gem_ctx_persistence@vcs1-hostile-preempt.html

  * igt@gem_ctx_shared@exec-shared-gtt-bsd:
    - shard-tglb:         [FAIL][39] ([i915#616]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-bsd.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#110841]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [INCOMPLETE][43] ([i915#61]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw2/igt@gem_exec_parallel@rcs0-fds.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw8/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +17 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb7/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][51] ([i915#180]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl6/igt@gem_softpin@noreloc-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-kbl4/igt@gem_workarounds@suspend-resume.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][55] ([i915#694]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw6/igt@gen7_exec_parse@basic-allocation.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [INCOMPLETE][57] ([i915#58] / [k.org#198133]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][59] ([i915#79]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [DMESG-WARN][63] ([i915#645]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb2/igt@perf@disabled-read-error.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb3/igt@perf@disabled-read-error.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][65] ([fdo#112080]) -> [PASS][66] +15 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [FAIL][67] ([i915#914]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-hsw1/igt@prime_mmap_coherency@read.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-hsw7/igt@prime_mmap_coherency@read.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-10ms:
    - shard-apl:          [INCOMPLETE][69] ([CI#80] / [fdo#103927]) -> [TIMEOUT][70] ([fdo#112271])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl4/igt@gem_eio@in-flight-10ms.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl3/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@kms:
    - shard-apl:          [INCOMPLETE][71] ([CI#80] / [fdo#103927]) -> [INCOMPLETE][72] ([fdo#103927])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-apl1/igt@gem_eio@kms.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-apl8/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][73] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][74] ([fdo#111870] / [i915#478])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][75] ([fdo#112271] / [i915#472]) -> [TIMEOUT][76] ([fdo#112271] / [i915#1085] / [i915#472])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5396/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1074]: https://gitlab.freedesktop.org/drm/intel/issues/1074
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#914]: https://gitlab.freedesktop.org/drm/intel/issues/914
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5396 -> IGTPW_4023

  CI-20190529: 20190529
  CI_DRM_7833: 8210f0f999e2d396a8611e0cabc2f6c6a52468de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4023: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/index.html
  IGT_5396: b85f96d6aa71795684b14d3b3d4c752dd61ff62e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4023/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
