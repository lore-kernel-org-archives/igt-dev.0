Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 12:01:35 -0000
Message-ID: <158280489501.29659.1472948430170442601@emeril.freedesktop.org>
References: <20200221205054.19734-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200221205054.19734-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_lib/igt=5Fdebugfs=3A_Add_igt?=
 =?utf-8?b?X2NyY19nZXRfZm9yX2ZyYW1lKCkgKHJldjMp?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] lib/igt_debugfs: Add igt_crc_get_for_frame() (rev3)
URL   : https://patchwork.freedesktop.org/series/73793/
State : success

== Summary ==

CI Bug Log - changes from IGT_5470_full -> IGTPW_4230_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/index.html

Known issues
------------

  Here are the changes found in IGTPW_4230_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#112080]) +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb4/igt@gem_busy@extended-parallel-vcs1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb7/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110854])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb8/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +16 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [PASS][11] -> [DMESG-WARN][12] ([i915#1330])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@gem_mmap_offset@pf-nonblock.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [PASS][13] -> [DMESG-WARN][14] ([fdo#110789] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [PASS][15] -> [DMESG-WARN][16] ([fdo#111870] / [i915#478])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@gem-evict-pwrite:
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#1316]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-tglb5/igt@i915_pm_rpm@gem-evict-pwrite.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-tglb3/igt@i915_pm_rpm@gem-evict-pwrite.html
    - shard-glk:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk9/igt@i915_pm_rpm@gem-evict-pwrite.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk8/igt@i915_pm_rpm@gem-evict-pwrite.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb3/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-alpha-opaque.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180] / [i915#56])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-snb:          [PASS][35] -> [DMESG-WARN][36] ([i915#478])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb6/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#899])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][41] -> [FAIL][42] ([i915#173])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb2/igt@kms_psr@no_drrs.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb7/igt@kms_psr@psr2_primary_blt.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][45] -> [FAIL][46] ([i915#51])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-kbl1/igt@perf@short-reads.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-kbl4/igt@perf@short-reads.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-hsw:          [PASS][47] -> [TIMEOUT][48] ([i915#1328])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@sw_sync@sync_multi_producer_single_consumer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw7/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-iclb:         [PASS][49] -> [TIMEOUT][50] ([i915#1328])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb8/igt@sw_sync@sync_multi_producer_single_consumer.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb5/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-hsw:          [INCOMPLETE][51] ([CI#80] / [i915#61] / [i915#977]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw7/igt@gem_busy@close-race.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw7/igt@gem_busy@close-race.html

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html

  * {igt@gem_ctx_ringsize@active@bcs0}:
    - shard-glk:          [INCOMPLETE][55] ([i915#58] / [k.org#198133]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk9/igt@gem_ctx_ringsize@active@bcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk1/igt@gem_ctx_ringsize@active@bcs0.html

  * {igt@gem_ctx_ringsize@active@vecs0}:
    - shard-tglb:         [INCOMPLETE][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-tglb1/igt@gem_ctx_ringsize@active@vecs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-tglb1/igt@gem_ctx_ringsize@active@vecs0.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][59] ([fdo#110841]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb7/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][61] ([fdo#112080]) -> [PASS][62] +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd:
    - shard-iclb:         [SKIP][63] ([i915#677]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb3/igt@gem_exec_schedule@implicit-read-write-bsd.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][65] ([fdo#109276] / [i915#677]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb7/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [SKIP][67] ([fdo#109276]) -> [PASS][68] +14 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [SKIP][69] ([fdo#112146]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb5/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][71] ([i915#644]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][73] ([fdo#111870]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw6/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [DMESG-WARN][75] ([fdo#111870] / [i915#478]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][79] ([i915#1316]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [SKIP][83] ([i915#1316]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][85] ([i915#413]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb4/igt@i915_pm_rps@waitboost.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-iclb:         [INCOMPLETE][87] ([i915#1237]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][89] ([i915#72]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-glk:          [INCOMPLETE][91] ([CI#80] / [i915#58] / [k.org#198133]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-glk:          [FAIL][93] ([i915#34]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk6/igt@kms_flip@plain-flip-fb-recreate.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk3/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-snb:          [DMESG-WARN][95] ([i915#478]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][97] ([i915#899]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-snb:          [SKIP][99] ([fdo#109271]) -> [PASS][100] +4 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb2/igt@kms_properties@plane-properties-atomic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb2/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@perf@short-reads:
    - shard-apl:          [FAIL][103] ([i915#51]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-apl8/igt@perf@short-reads.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-apl1/igt@perf@short-reads.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][105] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][106] ([fdo#111870] / [i915#478])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb2/igt@gem_userptr_blits@sync-unmap-cycles.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][107] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][108] ([fdo#111870])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-hsw5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_rpm@gem-mmap-type:
    - shard-snb:          [INCOMPLETE][109] ([i915#82]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5470/shard-snb6/igt@i915_pm_rpm@gem-mmap-type.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/shard-snb2/igt@i915_pm_rpm@gem-mmap-type.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1237]: https://gitlab.freedesktop.org/drm/intel/issues/1237
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1328]: https://gitlab.freedesktop.org/drm/intel/issues/1328
  [i915#1330]: https://gitlab.freedesktop.org/drm/intel/issues/1330
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#977]: https://gitlab.freedesktop.org/drm/intel/issues/977
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5470 -> IGTPW_4230

  CI-20190529: 20190529
  CI_DRM_8008: 13b6e2575f2c05722679bc1c9d0b97c13bde49a1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4230: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/index.html
  IGT_5470: 386b71eb9de6610107bf3cbc523b9a68243c6213 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4230/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
