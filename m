Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 22:40:01 -0000
Message-ID: <157619040135.32007.15992504061061983790@emeril.freedesktop.org>
References: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNTog?=
 =?utf-8?q?Rename_gem=5Fexec=5Fparse_and_gem=5Fexec=5Fparse=5Fblt?=
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

Series: i915: Rename gem_exec_parse and gem_exec_parse_blt
URL   : https://patchwork.freedesktop.org/series/70819/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7549_full -> IGTPW_3853_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3853_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gen7_exec_parse@basic-offset} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +14 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb2/igt@gen7_exec_parse@basic-offset.html

  * {igt@gen9_exec_parse@allowed-all} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +22 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gen9_exec_parse@allowed-all.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7549_full and IGTPW_3853_full:

### New IGT tests (28) ###

  * igt@gen7_exec_parse@basic-allocation:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 21.94] s

  * igt@gen7_exec_parse@basic-allowed:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen7_exec_parse@basic-offset:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.13] s

  * igt@gen7_exec_parse@basic-rejected:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen7_exec_parse@batch-without-end:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0] s

  * igt@gen7_exec_parse@bitmasks:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen7_exec_parse@chained-batch:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen7_exec_parse@cmd-crossing-page:
    - Statuses : 1 pass(s) 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen7_exec_parse@load-register-reg:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gen7_exec_parse@oacontrol-tracking:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@gen9_exec_parse@allowed-all:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@allowed-single:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gen9_exec_parse@basic-rejected:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@gen9_exec_parse@batch-invalid-length:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gen9_exec_parse@batch-without-end:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@batch-zero-length:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@bb-chained:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gen9_exec_parse@bb-secure:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@bb-start-cmd:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@bb-start-far:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@bb-start-out:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@bb-start-param:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@cmd-crossing-page:
    - Statuses : 3 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@secure-batches:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0] s

  * igt@gen9_exec_parse@unaligned-access:
    - Statuses : 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.06] s

  * igt@gen9_exec_parse@unaligned-jump:
    - Statuses : 3 pass(s) 4 skip(s)
    - Exec time: [0.0, 0.61] s

  * igt@gen9_exec_parse@valid-registers:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.22] s

  

Known issues
------------

  Here are the changes found in IGTPW_3853_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#456])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb3/igt@gem_ctx_isolation@rcs0-s3.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb1/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb6/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#110841])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_balancer@bonded-slice:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#800])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@gem_exec_balancer@bonded-slice.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl1/igt@gem_exec_balancer@bonded-slice.html

  * igt@gem_exec_create@basic:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#111736])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb4/igt@gem_exec_create@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb6/igt@gem_exec_create@basic.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-hsw:          [PASS][13] -> [INCOMPLETE][14] ([i915#61])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw4/igt@gem_exec_parallel@bcs0-fds.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-hsw7/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112080]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb8/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd2:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([fdo#111606] / [fdo#111677])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb6/igt@gem_exec_schedule@preempt-queue-contexts-bsd2.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([fdo#109276]) +8 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb7/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@smoketest-vebox:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#707])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@gem_exec_schedule@smoketest-vebox.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb3/igt@gem_exec_schedule@smoketest-vebox.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl2/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-hsw:          [PASS][27] -> [TIMEOUT][28] ([i915#530])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-hsw6/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_sync@basic-each:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#472] / [i915#707])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb2/igt@gem_sync@basic-each.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb8/igt@gem_sync@basic-each.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-snb:          [PASS][31] -> [DMESG-WARN][32] ([fdo#111870]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#79])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#49]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#123] / [i915#140])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-kbl:          [PASS][39] -> [INCOMPLETE][40] ([fdo#103665] / [i915#648] / [i915#667])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl6/igt@kms_plane@pixel-format-pipe-b-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl7/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][47] -> [FAIL][48] ([i915#31])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@kms_setmode@basic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-apl8/igt@kms_setmode@basic.html

  * igt@perf@short-reads:
    - shard-glk:          [PASS][49] -> [TIMEOUT][50] ([i915#51])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk5/igt@perf@short-reads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-glk8/igt@perf@short-reads.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@vcs1-s3:
    - shard-tglb:         [INCOMPLETE][51] ([i915#456]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb3/igt@gem_ctx_isolation@vcs1-s3.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb8/igt@gem_ctx_isolation@vcs1-s3.html
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [fdo#112080]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@gem_ctx_isolation@vcs1-s3.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gem_ctx_isolation@vcs1-s3.html

  * igt@gem_eio@kms:
    - shard-snb:          [INCOMPLETE][55] ([i915#82]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb5/igt@gem_eio@kms.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb2/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][57] ([i915#232]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@gem_eio@reset-stress.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb1/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][59] ([fdo#110854]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@pi-common-bsd}:
    - shard-iclb:         [SKIP][61] ([i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][63] ([fdo#112146]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb3/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-chain-bsd2:
    - shard-iclb:         [SKIP][65] ([fdo#109276]) -> [PASS][66] +6 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gem_exec_schedule@preempt-queue-chain-bsd2.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-tglb:         [INCOMPLETE][67] ([i915#456] / [i915#472]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@gem_exec_suspend@basic-s0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb8/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][69] ([i915#530]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_persistent_relocs@forked-interruptible-thrashing:
    - shard-hsw:          [FAIL][71] ([i915#520]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw4/igt@gem_persistent_relocs@forked-interruptible-thrashing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-hsw2/igt@gem_persistent_relocs@forked-interruptible-thrashing.html

  * igt@gem_persistent_relocs@forked-thrashing:
    - shard-iclb:         [TIMEOUT][73] ([i915#530]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb6/igt@gem_persistent_relocs@forked-thrashing.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb3/igt@gem_persistent_relocs@forked-thrashing.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][75] ([i915#644]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-iclb:         [FAIL][77] ([i915#644]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][79] ([fdo#111870]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb7/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglb:         [INCOMPLETE][81] ([i915#456] / [i915#460]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@i915_pm_rpm@system-suspend-devices.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][83] ([i915#71]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@kms_color@pipe-a-gamma.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb5/igt@kms_color@pipe-a-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +8 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [DMESG-WARN][89] ([i915#42]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-kbl:          [INCOMPLETE][91] ([fdo#103665]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@kms_flip@plain-flip-interruptible.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl2/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [INCOMPLETE][93] ([i915#474] / [i915#667]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][95] ([fdo#109441]) -> [PASS][96] +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][97] ([i915#31]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@kms_setmode@basic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-kbl7/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][99] ([fdo#112080]) -> [PASS][100] +7 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb2/igt@perf_pmu@busy-vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][101] ([fdo#109276] / [fdo#112080]) -> [FAIL][102] ([IGT#28])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb8/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#123]: https://gitlab.freedesktop.org/drm/intel/issues/123
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#520]: https://gitlab.freedesktop.org/drm/intel/issues/520
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#648]: https://gitlab.freedesktop.org/drm/intel/issues/648
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#800]: https://gitlab.freedesktop.org/drm/intel/issues/800
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3853
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7549: 9573e1b7d1cb54cc984cf5c4f93a743641d868da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3853: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3853/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
