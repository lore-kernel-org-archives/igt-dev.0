Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Jan 2020 00:01:32 -0000
Message-ID: <157956489208.11481.13702692909274470794@emeril.freedesktop.org>
References: <20200118221600.3713905-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200118221600.3713905-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Exercise_VM=5FWAIT_ioctl?=
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

Series: i915: Exercise VM_WAIT ioctl
URL   : https://patchwork.freedesktop.org/series/72241/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7772_full -> IGTPW_3945_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3945_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_vm_wait@spin} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +6 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb2/igt@gem_vm_wait@spin.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7772_full and IGTPW_3945_full:

### New IGT tests (7) ###

  * igt@gem_vm_wait@basic:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@hang:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@invalid-flags:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@invalid-iova:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@invalid-mask:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@signal:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_vm_wait@spin:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3945_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][2] -> [SKIP][3] ([fdo#112080]) +17 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb5/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#180]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb5/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#112146]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@gem_exec_schedule@in-order-bsd.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-apl:          [PASS][10] -> [INCOMPLETE][11] ([CI#80] / [fdo#103927] / [i915#530])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-apl6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrash-inactive:
    - shard-apl:          [PASS][12] -> [TIMEOUT][13] ([fdo#112271] / [i915#530])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-apl7/igt@gem_persistent_relocs@forked-interruptible-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-snb:          [PASS][14] -> [FAIL][15] ([i915#520])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#520])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb6/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-kbl:          [PASS][18] -> [INCOMPLETE][19] ([fdo#103665] / [i915#530])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@gem_persistent_relocs@forked-thrashing.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl4/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#644])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#716])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#447])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#413]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@i915_pm_rps@reset.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][28] -> [DMESG-WARN][29] ([i915#180]) +5 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-apl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#79])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#34]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk7/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([fdo#108145] / [i915#699])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk2/igt@kms_flip_tiling@flip-x-tiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk8/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109642] / [fdo#111068])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109276]) +24 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb8/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [SKIP][42] ([fdo#109276] / [fdo#112080]) -> [PASS][43] +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [INCOMPLETE][44] ([i915#140]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_balancer@hang.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb3/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][46] ([i915#677]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd2:
    - shard-iclb:         [SKIP][48] ([fdo#109276]) -> [PASS][49] +15 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd2.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd2.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb6/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-hsw:          [INCOMPLETE][52] ([i915#530] / [i915#61]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-hsw8/igt@gem_persistent_relocs@forked-thrashing.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-hsw7/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][54] ([i915#644]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [INCOMPLETE][56] ([fdo#103665] / [i915#151]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][58] ([i915#72]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][60] ([i915#49]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][62] ([i915#49]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][66] ([fdo#109642] / [fdo#111068]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][68] ([fdo#109441]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-idle:
    - shard-snb:          [SKIP][70] ([fdo#109271]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb2/igt@kms_vblank@pipe-a-ts-continuation-idle.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb4/igt@kms_vblank@pipe-a-ts-continuation-idle.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][72] ([fdo#112080]) -> [PASS][73] +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@perf_pmu@busy-vcs1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][74] ([fdo#109276] / [fdo#112080]) -> [FAIL][75] ([IGT#28])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][76] ([i915#82]) -> [DMESG-WARN][77] ([i915#444] / [i915#503])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@gem_eio@kms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb4/igt@gem_eio@kms.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-kbl:          [INCOMPLETE][78] ([fdo#103665] / [i915#530]) -> [TIMEOUT][79] ([fdo#112271] / [i915#530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-kbl1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-kbl3/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [DMESG-WARN][80] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][81] ([fdo#111870] / [i915#478])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb1/igt@gem_userptr_blits@dmabuf-unsync.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-snb:          [SKIP][82] ([fdo#109271]) -> [INCOMPLETE][83] ([i915#82])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][84] ([fdo#109349]) -> [DMESG-WARN][85] ([fdo#107724])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@runner@aborted:
    - shard-glk:          [FAIL][86] ([i915#873] / [k.org#202321]) -> ([FAIL][87], [FAIL][88], [FAIL][89], [FAIL][90]) ([i915#873] / [i915#997] / [k.org#202321])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-glk7/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk4/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk3/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk8/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-glk8/igt@runner@aborted.html
    - shard-snb:          [FAIL][91] ([i915#873]) -> ([FAIL][92], [FAIL][93]) ([i915#436] / [i915#873])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7772/shard-snb5/igt@runner@aborted.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb4/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/shard-snb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#503]: https://gitlab.freedesktop.org/drm/intel/issues/503
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#873]: https://gitlab.freedesktop.org/drm/intel/issues/873
  [i915#997]: https://gitlab.freedesktop.org/drm/intel/issues/997
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5372 -> IGTPW_3945
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7772: f65c394056d8637ff151fa83d5d1613adc0932d2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/index.html
  IGT_5372: 0d00a27fbbd4d4a77d24499ea9811e07e65eb0ac @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3945/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
