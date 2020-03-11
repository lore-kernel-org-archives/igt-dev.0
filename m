Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 11 Mar 2020 07:48:52 -0000
Message-ID: <158391293267.13953.1416987759356995506@emeril.freedesktop.org>
References: <20200309165617.499759-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200309165617.499759-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9j?=
 =?utf-8?q?ore=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28re?=
 =?utf-8?b?djIp?=
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
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/core_setmaster: new test for drop/set master semantics (rev2)
URL   : https://patchwork.freedesktop.org/series/74400/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8106_full -> IGTPW_4282_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4282_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4282_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4282_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_setmaster@master-drop-set-user} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl1/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb4/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-tglb2/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl2/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk3/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8106_full and IGTPW_4282_full:

### New IGT tests (3) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_4282_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11] ([i915#1402])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112080]) +11 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#109276] / [i915#677])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [PASS][16] -> [SKIP][17] ([fdo#112146]) +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@gem_exec_schedule@in-order-bsd.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#677]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@pi-common-bsd1:
    - shard-iclb:         [PASS][20] -> [SKIP][21] ([fdo#109276]) +13 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@gem_exec_schedule@pi-common-bsd1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd1.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk2/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-hsw:          [PASS][24] -> [DMESG-WARN][25] ([i915#478])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw5/igt@gem_mmap_gtt@basic-write-read-distinct.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][26] -> [DMESG-WARN][27] ([fdo#111870])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][28] -> [DMESG-WARN][29] ([fdo#111870] / [i915#478])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@gem_userptr_blits@dmabuf-unsync.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][30] -> [FAIL][31] ([i915#454]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][32] -> [FAIL][33] ([i915#413]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@i915_pm_rps@reset.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#54])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
    - shard-glk:          [PASS][38] -> [FAIL][39] ([i915#54])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-256x85-sliding.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-kbl:          [PASS][40] -> [DMESG-WARN][41] ([i915#1297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@kms_flip@flip-vs-fences-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl2/igt@kms_flip@flip-vs-fences-interruptible.html
    - shard-apl:          [PASS][42] -> [DMESG-WARN][43] ([i915#1297])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@kms_flip@flip-vs-fences-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl8/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-apl:          [PASS][44] -> [INCOMPLETE][45] ([fdo#103927])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl2/igt@kms_flip@modeset-vs-vblank-race.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl3/igt@kms_flip@modeset-vs-vblank-race.html
    - shard-kbl:          [PASS][46] -> [INCOMPLETE][47] ([i915#1297])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl3/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][48] -> [FAIL][49] ([i915#49])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#899])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][52] -> [SKIP][53] ([fdo#109642] / [fdo#111068])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][54] -> [SKIP][55] ([fdo#109441]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][56] -> [FAIL][57] ([i915#31])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@kms_setmode@basic.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][58] -> [DMESG-WARN][59] ([i915#180]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@gem_ctx_isolation@rcs0-s3.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-apl:          [INCOMPLETE][62] ([fdo#103927] / [i915#1402]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@gem_ctx_persistence@close-replace-race.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@processes:
    - shard-kbl:          [FAIL][64] ([i915#570] / [i915#679]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@gem_ctx_persistence@processes.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl2/igt@gem_ctx_persistence@processes.html

  * igt@gem_exec_balancer@hang:
    - shard-tglb:         [FAIL][66] ([i915#1277]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-tglb1/igt@gem_exec_balancer@hang.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-tglb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][68] ([fdo#109276] / [i915#677]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd2.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][70] ([i915#677]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb5/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][72] ([fdo#112146]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [DMESG-WARN][74] ([i915#118] / [i915#95]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk2/igt@gem_exec_whisper@basic-queues-forked.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][76] ([i915#644]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][78] ([i915#180]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_softpin@noreloc-s3.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][80] ([fdo#111870] / [i915#478]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb6/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][82] ([fdo#111870]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw1/igt@gem_userptr_blits@sync-unmap-cycles.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_suspend@sysfs-reader:
    - shard-snb:          [DMESG-WARN][84] ([i915#42]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_suspend@sysfs-reader.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb6/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-apl:          [FAIL][86] ([i915#54]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][88] ([i915#79]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][90] -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][92] ([i915#899]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-x:
    - shard-hsw:          [DMESG-WARN][94] ([i915#478]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw2/igt@kms_plane_multiple@atomic-pipe-c-tiling-x.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][96] ([fdo#109441]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb8/igt@kms_psr@psr2_suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][98] ([fdo#112080]) -> [PASS][99] +9 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb2/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][100] ([fdo#109276]) -> [PASS][101] +22 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb1/igt@prime_busy@hang-bsd2.html

  * igt@prime_vgem@basic-gtt:
    - shard-snb:          [DMESG-WARN][102] ([i915#478]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@prime_vgem@basic-gtt.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb2/igt@prime_vgem@basic-gtt.html

  
#### Warnings ####

  * igt@gem_linear_blits@normal:
    - shard-apl:          [TIMEOUT][104] ([i915#1322]) -> [TIMEOUT][105] ([fdo#111732] / [i915#1322])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl4/igt@gem_linear_blits@normal.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl2/igt@gem_linear_blits@normal.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-snb:          [DMESG-WARN][106] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][107] ([fdo#111870] / [i915#478])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-hsw:          [DMESG-WARN][108] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][109] ([fdo#111870])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw8/igt@gem_userptr_blits@dmabuf-sync.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@i915_pm_rpm@fences:
    - shard-snb:          [INCOMPLETE][110] ([i915#82]) -> [SKIP][111] ([fdo#109271])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-snb4/igt@i915_pm_rpm@fences.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-snb5/igt@i915_pm_rpm@fences.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][112] ([fdo#109349]) -> [DMESG-WARN][113] ([i915#1226])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-iclb5/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-kbl:          [DMESG-WARN][114] ([i915#180] / [i915#56]) -> [DMESG-WARN][115] ([i915#180])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([fdo#111870]) -> ([FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133]) ([fdo#111870] / [i915#478])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw1/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw8/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw5/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-hsw7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw2/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw6/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw7/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw5/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-hsw5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][134], [FAIL][135]) ([fdo#103927] / [i915#1402]) -> ([FAIL][136], [FAIL][137]) ([fdo#103927] / [fdo#111012])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8106/shard-apl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111012]: https://bugs.freedesktop.org/show_bug.cgi?id=111012
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111732]: https://bugs.freedesktop.org/show_bug.cgi?id=111732
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1322]: https://gitlab.freedesktop.org/drm/intel/issues/1322
  [i915#1402]: https://gitlab.freedesktop.org/drm/intel/issues/1402
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#570]: https://gitlab.freedesktop.org/drm/intel/issues/570
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5504 -> IGTPW_4282
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8106: 5b0076e8066ea8218e7857ee1aa28b0670acde94 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4282: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/index.html
  IGT_5504: d6788bf0404f76b66170e18eb26c85004b5ccb25 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4282/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
