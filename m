Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 16 Mar 2020 21:07:33 -0000
Message-ID: <158439285374.18994.13274661136111119873@emeril.freedesktop.org>
References: <20200316120323.22497-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200316120323.22497-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_subtests_=28rev2=29?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_alignment.c: Update subtests (rev2)
URL   : https://patchwork.freedesktop.org/series/74633/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8137_full -> IGTPW_4309_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4309_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4309_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4309_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_shared@single-timeline:
    - shard-snb:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-snb6/igt@gem_ctx_shared@single-timeline.html
    - shard-hsw:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw2/igt@gem_ctx_shared@single-timeline.html

  * igt@gem_eio@wait-immediate:
    - shard-tglb:         [PASS][4] -> [SKIP][5] +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb5/igt@gem_eio@wait-immediate.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb2/igt@gem_eio@wait-immediate.html

  * igt@gem_exec_parallel@rcs0-fds:
    - shard-hsw:          [PASS][6] -> [FAIL][7] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@gem_exec_parallel@rcs0-fds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw1/igt@gem_exec_parallel@rcs0-fds.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-tglb:         [PASS][8] -> [FAIL][9] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
    - shard-iclb:         [PASS][10] -> [FAIL][11] +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_ringfill@basic-default-hang:
    - shard-iclb:         [PASS][12] -> [SKIP][13] +6 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_ringfill@basic-default-hang.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_ringfill@basic-default-hang.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-apl:          [PASS][14] -> [FAIL][15] +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-glk:          [PASS][16] -> [FAIL][17] +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk4/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-kbl:          [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl2/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  
#### Warnings ####

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
    - shard-iclb:         [SKIP][22] ([fdo#109276]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8137_full and IGTPW_4309_full:

### New IGT tests (10) ###

  * igt@sysfs_heartbeat_interval@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@nopreempt:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@off:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_heartbeat_interval@precise:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_preempt_timeout@invalid:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@duration:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@idempotent:
    - Statuses :
    - Exec time: [None] s

  * igt@sysfs_timeslice_duration@timeout:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4309_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-kbl:          [PASS][24] -> [SKIP][25] ([fdo#109271] / [fdo#112080])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_ctx_isolation@vcs1-reset.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl4/igt@gem_ctx_isolation@vcs1-reset.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([fdo#112080])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb5/igt@gem_ctx_isolation@vcs1-reset.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb2/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [PASS][28] -> [INCOMPLETE][29] ([i915#1402])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl7/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [PASS][30] -> [INCOMPLETE][31] ([i915#1402])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-glk:          [PASS][32] -> [INCOMPLETE][33] ([i915#1402] / [i915#58] / [k.org#198133])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_ctx_persistence@close-replace-race.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][34] -> [SKIP][35] ([fdo#110841])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_eio@unwedge-stress:
    - shard-glk:          [PASS][36] -> [SKIP][37] ([fdo#109271]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_eio@unwedge-stress.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([i915#677])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@gem_exec_schedule@implicit-both-bsd.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-both-bsd1:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109276] / [i915#677]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb3/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd1:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([fdo#112118]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl4/igt@gem_exec_schedule@preempt-queue-contexts-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-blt:
    - shard-apl:          [PASS][44] -> [FAIL][45] ([fdo#112118]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl1/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl3/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
    - shard-glk:          [PASS][46] -> [FAIL][47] ([fdo#112118])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk4/igt@gem_exec_schedule@preempt-queue-contexts-chain-blt.html

  * igt@gem_exec_schedule@preemptive-hang-render:
    - shard-kbl:          [PASS][48] -> [SKIP][49] ([fdo#109271]) +9 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl1/igt@gem_exec_schedule@preemptive-hang-render.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl4/igt@gem_exec_schedule@preemptive-hang-render.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][50] -> [SKIP][51] ([fdo#112146]) +5 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#644])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][54] -> [DMESG-WARN][55] ([fdo#110789] / [fdo#111870] / [i915#478])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-snb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][56] -> [DMESG-WARN][57] ([i915#180]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl4/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][58] -> [DMESG-WARN][59] ([i915#716])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][60] -> [INCOMPLETE][61] ([CI#80])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-apl:          [PASS][62] -> [FAIL][63] ([i915#54])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-random:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#54])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
    - shard-kbl:          [PASS][66] -> [FAIL][67] ([i915#54]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-random.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][68] -> [FAIL][69] ([i915#79])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-apl:          [PASS][70] -> [INCOMPLETE][71] ([fdo#103927])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl8/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-c:
    - shard-apl:          [PASS][72] -> [SKIP][73] ([fdo#109271]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][74] -> [DMESG-WARN][75] ([i915#180]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109441]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][78] -> [FAIL][79] ([i915#31])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_setmode@basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [PASS][80] -> [SKIP][81] ([fdo#112015]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb5/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-c-query-idle-hang:
    - shard-iclb:         [PASS][82] -> [SKIP][83] ([fdo#109278]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb4/igt@kms_vblank@pipe-c-query-idle-hang.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@kms_vblank@pipe-c-query-idle-hang.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#112080]) +7 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb6/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109276]) +17 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-hsw:          [TIMEOUT][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw1/igt@gem_eio@in-flight-contexts-1us.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw6/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_parallel@bcs0-fds:
    - shard-apl:          [FAIL][90] -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_parallel@bcs0-fds.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-iclb:         [FAIL][92] -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_parallel@bcs0-fds.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb5/igt@gem_exec_parallel@bcs0-fds.html
    - shard-tglb:         [FAIL][94] -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb3/igt@gem_exec_parallel@bcs0-fds.html
    - shard-glk:          [FAIL][96] -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_parallel@bcs0-fds.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk2/igt@gem_exec_parallel@bcs0-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][98] ([fdo#109276] / [i915#677]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][100] ([fdo#109276]) -> [PASS][101] +16 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][102] ([i915#677]) -> [PASS][103] +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-hang-render:
    - shard-apl:          [SKIP][104] ([fdo#109271]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@gem_exec_schedule@preempt-hang-render.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl7/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-glk:          [SKIP][106] ([fdo#109271]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk8/igt@gem_exec_schedule@preempt-hang-render.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk6/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-iclb:         [SKIP][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@preempt-hang-render.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb7/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-tglb:         [SKIP][110] -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb3/igt@gem_exec_schedule@preempt-hang-render.html
    - shard-kbl:          [SKIP][112] ([fdo#109271]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@gem_exec_schedule@preempt-hang-render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl1/igt@gem_exec_schedule@preempt-hang-render.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][114] ([fdo#112146]) -> [PASS][115] +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@gem_exec_schedule@reorder-wide-bsd.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][116] ([i915#447]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][118] ([i915#1316]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][120] ([fdo#109271]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@i915_pm_rpm@system-suspend-devices.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw5/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][122] ([i915#1316]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb6/igt@i915_pm_rpm@system-suspend-devices.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb2/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][124] ([i915#72]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][126] ([i915#61]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw4/igt@kms_flip@flip-vs-suspend.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw5/igt@kms_flip@flip-vs-suspend.html
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl7/igt@kms_flip@flip-vs-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [FAIL][130] ([i915#49]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-glk:          [FAIL][132] ([i915#49]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [FAIL][134] ([i915#49]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-apl:          [DMESG-WARN][136] ([i915#180]) -> [PASS][137] +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][138] ([fdo#109642] / [fdo#111068]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb1/igt@kms_psr2_su@page_flip.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb7/igt@kms_psr@psr2_basic.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-hang:
    - shard-tglb:         [SKIP][142] ([fdo#112015]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-modeset-hang.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][144] ([fdo#112080]) -> [PASS][145] +7 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb6/igt@perf_pmu@busy-vcs1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@most-busy-idle-check-all-bcs0:
    - shard-hsw:          [FAIL][146] -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw5/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw2/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
    - shard-snb:          [FAIL][148] -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@perf_pmu@most-busy-idle-check-all-bcs0.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-snb6/igt@perf_pmu@most-busy-idle-check-all-bcs0.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-reset:
    - shard-iclb:         [SKIP][150] ([fdo#112080]) -> [SKIP][151] ([fdo#109276] / [fdo#112080])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb3/igt@gem_ctx_isolation@vcs1-reset.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-iclb4/igt@gem_ctx_isolation@vcs1-reset.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [DMESG-WARN][152] ([fdo#111870]) -> [DMESG-WARN][153] ([fdo#110789] / [fdo#111870])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-hsw5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt:
    - shard-snb:          [DMESG-WARN][154] ([i915#478]) -> [DMESG-WARN][155] ([fdo#110789] / [i915#478])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy@gtt.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][156] ([i915#468]) -> [FAIL][157] ([i915#454])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [SKIP][158] ([fdo#109271]) -> [INCOMPLETE][159] ([i915#82])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-snb4/igt@i915_pm_rpm@fences.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-snb2/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglb:         [SKIP][160] ([fdo#109506]) -> [SKIP][161] ([i915#1316])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/shard-tglb5/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         [SKIP][162] ([fdo#109293] / [fdo#109506]) -> [SKIP][163] ([i915#1316])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8137/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4309/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
