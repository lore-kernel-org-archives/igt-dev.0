Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 01 Mar 2020 01:54:07 -0000
Message-ID: <158302764746.22450.6787213735573132385@emeril.freedesktop.org>
References: <20200228111338.1669251-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200228111338.1669251-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=3A_add_a_stress_test_opening/closing_the_stream_=28rev2=29?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/perf: add a stress test opening/closing the stream (rev2)
URL   : https://patchwork.freedesktop.org/series/74002/
State : success

== Summary ==

CI Bug Log - changes from IGT_5475_full -> IGTPW_4239_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4239_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4239_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4239_full:

### IGT changes ###

#### Warnings ####

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7]) ([fdo#111870] / [i915#478]) -> ([FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15]) ([fdo#111870])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw7/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw1/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw6/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw5/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw4/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw4/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw6/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw7/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw4/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@stress-open-close}:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb2/igt@perf@stress-open-close.html

  
Known issues
------------

  Here are the changes found in IGTPW_4239_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#109276] / [i915#677]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd2.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#677])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276]) +12 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb6/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112146]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#644])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [PASS][27] -> [DMESG-WARN][28] ([fdo#111870]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw7/igt@gem_userptr_blits@sync-unmap-after-close.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw1/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [PASS][29] -> [DMESG-WARN][30] ([fdo#111870] / [i915#478]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb6/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#1316])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb4/igt@i915_pm_rpm@dpms-lpsp.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb3/igt@i915_pm_rpm@dpms-lpsp.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#1316])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb7/igt@i915_pm_rpm@dpms-lpsp.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-tglb7/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl2/igt@kms_flip@flip-vs-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-apl6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][41] -> [INCOMPLETE][42] ([i915#61]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-snb:          [PASS][43] -> [DMESG-WARN][44] ([i915#478])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#899])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#173])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@kms_psr@no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb5/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#31])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl7/igt@kms_setmode@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][59] -> [SKIP][60] ([fdo#112015])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][61] -> [SKIP][62] ([fdo#109271])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#109278])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf@oa-exponents:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#84])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk9/igt@perf@oa-exponents.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk3/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#112080]) +14 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb7/igt@perf_pmu@busy-no-semaphores-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][69] ([i915#1277]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb6/igt@gem_exec_balancer@hang.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-tglb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_reloc@basic-gtt-cpu-active:
    - shard-snb:          [DMESG-WARN][71] ([i915#478]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
    - shard-hsw:          [DMESG-WARN][73] ([i915#478]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw5/igt@gem_exec_reloc@basic-gtt-cpu-active.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw7/igt@gem_exec_reloc@basic-gtt-cpu-active.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][75] ([fdo#109276] / [i915#677]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb8/igt@gem_exec_schedule@implicit-both-bsd1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][77] ([i915#677]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb8/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][79] ([fdo#112146]) -> [PASS][80] +6 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][81] ([fdo#109276]) -> [PASS][82] +21 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][83] ([i915#644]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [FAIL][85] ([i915#644]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-tglb1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][87] ([fdo#111870] / [i915#478]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][89] ([fdo#111870]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw4/igt@gem_userptr_blits@sync-unmap.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][91] ([i915#716]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][93] ([fdo#112080]) -> [PASS][94] +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb4/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][95] ([i915#447]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98] +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][99] ([i915#72]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][101] ([i915#79]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-glk:          [FAIL][103] ([i915#34]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][107] ([i915#180]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][109] ([IGT#28]) -> [SKIP][110] ([fdo#112080])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-hsw:          [DMESG-WARN][111] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][112] ([fdo#111870])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][113] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][114] ([fdo#110789] / [fdo#111870] / [i915#478])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-hsw:          [DMESG-WARN][115] ([fdo#111870]) -> [DMESG-WARN][116] ([fdo#110789] / [fdo#111870])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         [INCOMPLETE][117] ([i915#1233]) -> [DMESG-FAIL][118] ([i915#1233])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-tglb5/igt@i915_selftest@live@gt_lrc.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-tglb7/igt@i915_selftest@live@gt_lrc.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([fdo#111870] / [i915#1077]) -> ([FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#111870] / [i915#1077] / [i915#698])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb4/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5475/shard-snb6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb6/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb5/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/shard-snb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#84]: https://gitlab.freedesktop.org/drm/intel/issues/84
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5475 -> IGTPW_4239

  CI-20190529: 20190529
  CI_DRM_8026: 6ce18c241dde9ee20b19ff42f8198552a57ab259 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4239: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html
  IGT_5475: ca52e3cb94072f8a6c59f6379f569f79e71a088b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4239/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
