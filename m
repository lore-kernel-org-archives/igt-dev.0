Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 07 Mar 2020 15:43:34 -0000
Message-ID: <158359581468.20976.3055699755251307041@emeril.freedesktop.org>
References: <20200306172829.45696-1-don.hiatt@intel.com>
In-Reply-To: <20200306172829.45696-1-don.hiatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fpm=3A_Adjust_pm_status_check_timeout_and_log_timing?=
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
To: don.hiatt@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_pm: Adjust pm status check timeout and log timing
URL   : https://patchwork.freedesktop.org/series/74398/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5498_full -> IGTPW_4274_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4274_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4274_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4274_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb3/igt@gem_ctx_persistence@close-replace-race.html

  
#### Warnings ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][3] ([fdo#103927]) -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-apl2/igt@gem_ctx_persistence@close-replace-race.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-apl3/igt@gem_ctx_persistence@close-replace-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-hsw1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy@gtt.html

  
Known issues
------------

  Here are the changes found in IGTPW_4274_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([fdo#112080]) +11 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb2/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb3/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9] ([fdo#103665]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([fdo#109276] / [i915#677]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#109276]) +22 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#677])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb6/igt@gem_exec_schedule@pi-common-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb7/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#454])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#52] / [i915#54])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-hsw:          [PASS][26] -> [DMESG-WARN][27] ([i915#478])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-hsw4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-snb:          [PASS][28] -> [DMESG-WARN][29] ([i915#478])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-snb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#49])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +5 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#899]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#109441]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][38] -> [FAIL][39] ([i915#1085])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-tglb3/igt@perf@gen12-mi-rpc.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-tglb3/igt@perf@gen12-mi-rpc.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [TIMEOUT][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][42] ([i915#1277]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-tglb6/igt@gem_exec_balancer@hang.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-tglb6/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][44] ([fdo#112080]) -> [PASS][45] +10 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [SKIP][46] ([fdo#109276] / [i915#677]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][48] ([i915#677]) -> [PASS][49] +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][50] ([fdo#112146]) -> [PASS][51] +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][52] ([i915#644]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][54] ([i915#644]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [DMESG-WARN][56] ([fdo#111870] / [i915#478]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-snb5/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [DMESG-WARN][58] ([fdo#111870]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-hsw6/igt@gem_userptr_blits@sync-unmap.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-hsw4/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][60] ([i915#454]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [FAIL][62] ([i915#79]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk3/igt@kms_flip@flip-vs-expired-vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][66] ([i915#180]) -> [PASS][67] +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][68] ([fdo#103665]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][70] ([i915#31]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-apl3/igt@kms_setmode@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-apl6/igt@kms_setmode@basic.html
    - shard-glk:          [FAIL][72] ([i915#31]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-glk7/igt@kms_setmode@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-glk8/igt@kms_setmode@basic.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][74] ([fdo#109276]) -> [PASS][75] +15 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][76] ([i915#468]) -> [FAIL][77] ([i915#454])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-tglb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [DMESG-WARN][78] ([i915#1226]) -> [SKIP][79] ([fdo#109349])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5498/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5498 -> IGTPW_4274

  CI-20190529: 20190529
  CI_DRM_8085: f731492964aa6510672f43292d4b2216b73eddeb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4274: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/index.html
  IGT_5498: 1bb7a25a09fe3e653d310e8bdfbdde4a1934b326 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4274/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
