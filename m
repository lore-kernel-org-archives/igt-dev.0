Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 15:24:19 -0000
Message-ID: <158082985995.25090.4807457114601017387@emeril.freedesktop.org>
References: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580499870.git.ashutosh.dixit@intel.com>
In-Reply-To: <bfc5383a40425ee2071a44ca75be5c55b7378bed.1580499870.git.ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/gem=5Fmman=3A_Add_gem?=
 =?utf-8?b?X21tYXBfX3djX2V4dCgp?=
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

Series: series starting with [i-g-t,1/2] lib/i915/gem_mman: Add gem_mmap__wc_ext()
URL   : https://patchwork.freedesktop.org/series/72841/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5410_full -> IGTPW_4066_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4066_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4066_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4066_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][1] -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_ctx_persistence@legacy-engines-hostile@render}:
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-kbl7/igt@gem_ctx_persistence@legacy-engines-hostile@render.html

  
Known issues
------------

  Here are the changes found in IGTPW_4066_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([fdo#112080]) +12 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb8/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][6] -> [SKIP][7] ([fdo#112179] / [i915#1099]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb1/igt@gem_ctx_persistence@file.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb3/igt@gem_ctx_persistence@file.html
    - shard-apl:          [PASS][8] -> [SKIP][9] ([fdo#109271] / [i915#1099]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@gem_ctx_persistence@file.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-apl3/igt@gem_ctx_persistence@file.html
    - shard-glk:          [PASS][10] -> [SKIP][11] ([fdo#109271] / [i915#1099]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk5/igt@gem_ctx_persistence@file.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-glk2/igt@gem_ctx_persistence@file.html
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112179] / [i915#1099]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_ctx_persistence@file.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb5/igt@gem_ctx_persistence@file.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#110841])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#109276]) +19 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb3/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#677]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112146]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_offset@basic-uaf:
    - shard-snb:          [PASS][22] -> [DMESG-WARN][23] ([i915#478]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-snb2/igt@gem_mmap_offset@basic-uaf.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-snb2/igt@gem_mmap_offset@basic-uaf.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][24] -> [FAIL][25] ([i915#644])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#180])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-apl6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#818])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw8/igt@gem_tiled_blits@normal.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-hsw6/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_rpm@cursor:
    - shard-iclb:         [PASS][30] -> [INCOMPLETE][31] ([i915#189])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@i915_pm_rpm@cursor.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb2/igt@i915_pm_rpm@cursor.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][32] -> [DMESG-FAIL][33] ([i915#553] / [i915#725])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw2/igt@i915_selftest@live_blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-hsw1/igt@i915_selftest@live_blt.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-tglb:         [PASS][34] -> [SKIP][35] ([i915#668]) +6 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb7/igt@kms_psr@psr2_sprite_blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb1/igt@kms_psr@psr2_sprite_blt.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][36] -> [FAIL][37] ([i915#831])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@hang}:
    - shard-tglb:         [SKIP][38] ([i915#1099]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb2/igt@gem_ctx_persistence@hang.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb5/igt@gem_ctx_persistence@hang.html
    - shard-iclb:         [SKIP][40] ([i915#1099]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_ctx_persistence@hang.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb3/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@process:
    - shard-iclb:         [SKIP][42] ([fdo#112179] / [i915#1099]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@gem_ctx_persistence@process.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb3/igt@gem_ctx_persistence@process.html
    - shard-tglb:         [SKIP][44] ([fdo#112179] / [i915#1099]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb5/igt@gem_ctx_persistence@process.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb1/igt@gem_ctx_persistence@process.html
    - shard-glk:          [SKIP][46] ([fdo#109271] / [i915#1099]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk2/igt@gem_ctx_persistence@process.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-glk7/igt@gem_ctx_persistence@process.html
    - shard-apl:          [SKIP][48] ([fdo#109271] / [i915#1099]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@gem_ctx_persistence@process.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-apl2/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][52] ([i915#677]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][54] ([fdo#109276]) -> [PASS][55] +19 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][56] ([i915#694]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][58] ([fdo#111870] / [i915#478]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@universal-planes-dpms:
    - shard-tglb:         [INCOMPLETE][60] ([i915#472]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb7/igt@i915_pm_rpm@universal-planes-dpms.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb2/igt@i915_pm_rpm@universal-planes-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-tglb:         [FAIL][62] ([i915#413]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb7/igt@i915_pm_rps@waitboost.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb8/igt@i915_pm_rps@waitboost.html
    - shard-iclb:         [FAIL][64] ([i915#413]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@i915_pm_rps@waitboost.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][68] ([fdo#109642] / [fdo#111068]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb1/igt@kms_psr2_su@frontbuffer.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][70] ([fdo#109441]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [TIMEOUT][72] ([i915#1096]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb2/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][76] ([IGT#28]) -> [SKIP][77] ([fdo#112080])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-iclb7/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][78] ([i915#468]) -> [FAIL][79] ([i915#454])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1096]: https://gitlab.freedesktop.org/drm/intel/issues/1096
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4066

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4066: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4066/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
