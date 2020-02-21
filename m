Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Feb 2020 09:30:20 -0000
Message-ID: <158227742073.7916.10741931818420037780@emeril.freedesktop.org>
References: <20200219142445.69061-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219142445.69061-1-emil.l.velikov@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdHMvY29y?=
 =?utf-8?q?e=5Fsetmaster=3A_new_test_for_drop/set_master_semantics_=28rev2?=
 =?utf-8?q?=29?=
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

Series: ts/core_setmaster: new test for drop/set master semantics (rev2)
URL   : https://patchwork.freedesktop.org/series/73650/
State : success

== Summary ==

CI Bug Log - changes from IGT_5451_full -> IGTPW_4186_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4186_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_setmaster@master-drop-set-user} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb1/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl6/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-snb1/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-apl7/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-glk4/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-hsw1/igt@core_setmaster@master-drop-set-user.html

  
New tests
---------

  New tests have been introduced between IGT_5451_full and IGTPW_4186_full:

### New IGT tests (3) ###

  * igt@core_setmaster@master-drop-set-root:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@core_setmaster@master-drop-set-shared-fd:
    - Statuses : 7 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@core_setmaster@master-drop-set-user:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.04] s

  

Known issues
------------

  Here are the changes found in IGTPW_4186_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][8] -> [INCOMPLETE][9] ([fdo#103665])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl2/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][10] -> [SKIP][11] ([i915#677]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@pi-ringfull-bsd:
    - shard-iclb:         [PASS][12] -> [SKIP][13] ([fdo#112146]) +6 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb8/igt@gem_exec_schedule@pi-ringfull-bsd.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_exec_schedule@pi-ringfull-bsd.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-hsw:          [PASS][14] -> [FAIL][15] ([i915#694])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-hsw6/igt@gem_partial_pwrite_pread@write-uncached.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-hsw2/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-apl3/igt@gem_workarounds@suspend-resume-context.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][18] -> [DMESG-WARN][19] ([i915#180]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-kbl6/igt@i915_suspend@sysfs-reader.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen:
    - shard-apl:          [PASS][20] -> [FAIL][21] ([i915#54])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-onscreen.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#72])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-glk5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-glk2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-hsw:          [PASS][24] -> [INCOMPLETE][25] ([CI#80] / [i915#61])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-hsw8/igt@kms_flip@dpms-vs-vblank-race.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-hsw5/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#668])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][28] -> [SKIP][29] ([fdo#109441]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#112080]) +9 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][32] -> [SKIP][33] ([fdo#109276]) +21 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb3/igt@prime_vgem@fence-wait-bsd2.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][34] ([fdo#112080]) -> [PASS][35] +18 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-tglb:         [INCOMPLETE][36] -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb3/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         [INCOMPLETE][38] -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb1/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@bonded-slice:
    - shard-kbl:          [FAIL][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-kbl4/igt@gem_exec_balancer@bonded-slice.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl4/igt@gem_exec_balancer@bonded-slice.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][42] ([fdo#110854]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb6/igt@gem_exec_balancer@smoke.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_exec_balancer@smoke.html

  * {igt@gem_exec_schedule@implicit-read-write-bsd1}:
    - shard-iclb:         [SKIP][44] ([fdo#109276] / [i915#677]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd}:
    - shard-iclb:         [SKIP][46] ([i915#677]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][48] ([fdo#112146]) -> [PASS][49] +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb4/igt@gem_exec_schedule@in-order-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb5/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [SKIP][50] ([fdo#109276]) -> [PASS][51] +21 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb5/igt@gem_exec_schedule@promotion-bsd1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][52] ([i915#694]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-hsw5/igt@gem_tiled_blits@interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [DMESG-WARN][54] ([i915#180]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-kbl:          [FAIL][56] ([i915#79]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-kbl2/igt@kms_flip@flip-vs-expired-vblank.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_plane@pixel-format-pipe-b-planes:
    - shard-snb:          [DMESG-WARN][58] ([i915#478]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-snb4/igt@kms_plane@pixel-format-pipe-b-planes.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-snb1/igt@kms_plane@pixel-format-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][60] ([i915#899]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-glk6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][62] ([fdo#109441]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +4 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][66] ([fdo#112271] / [i915#1085]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][68] ([i915#831]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][70] ([fdo#112080]) -> [FAIL][71] ([IGT#28])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][72] ([i915#454]) -> [SKIP][73] ([i915#468])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][74] ([i915#468]) -> [FAIL][75] ([i915#454])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-snb:          [SKIP][76] ([fdo#109271]) -> [INCOMPLETE][77] ([i915#82])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5451/shard-snb2/igt@i915_pm_rpm@fences-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/shard-snb4/igt@i915_pm_rpm@fences-dpms.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5451 -> IGTPW_4186

  CI-20190529: 20190529
  CI_DRM_7965: e2896d5957301e0411d7048e724d4dc5c96450ea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4186: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html
  IGT_5451: 1c42f971d37a066da3e588783611ab08d5afbded @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4186/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
