Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Apr 2020 15:27:07 -0000
Message-ID: <158618682796.4194.17125779076195878048@emeril.freedesktop.org>
References: <20200406092549.24154-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200406092549.24154-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3AAdded_=5F=5Ffor=5Feach=5Fphysical=5Fengi?=
 =?utf-8?q?ne_to_utilize_all_available_=28rev3=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_sync.c :Added __for_each_physical_engine to utilize all available (rev3)
URL   : https://patchwork.freedesktop.org/series/75536/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5572_full -> IGTPW_4409_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4409_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4409_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4409_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl7/igt@gem_workarounds@suspend-resume.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl6/igt@gem_workarounds@suspend-resume.html

  
New tests
---------

  New tests have been introduced between IGT_5572_full and IGTPW_4409_full:

### New IGT tests (6) ###

  * igt@gem_sync@basic_sync_ring:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_sync@basic_sync_ring@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [20.03, 20.14] s

  * igt@gem_sync@basic_sync_ring@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [20.04, 20.24] s

  * igt@gem_sync@basic_sync_ring@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [20.03, 20.13] s

  * igt@gem_sync@basic_sync_ring@vcs1:
    - Statuses : 1 pass(s)
    - Exec time: [20.04] s

  * igt@gem_sync@basic_sync_ring@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [20.02, 20.08] s

  

Known issues
------------

  Here are the changes found in IGTPW_4409_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][3] -> [FAIL][4] ([i915#454])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-hsw:          [PASS][5] -> [SKIP][6] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw5/igt@i915_pm_rpm@drm-resources-equal.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-hsw4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([i915#1316] / [i915#579])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb5/igt@i915_pm_rpm@drm-resources-equal.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [PASS][9] -> [SKIP][10] ([i915#1316] / [i915#579])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb7/igt@i915_pm_rpm@drm-resources-equal.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [PASS][11] -> [FAIL][12] ([i915#54] / [i915#93] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#70])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#70])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-128x128-right-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#52] / [i915#54] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#433])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][31] -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([fdo#112015])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  
#### Possible fixes ####

  * {igt@gem_ctx_isolation@preservation-s3@vcs0}:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_params@invalid-bsd-ring:
    - shard-iclb:         [SKIP][39] ([fdo#109276]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb8/igt@gem_exec_params@invalid-bsd-ring.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb2/igt@gem_exec_params@invalid-bsd-ring.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][41] ([i915#1316] / [i915#579]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb1/igt@i915_pm_rpm@cursor.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb7/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][43] ([fdo#109271]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw7/igt@i915_pm_rpm@cursor.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-hsw1/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][45] ([fdo#109271]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk9/igt@i915_pm_rpm@cursor.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk1/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [SKIP][47] ([i915#1316] / [i915#579]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_busy@basic@flip:
    - shard-hsw:          [INCOMPLETE][49] ([i915#61]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw1/igt@kms_busy@basic@flip.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-hsw8/igt@kms_busy@basic@flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [FAIL][51] ([i915#54] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [FAIL][57] ([i915#1566] / [i915#93] / [i915#95]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl3/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][59] ([i915#52] / [i915#54]) -> [PASS][60] +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][61] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [FAIL][63] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [FAIL][65] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][69] ([i915#79]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [INCOMPLETE][73] ([i915#82]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-snb1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-glk:          [FAIL][79] ([i915#49]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][81] ([i915#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * {igt@perf@blocking-parameterized}:
    - shard-kbl:          [FAIL][85] ([i915#1542]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl4/igt@perf@blocking-parameterized.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl3/igt@perf@blocking-parameterized.html
    - shard-hsw:          [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-hsw6/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-hsw7/igt@perf@blocking-parameterized.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][89] ([i915#1085]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb7/igt@perf@gen12-mi-rpc.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][91] ([i915#468]) -> [FAIL][92] ([i915#454])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][93] ([i915#357] / [i915#93] / [i915#95]) -> [FAIL][94] ([i915#357])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl6/igt@kms_content_protection@uevent.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][95] ([i915#357] / [i915#95]) -> [FAIL][96] ([i915#357])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl8/igt@kms_content_protection@uevent.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          [FAIL][97] ([fdo#108145] / [i915#265]) -> [FAIL][98] ([fdo#108145] / [i915#265] / [i915#95])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          [FAIL][99] ([fdo#108145] / [i915#265]) -> [FAIL][100] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5572/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/shard-kbl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1459]: https://gitlab.freedesktop.org/drm/intel/issues/1459
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1566]: https://gitlab.freedesktop.org/drm/intel/issues/1566
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5572 -> IGTPW_4409

  CI-20190529: 20190529
  CI_DRM_8259: 450fc86b62651336f9b5fde79c068df7b4c95aa4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4409: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/index.html
  IGT_5572: 6c124b5c8501d900966c033ac86c3dc55c16a2da @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4409/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
