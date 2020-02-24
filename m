Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 24 Feb 2020 09:18:41 -0000
Message-ID: <158253592197.28363.5661204920683141119@emeril.freedesktop.org>
References: <20200221094321.2534304-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200221094321.2534304-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Exercise_I915=5FCONTEXT=5FPARAM=5FRINGSIZE_=28rev2=29?=
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

Series: i915: Exercise I915_CONTEXT_PARAM_RINGSIZE (rev2)
URL   : https://patchwork.freedesktop.org/series/73750/
State : success

== Summary ==

CI Bug Log - changes from IGT_5457_full -> IGTPW_4206_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4206_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_ringsize@clone} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +5 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb2/igt@gem_ctx_ringsize@clone.html

  * {igt@gem_ctx_ringsize@idempotent} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][2] +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb7/igt@gem_ctx_ringsize@idempotent.html

  
New tests
---------

  New tests have been introduced between IGT_5457_full and IGTPW_4206_full:

### New IGT tests (6) ###

  * igt@gem_ctx_ringsize@active:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_ringsize@clone:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_ringsize@create:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_ringsize@idempotent:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_ringsize@idle:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_ringsize@invalid:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4206_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl1/igt@gem_ctx_isolation@vecs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl4/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +10 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb6/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#644])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#644])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#447])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#413])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@i915_pm_rps@waitboost.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb3/igt@i915_pm_rps@waitboost.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl4/igt@kms_flip@blocking-absolute-wf_vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl8/igt@kms_flip@blocking-absolute-wf_vblank.html
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl2/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-glk:          [PASS][25] -> [TIMEOUT][26] ([fdo#112271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk4/igt@kms_flip@flip-vs-modeset-vs-hang.html
    - shard-tglb:         [PASS][27] -> [TIMEOUT][28] ([fdo#112271] / [i915#561])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb7/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb3/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-tglb:         [PASS][31] -> [SKIP][32] ([i915#668]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#899])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][37] -> [FAIL][38] ([i915#173])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb3/igt@kms_psr@no_drrs.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][41] -> [TIMEOUT][42] ([fdo#112271] / [i915#1085])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109276]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb1/igt@prime_busy@hang-bsd2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb7/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][47] -> [FAIL][48] ([i915#831])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-hsw5/igt@prime_mmap_coherency@ioctl-errors.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-kbl:          [PASS][49] -> [TIMEOUT][50] ([fdo#112271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl3/igt@sw_sync@sync_multi_producer_single_consumer.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl6/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-snb:          [PASS][51] -> [TIMEOUT][52] ([fdo#112271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb4/igt@sw_sync@sync_multi_producer_single_consumer.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-snb5/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * {igt@gem_ctx_persistence@legacy-engines-hostile@default}:
    - shard-glk:          [FAIL][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk4/igt@gem_ctx_persistence@legacy-engines-hostile@default.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk3/igt@gem_ctx_persistence@legacy-engines-hostile@default.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][55] ([fdo#110854]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb1/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd2}:
    - shard-iclb:         [SKIP][57] ([fdo#109276] / [i915#677]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb2/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb7/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [SKIP][61] ([fdo#112146]) -> [PASS][62] +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][63] ([i915#644]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-snb:          [DMESG-WARN][65] ([i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb6/igt@gem_set_tiling_vs_gtt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-snb6/igt@gem_set_tiling_vs_gtt.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][67] ([i915#454]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [DMESG-FAIL][69] ([i915#1233]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb2/igt@i915_selftest@live_gt_lrc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb5/igt@i915_selftest@live_gt_lrc.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [TIMEOUT][71] ([fdo#112271]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl1/igt@i915_selftest@live_gtt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl3/igt@i915_selftest@live_gtt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [FAIL][75] ([i915#54]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-apl:          [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [SKIP][85] ([i915#668]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90] +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][91] ([i915#31]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-hsw1/igt@kms_setmode@basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-hsw2/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][93] ([fdo#112080]) -> [PASS][94] +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@perf_pmu@busy-vcs1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb2/igt@perf_pmu@busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][95] ([fdo#109276]) -> [PASS][96] +23 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][97] ([IGT#28]) -> [SKIP][98] ([fdo#112080])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [FAIL][100] ([IGT#28])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][101] ([i915#694]) -> [FAIL][102] ([i915#818])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-hsw7/igt@gem_tiled_blits@normal.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-hsw4/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [DMESG-WARN][103] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][104] ([fdo#111870] / [i915#478])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5457/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5457 -> IGTPW_4206

  CI-20190529: 20190529
  CI_DRM_7980: 27a7d60b2dd30ef9901b912893835949fd369432 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4206: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html
  IGT_5457: 3e686098d928aa928f668e00fa01e92234e173ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4206/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
