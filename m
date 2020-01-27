Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 27 Jan 2020 19:53:05 -0000
Message-ID: <158015478535.9685.8139300282242770880@emeril.freedesktop.org>
References: <20200126134811.2084060-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200126134811.2084060-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915=3A_Inject_invalid_CS_into?=
 =?utf-8?q?_hanging_spinners?=
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

Series: series starting with [i-g-t,1/2] i915: Inject invalid CS into hanging spinners
URL   : https://patchwork.freedesktop.org/series/72587/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7814_full -> IGTPW_3996_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3996_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3996_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3996_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_persistence@hang} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl4/igt@gem_ctx_persistence@hang.html

  * igt@gem_exec_schedule@reorder-wide-vebox:
    - shard-kbl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl4/igt@gem_exec_schedule@reorder-wide-vebox.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl4/igt@gem_exec_schedule@reorder-wide-vebox.html

  * igt@prime_mmap_coherency@read:
    - shard-hsw:          [PASS][4] -> [FAIL][5] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw6/igt@prime_mmap_coherency@read.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw8/igt@prime_mmap_coherency@read.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7814_full and IGTPW_3996_full:

### New IGT tests (2) ###

  * igt@gem_ctx_persistence@hang:
    - Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@gem_ctx_persistence@hostile:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  

Known issues
------------

  Here are the changes found in IGTPW_3996_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#109276] / [fdo#112080]) +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb3/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_eio@in-flight-10ms:
    - shard-kbl:          [PASS][8] -> [TIMEOUT][9] ([fdo#112271]) +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl3/igt@gem_eio@in-flight-10ms.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl7/igt@gem_eio@in-flight-10ms.html
    - shard-snb:          [PASS][10] -> [INCOMPLETE][11] ([i915#82]) +5 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb5/igt@gem_eio@in-flight-10ms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb2/igt@gem_eio@in-flight-10ms.html

  * igt@gem_eio@kms:
    - shard-apl:          [PASS][12] -> [INCOMPLETE][13] ([CI#80] / [fdo#103927])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-apl2/igt@gem_eio@kms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-apl6/igt@gem_eio@kms.html
    - shard-glk:          [PASS][14] -> [INCOMPLETE][15] ([CI#80] / [i915#58] / [k.org#198133]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-glk2/igt@gem_eio@kms.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-glk2/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][16] -> [TIMEOUT][17] ([fdo#112271]) +6 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-glk7/igt@gem_eio@unwedge-stress.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-glk4/igt@gem_eio@unwedge-stress.html
    - shard-apl:          [PASS][18] -> [TIMEOUT][19] ([fdo#112271]) +7 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-apl1/igt@gem_eio@unwedge-stress.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-apl8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_parallel@vcs1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#112080]) +3 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb2/igt@gem_exec_parallel@vcs1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb5/igt@gem_exec_parallel@vcs1.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([fdo#112146]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_mmap_wc@close:
    - shard-tglb:         [PASS][24] -> [INCOMPLETE][25] ([i915#472])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-tglb2/igt@gem_mmap_wc@close.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-tglb6/igt@gem_mmap_wc@close.html

  * igt@gem_persistent_relocs@forked:
    - shard-snb:          [PASS][26] -> [DMESG-WARN][27] ([i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb1/igt@gem_persistent_relocs@forked.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb5/igt@gem_persistent_relocs@forked.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#447])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#413])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb1/igt@i915_pm_rps@reset.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb7/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [PASS][32] -> [DMESG-FAIL][33] ([i915#725])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw5/igt@i915_selftest@live_blt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +5 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-snb:          [PASS][38] -> [SKIP][39] ([fdo#109271]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][40] -> [FAIL][41] ([i915#34])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_plane_cursor@pipe-c-overlay-size-64:
    - shard-hsw:          [PASS][42] -> [DMESG-FAIL][43] ([i915#44])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw5/igt@kms_plane_cursor@pipe-c-overlay-size-64.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw5/igt@kms_plane_cursor@pipe-c-overlay-size-64.html

  * igt@kms_psr@cursor_render:
    - shard-tglb:         [PASS][44] -> [SKIP][45] ([i915#668]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-tglb2/igt@kms_psr@cursor_render.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-tglb5/igt@kms_psr@cursor_render.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][46] -> [FAIL][47] ([i915#173])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb6/igt@kms_psr@no_drrs.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][48] -> [SKIP][49] ([fdo#109441]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-kbl:          [PASS][50] -> [SKIP][51] ([fdo#109271])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl7/igt@kms_vblank@pipe-b-query-idle-hang.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl4/igt@kms_vblank@pipe-b-query-idle-hang.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][52] -> [INCOMPLETE][53] ([i915#61])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw4/igt@perf_pmu@cpu-hotplug.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw4/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109276]) +19 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb2/igt@prime_busy@hang-bsd2.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-none:
    - shard-iclb:         [SKIP][56] ([fdo#109276] / [fdo#112080]) -> [PASS][57] +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb6/igt@gem_ctx_isolation@vcs1-none.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb2/igt@gem_ctx_isolation@vcs1-none.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][58] ([fdo#110841]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][60] ([fdo#110854]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb7/igt@gem_exec_balancer@smoke.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][62] ([fdo#112146]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][64] ([fdo#109276]) -> [PASS][65] +16 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb1/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_whisper@normal:
    - shard-glk:          [DMESG-WARN][66] ([i915#118] / [i915#95]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-glk2/igt@gem_exec_whisper@normal.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-glk2/igt@gem_exec_whisper@normal.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][68] ([i915#644]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][70] -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@reads.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw2/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][72] ([fdo#111870] / [i915#478]) -> [PASS][73] +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][74] ([i915#694]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw4/igt@gen7_exec_parse@basic-offset.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw2/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][76] ([i915#413]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79] +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-apl1/igt@i915_suspend@sysfs-reader.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-apl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][80] ([i915#54]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][82] ([i915#54]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-hsw:          [INCOMPLETE][84] ([i915#61]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][86] ([i915#180]) -> [PASS][87] +4 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [INCOMPLETE][88] ([i915#140] / [i915#250]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][90] ([fdo#109642] / [fdo#111068]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93] +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb7/igt@kms_psr@psr2_dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][94] ([fdo#103665]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][96] ([fdo#112080]) -> [PASS][97] +13 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb7/igt@perf_pmu@busy-vcs1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][98] ([fdo#109276] / [fdo#112080]) -> [FAIL][99] ([IGT#28])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][100] ([i915#694]) -> [FAIL][101] ([i915#818])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-hsw5/igt@gem_tiled_blits@normal.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup:
    - shard-snb:          [DMESG-WARN][102] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][103] ([fdo#110789] / [fdo#111870] / [i915#478])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][104] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][105] ([fdo#111870] / [i915#478])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7814/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5384 -> IGTPW_3996
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7814: bc626bbb5b6efa3fb6a90407e85a04ae64461db6 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3996: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/index.html
  IGT_5384: fd6896567f7d612c76207970376d4f1e634ded55 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3996/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
