Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 04 Feb 2020 19:18:16 -0000
Message-ID: <158084389622.25087.8359990883989871396@emeril.freedesktop.org>
References: <20200201001135.10927-1-antonio.argenziano@intel.com>
In-Reply-To: <20200201001135.10927-1-antonio.argenziano@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffaulting=5Freloc=3A_Use_a_coherent_mapping?=
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_exec_faulting_reloc: Use a coherent mapping
URL   : https://patchwork.freedesktop.org/series/72859/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5410_full -> IGTPW_4069_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4069_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4069_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4069_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-iclb:         [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  
Known issues
------------

  Here are the changes found in IGTPW_4069_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112080]) +12 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@file:
    - shard-tglb:         [PASS][5] -> [SKIP][6] ([fdo#112179] / [i915#1099]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb1/igt@gem_ctx_persistence@file.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-tglb3/igt@gem_ctx_persistence@file.html
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1099]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@gem_ctx_persistence@file.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl8/igt@gem_ctx_persistence@file.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271] / [i915#1099]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk5/igt@gem_ctx_persistence@file.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk4/igt@gem_ctx_persistence@file.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112179] / [i915#1099]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_ctx_persistence@file.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb2/igt@gem_ctx_persistence@file.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_schedule@pi-userfault-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@gem_exec_schedule@preempt-other-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb2/igt@gem_exec_schedule@preempt-other-bsd.html

  * igt@gem_exec_whisper@normal:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#118] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk4/igt@gem_exec_whisper@normal.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk8/igt@gem_exec_whisper@normal.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#694])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw8/igt@gem_tiled_blits@normal.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][21] -> [DMESG-FAIL][22] ([i915#553])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw2/igt@i915_selftest@live_blt.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-hsw2/igt@i915_selftest@live_blt.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-apl:          [PASS][23] -> [DMESG-FAIL][24] ([i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl2/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-random:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-256x256-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#72])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#79])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl2/igt@kms_flip@flip-vs-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#31])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl7/igt@kms_setmode@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl1/igt@kms_setmode@basic.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +16 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb3/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][43] -> [FAIL][44] ([i915#831])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@processes:
    - shard-apl:          [SKIP][45] ([fdo#109271] / [i915#1099]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl4/igt@gem_ctx_persistence@processes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl2/igt@gem_ctx_persistence@processes.html
    - shard-iclb:         [SKIP][47] ([fdo#112179] / [i915#1099]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_ctx_persistence@processes.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb5/igt@gem_ctx_persistence@processes.html
    - shard-glk:          [SKIP][49] ([fdo#109271] / [i915#1099]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-glk7/igt@gem_ctx_persistence@processes.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-glk7/igt@gem_ctx_persistence@processes.html
    - shard-tglb:         [SKIP][51] ([fdo#112179] / [i915#1099]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb1/igt@gem_ctx_persistence@processes.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-tglb3/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][53] ([fdo#110854]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][55] ([fdo#112080]) -> [PASS][56] +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][59] ([fdo#109276]) -> [PASS][60] +15 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-hsw:          [FAIL][63] ([i915#694]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@i915_pm_rpm@universal-planes-dpms:
    - shard-tglb:         [INCOMPLETE][65] ([i915#472]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb7/igt@i915_pm_rpm@universal-planes-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-tglb5/igt@i915_pm_rpm@universal-planes-dpms.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][67] ([i915#180]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb7/igt@kms_psr@psr2_basic.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][71] ([i915#31]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-hsw2/igt@kms_setmode@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-hsw8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-iclb:         [TIMEOUT][73] ([i915#1096]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][75] ([IGT#28]) -> [SKIP][76] ([fdo#112080])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][77] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][78] ([fdo#110789] / [fdo#111870] / [i915#478])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][79] ([i915#468]) -> [FAIL][80] ([i915#454])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5410/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/shard-tglb7/igt@i915_pm_dc@dc6-dpms.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112179]: https://bugs.freedesktop.org/show_bug.cgi?id=112179
  [i915#1096]: https://gitlab.freedesktop.org/drm/intel/issues/1096
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5410 -> IGTPW_4069

  CI-20190529: 20190529
  CI_DRM_7853: 1df04205c16923e525efe9c26d6e98612d38c9b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4069: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/index.html
  IGT_5410: 9d3872ede14307ef4adb0866f8474f5c41e6b1c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4069/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
