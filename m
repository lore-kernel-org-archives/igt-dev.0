Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 06 Mar 2020 00:42:12 -0000
Message-ID: <158345533290.3082.12990290381432086526@emeril.freedesktop.org>
References: <20200305111522.2674305-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200305111522.2674305-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Exercise_bonded-payload_synchronisation?=
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

Series: i915/gem_exec_balancer: Exercise bonded-payload synchronisation
URL   : https://patchwork.freedesktop.org/series/74327/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5493_full -> IGTPW_4264_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4264_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4264_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4264_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb8/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  
New tests
---------

  New tests have been introduced between IGT_5493_full and IGTPW_4264_full:

### New IGT tests (1) ###

  * igt@gem_exec_balancer@bonded-early:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.11] s

  

Known issues
------------

  Here are the changes found in IGTPW_4264_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-parallel-vcs1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +12 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb1/igt@gem_busy@extended-parallel-vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb5/igt@gem_busy@extended-parallel-vcs1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd2:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#109276]) +11 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd2.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][17] -> [DMESG-WARN][18] ([fdo#111870] / [i915#478])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb2/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [PASS][19] -> [DMESG-WARN][20] ([fdo#111870])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw2/igt@gem_userptr_blits@sync-unmap.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#34])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl4/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl7/igt@kms_flip@flip-vs-rmfb-interruptible.html
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1297])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-apl1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#899])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#173])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@kms_psr@no_drrs.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl4/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-apl2/igt@kms_setmode@basic.html
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [PASS][41] -> [SKIP][42] ([i915#405])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb6/igt@perf@invalid-open-flags.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb1/igt@perf@invalid-open-flags.html
    - shard-apl:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl7/igt@perf@invalid-open-flags.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-apl4/igt@perf@invalid-open-flags.html
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([i915#405])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb1/igt@perf@invalid-open-flags.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb2/igt@perf@invalid-open-flags.html
    - shard-glk:          [PASS][47] -> [SKIP][48] ([fdo#109271])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk5/igt@perf@invalid-open-flags.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk5/igt@perf@invalid-open-flags.html
    - shard-hsw:          [PASS][49] -> [SKIP][50] ([fdo#109271])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw8/igt@perf@invalid-open-flags.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw1/igt@perf@invalid-open-flags.html
    - shard-kbl:          [PASS][51] -> [SKIP][52] ([fdo#109271])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl7/igt@perf@invalid-open-flags.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl7/igt@perf@invalid-open-flags.html

  
#### Possible fixes ####

  * igt@gem_busy@close-race:
    - shard-tglb:         [INCOMPLETE][53] ([i915#977]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb5/igt@gem_busy@close-race.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb2/igt@gem_busy@close-race.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][55] ([i915#679]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl6/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_ctx_shared@exec-shared-gtt-blt:
    - shard-tglb:         [FAIL][57] ([i915#616]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb7/igt@gem_ctx_shared@exec-shared-gtt-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb8/igt@gem_ctx_shared@exec-shared-gtt-blt.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][59] ([i915#1277]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb7/igt@gem_exec_balancer@hang.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb8/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@fifo-bsd1:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +18 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@gem_exec_schedule@fifo-bsd1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb2/igt@gem_exec_schedule@fifo-bsd1.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [i915#677]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb6/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb1/igt@gem_exec_schedule@pi-common-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][67] ([fdo#112146]) -> [PASS][68] +6 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_mmap_offset@pf-nonblock:
    - shard-hsw:          [DMESG-WARN][69] ([i915#478]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@gem_mmap_offset@pf-nonblock.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw4/igt@gem_mmap_offset@pf-nonblock.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [INCOMPLETE][71] ([i915#58] / [k.org#198133]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk9/igt@gen9_exec_parse@allowed-single.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][73] ([i915#1316]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb1/igt@i915_pm_rpm@gem-pread.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb6/igt@i915_pm_rpm@gem-pread.html
    - shard-iclb:         [SKIP][75] ([i915#1316]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb3/igt@i915_pm_rpm@gem-pread.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb6/igt@i915_pm_rpm@gem-pread.html
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk2/igt@i915_pm_rpm@gem-pread.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk5/igt@i915_pm_rpm@gem-pread.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-snb:          [SKIP][81] ([fdo#109271]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@kms_frontbuffer_tracking@basic.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb5/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-snb:          [DMESG-WARN][83] ([i915#478]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][85] ([i915#899]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][89] ([i915#31]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-kbl3/igt@kms_setmode@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +4 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][93] ([i915#1085]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-tglb2/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][95] ([fdo#112080]) -> [PASS][96] +6 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb3/igt@perf_pmu@busy-vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_exec_schedule@pi-userfault-bsd2:
    - shard-iclb:         [SKIP][97] ([fdo#109276]) -> [INCOMPLETE][98] ([i915#1381])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb7/igt@gem_exec_schedule@pi-userfault-bsd2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb4/igt@gem_exec_schedule@pi-userfault-bsd2.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][99] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][100] ([fdo#111870] / [i915#478])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@gem_userptr_blits@dmabuf-sync.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][101] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][102] ([fdo#111870])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          [SKIP][103] ([fdo#109271]) -> [INCOMPLETE][104] ([i915#82])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         [SKIP][105] ([fdo#109293] / [fdo#109506]) -> [SKIP][106] ([i915#1316])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-iclb8/igt@i915_pm_rpm@pc8-residency.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114]) ([fdo#111870] / [i915#478]) -> ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([fdo#111870])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw1/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw2/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-hsw6/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw2/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw2/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw8/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-hsw6/igt@runner@aborted.html
    - shard-snb:          ([FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136]) ([fdo#111870] / [i915#1077])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb5/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5493/shard-snb4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb5/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/shard-snb6/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1381]: https://gitlab.freedesktop.org/drm/intel/issues/1381
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
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
  * IGT: IGT_5493 -> IGTPW_4264

  CI-20190529: 20190529
  CI_DRM_8068: f8e69af5cca45947ebce78f677b75b0ecc4ba744 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4264: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/index.html
  IGT_5493: 41422f8384047e2ec4c4cb896f6955bf51490f53 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4264/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
