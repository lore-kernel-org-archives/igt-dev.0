Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 12 Jun 2020 01:18:06 -0000
Message-ID: <159192468675.21337.2229834641910139483@emeril.freedesktop.org>
References: <20200611204048.318778-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200611204048.318778-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fisolation=3A_Verify_BB=5FOFFSET_protection?=
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

Series: i915/gem_ctx_isolation: Verify BB_OFFSET protection
URL   : https://patchwork.freedesktop.org/series/78235/
State : success

== Summary ==

CI Bug Log - changes from IGT_5704_full -> IGTPW_4672_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4672_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_isolation@bb-offset-clean@rcs0} (NEW):
    - shard-hsw:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw6/igt@gem_ctx_isolation@bb-offset-clean@rcs0.html
    - shard-snb:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb1/igt@gem_ctx_isolation@bb-offset-clean@rcs0.html

  * {igt@gem_ctx_isolation@bb-offset-switch@bcs0} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3] +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb2/igt@gem_ctx_isolation@bb-offset-switch@bcs0.html

  * {igt@gem_ctx_isolation@bb-offset-switch@vecs0} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][4] +7 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb2/igt@gem_ctx_isolation@bb-offset-switch@vecs0.html
    - shard-kbl:          NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl7/igt@gem_ctx_isolation@bb-offset-switch@vecs0.html
    - shard-apl:          NOTRUN -> [FAIL][6] +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl7/igt@gem_ctx_isolation@bb-offset-switch@vecs0.html
    - shard-glk:          NOTRUN -> [FAIL][7] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk1/igt@gem_ctx_isolation@bb-offset-switch@vecs0.html

  
New tests
---------

  New tests have been introduced between IGT_5704_full and IGTPW_4672_full:

### New IGT tests (13) ###

  * igt@gem_ctx_isolation@bb-offset-clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@bb-offset-clean@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 14.64] s

  * igt@gem_ctx_isolation@bb-offset-clean@rcs0:
    - Statuses : 3 fail(s) 4 pass(s)
    - Exec time: [0.00, 0.51] s

  * igt@gem_ctx_isolation@bb-offset-clean@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.03, 14.73] s

  * igt@gem_ctx_isolation@bb-offset-clean@vcs1:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.03, 14.37] s

  * igt@gem_ctx_isolation@bb-offset-clean@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [0.51, 0.61] s

  * igt@gem_ctx_isolation@bb-offset-reset:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@bb-offset-switch:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@gem_ctx_isolation@bb-offset-switch@bcs0:
    - Statuses : 2 fail(s) 3 skip(s)
    - Exec time: [0.0, 15.11] s

  * igt@gem_ctx_isolation@bb-offset-switch@rcs0:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [0.00, 0.52] s

  * igt@gem_ctx_isolation@bb-offset-switch@vcs0:
    - Statuses : 2 fail(s) 3 pass(s)
    - Exec time: [0.04, 14.91] s

  * igt@gem_ctx_isolation@bb-offset-switch@vcs1:
    - Statuses : 2 fail(s) 1 pass(s)
    - Exec time: [0.03, 14.97] s

  * igt@gem_ctx_isolation@bb-offset-switch@vecs0:
    - Statuses : 5 fail(s)
    - Exec time: [0.51, 14.98] s

  

Known issues
------------

  Here are the changes found in IGTPW_4672_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@q-independent@bcs0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2013])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk5/igt@gem_ctx_shared@q-independent@bcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk1/igt@gem_ctx_shared@q-independent@bcs0.html

  * igt@gem_exec_schedule@implicit-boths@rcs0:
    - shard-snb:          [PASS][10] -> [INCOMPLETE][11] ([i915#82])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-snb5/igt@gem_exec_schedule@implicit-boths@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb2/igt@gem_exec_schedule@implicit-boths@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118] / [i915#95])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk5/igt@gem_exec_whisper@basic-fds-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk7/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_mmap_gtt@basic-write-read-distinct:
    - shard-tglb:         [PASS][14] -> [DMESG-WARN][15] ([i915#402]) +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb6/igt@gem_mmap_gtt@basic-write-read-distinct.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb3/igt@gem_mmap_gtt@basic-write-read-distinct.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][16] -> [DMESG-FAIL][17] ([i915#118] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][18] -> [DMESG-WARN][19] ([i915#95]) +28 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#72])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-b-torture-move:
    - shard-tglb:         [PASS][22] -> [DMESG-WARN][23] ([i915#128])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb1/igt@kms_cursor_legacy@pipe-b-torture-move.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb2/igt@kms_cursor_legacy@pipe-b-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][24] -> [DMESG-FAIL][25] ([i915#54] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][26] -> [DMESG-FAIL][27] ([i915#54] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][32] -> [DMESG-WARN][33] ([i915#180]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][34] -> [INCOMPLETE][35] ([i915#61])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw2/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][36] -> [DMESG-FAIL][37] ([fdo#108145] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_prime@basic-crc@second-to-first:
    - shard-apl:          [PASS][38] -> [DMESG-FAIL][39] ([i915#95])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl2/igt@kms_prime@basic-crc@second-to-first.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl4/igt@kms_prime@basic-crc@second-to-first.html
    - shard-kbl:          [PASS][40] -> [DMESG-FAIL][41] ([i915#95])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl4/igt@kms_prime@basic-crc@second-to-first.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl3/igt@kms_prime@basic-crc@second-to-first.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][42] -> [SKIP][43] ([fdo#109642] / [fdo#111068])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][44] -> [FAIL][45] ([i915#173])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-iclb6/igt@kms_psr@no_drrs.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][46] -> [SKIP][47] ([fdo#109441]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb5/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@invalid:
    - shard-kbl:          [PASS][48] -> [DMESG-WARN][49] ([i915#93] / [i915#95]) +39 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl4/igt@kms_vblank@invalid.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl6/igt@kms_vblank@invalid.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [PASS][50] -> [FAIL][51] ([i915#1542])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-iclb4/igt@perf@blocking-parameterized.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb3/igt@perf@blocking-parameterized.html

  * igt@template@b:
    - shard-hsw:          [PASS][52] -> [TIMEOUT][53] ([i915#1958]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw2/igt@template@b.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw4/igt@template@b.html

  
#### Possible fixes ####

  * igt@gem_exec_params@invalid-fence-in:
    - shard-hsw:          [TIMEOUT][54] ([i915#1958]) -> [PASS][55] +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw4/igt@gem_exec_params@invalid-fence-in.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw6/igt@gem_exec_params@invalid-fence-in.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][56] ([i915#118] / [i915#95]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk1/igt@gem_exec_whisper@basic-forked.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk2/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_pread@bench:
    - shard-kbl:          [DMESG-WARN][58] ([i915#93] / [i915#95]) -> [PASS][59] +33 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl6/igt@gem_pread@bench.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl2/igt@gem_pread@bench.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-hsw:          [SKIP][62] ([fdo#109271]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw4/igt@i915_pm_rpm@gem-idle.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw8/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][64] ([i915#1982]) -> [PASS][65] +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][66] ([i915#54] / [i915#95]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][68] ([i915#95]) -> [PASS][69] +33 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl6/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][70] ([i915#79]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73] +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-snb:          [TIMEOUT][74] ([i915#1958]) -> [PASS][75] +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-snb2/igt@kms_flip_tiling@flip-changes-tiling.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb6/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [DMESG-WARN][76] ([i915#1982]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][78] ([i915#1982]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][80] ([i915#433]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][82] ([i915#95]) -> [PASS][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][84] ([i915#95]) -> [PASS][85] +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][86] ([fdo#109441]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-iclb8/igt@kms_psr@psr2_sprite_blt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-c-wait-busy:
    - shard-kbl:          [DMESG-WARN][88] ([i915#1982]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy.html

  * igt@perf@blocking-parameterized:
    - shard-tglb:         [FAIL][90] ([i915#1542]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb3/igt@perf@blocking-parameterized.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb3/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][92] ([i915#402]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-tglb8/igt@perf_pmu@module-unload.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-tglb1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-snb:          [TIMEOUT][94] ([i915#1958]) -> [SKIP][95] ([fdo#109271])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-snb2/igt@gem_bad_reloc@negative-reloc-lut.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb1/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][96] ([i915#1958]) -> [FAIL][97] ([i915#1930])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-hsw:          [SKIP][98] ([fdo#109271]) -> [TIMEOUT][99] ([i915#1958]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-hsw:          [TIMEOUT][100] ([i915#1958]) -> [SKIP][101] ([fdo#109271] / [fdo#111827])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
    - shard-snb:          [TIMEOUT][102] ([i915#1958]) -> [SKIP][103] ([fdo#109271] / [fdo#111827])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-snb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-snb1/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][104] ([i915#1319]) -> [TIMEOUT][105] ([i915#1319] / [i915#1635])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl7/igt@kms_content_protection@atomic.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl8/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][106] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][107] ([i915#1319] / [i915#1635])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][108] ([fdo#110321]) -> [TIMEOUT][109] ([i915#1319] / [i915#1635])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl7/igt@kms_content_protection@lic.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl8/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [TIMEOUT][110] ([i915#1319] / [i915#1958]) -> [TIMEOUT][111] ([i915#1319])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-kbl4/igt@kms_content_protection@srm.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-kbl3/igt@kms_content_protection@srm.html
    - shard-apl:          [TIMEOUT][112] ([i915#1319] / [i915#1635]) -> [FAIL][113] ([fdo#110321])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl8/igt@kms_content_protection@srm.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][114] ([i915#180]) -> [DMESG-WARN][115] ([i915#95])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_vblank@pipe-b-query-busy:
    - shard-apl:          [DMESG-WARN][116] ([i915#1982]) -> [DMESG-WARN][117] ([i915#95])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5704/shard-apl3/igt@kms_vblank@pipe-b-query-busy.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/shard-apl6/igt@kms_vblank@pipe-b-query-busy.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2013]: https://gitlab.freedesktop.org/drm/intel/issues/2013
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5704 -> IGTPW_4672

  CI-20190529: 20190529
  CI_DRM_8618: 88841e30e7f8c60ff464be277e5b8fef49ebaea0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4672: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/index.html
  IGT_5704: a8c256b4feb90201c727d72c168288a676c9d6ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4672/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
