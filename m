Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 17:19:10 -0000
Message-ID: <158083675031.25090.841214652784802839@emeril.freedesktop.org>
References: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580503049.git.ashutosh.dixit@intel.com>
In-Reply-To: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580503049.git.ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bv2=2Ci-g-t=2C1/2=5D_lib/i915/gem=5Fmman=3A_Ad?=
 =?utf-8?b?ZCBnZW1fbW1hcF9fd2NfZXh0KCk=?=
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [v2,i-g-t,1/2] lib/i915/gem_mman: Add gem_mmap__wc_ext()
URL   : https://patchwork.freedesktop.org/series/72848/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5410_full -> IGTPW_4068_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4068_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4068_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4068_full:

### IGT changes ###

#### Possible regressions ####

  * igt@perf@disabled-read-error:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@perf@disabled-read-error.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb8/igt@perf@disabled-read-error.html

  
Known issues
------------

  Here are the changes found in IGTPW_4068_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([fdo#112179] / [i915#1099]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb1/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-tglb5/igt@gem_ctx_persistence@file.html
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1099]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@gem_ctx_persistence@file.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl1/igt@gem_ctx_persistence@file.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271] / [i915#1099]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk5/igt@gem_ctx_persistence@file.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-glk1/igt@gem_ctx_persistence@file.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112179] / [i915#1099]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_ctx_persistence@file.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb3/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#110841])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#677])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#694]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw6/igt@gem_partial_pwrite_pread@write-uncached.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw7/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [PASS][23] -> [INCOMPLETE][24] ([CI#80] / [i915#61])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw8/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][25] -> [DMESG-FAIL][26] ([i915#725])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw2/igt@i915_selftest@live_blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw7/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gt_pm:
    - shard-iclb:         [PASS][27] -> [DMESG-FAIL][28] ([fdo#108569])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb7/igt@i915_selftest@live_gt_pm.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb6/igt@i915_selftest@live_gt_pm.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-hsw:          [PASS][31] -> [FAIL][32] ([i915#57])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][33] -> [TIMEOUT][34] ([i915#1096])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_fbcon_fbt@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl3/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-glk8/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [PASS][39] -> [SKIP][40] ([i915#668]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl7/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl2/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109276]) +21 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [SKIP][47] ([fdo#112179] / [i915#1099]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_ctx_persistence@process.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb4/igt@gem_ctx_persistence@process.html
    - shard-tglb:         [SKIP][49] ([fdo#112179] / [i915#1099]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb5/igt@gem_ctx_persistence@process.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-tglb3/igt@gem_ctx_persistence@process.html
    - shard-glk:          [SKIP][51] ([fdo#109271] / [i915#1099]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk2/igt@gem_ctx_persistence@process.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-glk9/igt@gem_ctx_persistence@process.html
    - shard-apl:          [SKIP][53] ([fdo#109271] / [i915#1099]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@gem_ctx_persistence@process.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl2/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl4/igt@gem_eio@in-flight-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-apl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][57] ([fdo#110854]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +12 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_exec_schedule@fifo-bsd1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb1/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb7/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][65] ([i915#694]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][67] ([fdo#109642] / [fdo#111068]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@kms_psr@psr2_cursor_render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [TIMEOUT][71] ([i915#1096]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][73] ([fdo#112080]) -> [PASS][74] +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][75] ([IGT#28]) -> [SKIP][76] ([fdo#112080])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][77] ([i915#818]) -> [FAIL][78] ([i915#694])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1096]: https://gitlab.freedesktop.org/drm/intel/issues/1096
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4068

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4068: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4068/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
