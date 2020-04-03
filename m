Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 03 Apr 2020 08:28:56 -0000
Message-ID: <158590253621.13350.3981878108339006136@emeril.freedesktop.org>
References: <20200401182703.2027240-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200401182703.2027240-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Falignment=3A_Exercise_potential_priority_inversion?=
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

Series: i915/gem_exec_alignment: Exercise potential priority inversion
URL   : https://patchwork.freedesktop.org/series/75379/
State : success

== Summary ==

CI Bug Log - changes from IGT_5555_full -> IGTPW_4394_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4394_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_alignment@pi} (NEW):
    - shard-glk:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk1/igt@gem_exec_alignment@pi.html

  
New tests
---------

  New tests have been introduced between IGT_5555_full and IGTPW_4394_full:

### New IGT tests (9) ###

  * igt@gem_busy@busy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@extended:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_busy@parallel:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_alignment@many:
    - Statuses : 7 pass(s)
    - Exec time: [32.30, 93.50] s

  * igt@gem_exec_alignment@pi:
    - Statuses : 2 pass(s) 2 skip(s) 1 timeout(s)
    - Exec time: [0.0, 148.37] s

  * igt@gem_exec_reloc@basic-spin:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@implicit-write-read:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_schedule@independent:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_hangman@error-state-capture:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4394_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [PASS][4] -> [FAIL][5] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#177] / [i915#52] / [i915#54])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#52] / [i915#54]) +6 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180] / [i915#95])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-apl:          [PASS][12] -> [FAIL][13] ([i915#79])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#95])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [PASS][16] -> [DMESG-WARN][17] ([i915#180]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#93] / [i915#95])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl7/igt@kms_mmap_write_crc@main.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl1/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
    - shard-apl:          [PASS][22] -> [FAIL][23] ([fdo#108145] / [i915#265] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#1559])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][26] -> [SKIP][27] ([fdo#109441]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [PASS][28] -> [SKIP][29] ([fdo#112015])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-tglb1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109278])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-glk:          [PASS][32] -> [SKIP][33] ([fdo#109271])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk1/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
    - shard-hsw:          [PASS][34] -> [SKIP][35] ([fdo#109271])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-hsw8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-hsw4/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [PASS][36] -> [SKIP][37] ([fdo#112080]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb3/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109276]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb2/igt@prime_busy@after-bsd2.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb3/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-kbl:          [FAIL][40] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][41] +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen:
    - shard-glk:          [FAIL][42] ([i915#54]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [FAIL][44] ([i915#54]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-random:
    - shard-apl:          [FAIL][46] ([i915#54]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][48] ([i915#180]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [FAIL][50] ([i915#72]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][52] ([i915#52] / [i915#54]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][54] ([i915#61]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-kbl:          [DMESG-WARN][56] ([i915#1297]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl3/igt@kms_flip@plain-flip-ts-check.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl1/igt@kms_flip@plain-flip-ts-check.html
    - shard-apl:          [DMESG-WARN][58] ([i915#1297]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl8/igt@kms_flip@plain-flip-ts-check.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl1/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [INCOMPLETE][60] ([i915#155]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][62] ([i915#180]) -> [PASS][63] +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-kbl:          [FAIL][64] ([i915#1559] / [i915#93] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][66] ([fdo#109441]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm:
    - shard-tglb:         [SKIP][68] ([fdo#112015]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][70] ([fdo#112080]) -> [PASS][71] +7 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb3/igt@perf_pmu@init-busy-vcs1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][72] ([fdo#109276]) -> [PASS][73] +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb7/igt@prime_vgem@fence-wait-bsd2.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][74] ([i915#658]) -> [SKIP][75] ([i915#588])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-iclb4/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][76] ([i915#31] / [i915#95]) -> [FAIL][77] ([i915#31])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-apl4/igt@kms_setmode@basic.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-apl2/igt@kms_setmode@basic.html
    - shard-kbl:          [FAIL][78] ([i915#31] / [i915#93] / [i915#95]) -> [FAIL][79] ([i915#31])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5555/shard-kbl4/igt@kms_setmode@basic.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/shard-kbl4/igt@kms_setmode@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5555 -> IGTPW_4394

  CI-20190529: 20190529
  CI_DRM_8233: 0862243a5514a9da625520bd4f554f8348077594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4394: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/index.html
  IGT_5555: 0737422b13d9676ec856cc5b96a4bb30330c42ff @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4394/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
