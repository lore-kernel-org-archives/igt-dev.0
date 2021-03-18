Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 18 Mar 2021 04:30:41 -0000
Message-ID: <161604184179.12739.13264989254064351602@emeril.freedesktop.org>
References: <20210317224520.447939-1-lyude@redhat.com>
In-Reply-To: <20210317224520.447939-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Test_32x32_cursors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2092276049=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2092276049==
Content-Type: multipart/alternative;
 boundary="===============8918622418542474954=="

--===============8918622418542474954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test 32x32 cursors
URL   : https://patchwork.freedesktop.org/series/88079/
State : success

== Summary ==

CI Bug Log - changes from IGT_6035_full -> IGTPW_5615_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5615_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1] +19 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * {igt@kms_cursor_crc@pipe-a-cursor-32x32-random} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][2] +6 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html

  * {igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][3] +25 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * {igt@kms_cursor_crc@pipe-b-cursor-32x10-random} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][4] +23 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * {igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][5] +33 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * {igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +25 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html

  
New tests
---------

  New tests have been introduced between IGT_6035_full and IGTPW_5615_full:

### New IGT tests (36) ###

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.77] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.21, 0.67] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-random:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.76] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 0.57] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.19, 0.65] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.19, 0.55] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-random:
    - Statuses : 6 fail(s)
    - Exec time: [0.20, 0.56] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - Statuses : 4 fail(s)
    - Exec time: [0.25, 0.66] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - Statuses : 6 fail(s)
    - Exec time: [0.20, 0.66] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.52, 1.56] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.64] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - Statuses : 5 fail(s)
    - Exec time: [0.39, 1.37] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.47] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - Statuses : 6 fail(s)
    - Exec time: [0.39, 1.69] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-random:
    - Statuses : 5 fail(s)
    - Exec time: [0.31, 1.39] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
    - Statuses : 6 fail(s)
    - Exec time: [0.30, 1.56] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - Statuses : 5 fail(s)
    - Exec time: [0.33, 1.64] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.45, 1.41] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.37] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-random:
    - Statuses : 5 fail(s)
    - Exec time: [0.45, 1.42] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:
    - Statuses : 5 fail(s)
    - Exec time: [0.43, 1.42] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - Statuses : 5 fail(s)
    - Exec time: [0.38, 1.38] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.46] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - Statuses : 4 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.38] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.43] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - Statuses : 5 fail(s) 1 skip(s)
    - Exec time: [0.0, 1.42] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 1.30] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-random:
    - Statuses : 1 fail(s) 3 skip(s)
    - Exec time: [0.0, 1.30] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 1.29] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 1.31] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 1.33] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 1.32] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - Statuses : 1 fail(s) 4 skip(s)
    - Exec time: [0.0, 1.31] s

  

Known issues
------------

  Here are the changes found in IGTPW_5615_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][7] ([i915#3002]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_create@create-massive.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][8] ([i915#3002])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109314])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb7/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_eio@kms:
    - shard-glk:          [PASS][12] -> [INCOMPLETE][13] ([i915#2502])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk9/igt@gem_eio@kms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_eio@kms.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb4/igt@gem_exec_fair@basic-pace@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][20] -> [SKIP][21] ([fdo#109271])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][22] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#2849])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109283])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#112283])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#112283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][30] ([i915#2389]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl3/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-apl:          NOTRUN -> [TIMEOUT][31] ([i915#3183])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl3/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][32] ([i915#2389]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#307])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk9/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111656])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][36] ([i915#2658]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#768]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][38] ([i915#3002]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@gem_userptr_blits@input-checking.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][39] ([i915#3002])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][40] ([i915#3002])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][41] ([i915#3002])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap-busy@wc:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#1699]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html

  * igt@gen3_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109289])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#112306])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#112306])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#2527]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@gen9_exec_parse@bb-oversize.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#2527])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][48] -> [DMESG-WARN][49] ([i915#180]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl6/igt@i915_suspend@forcewake.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111614])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111615]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl6/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111828]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@kms_content_protection@atomic-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][60] ([i915#3137])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109300] / [fdo#111066])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * {igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278]) +18 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#109279]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][66] ([fdo#109271]) +429 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274] / [fdo#109278])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][68] -> [FAIL][69] ([i915#2346])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [FAIL][70] ([i915#2346])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
    - shard-glk:          NOTRUN -> [FAIL][71] ([i915#2346] / [i915#533])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#426])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#426])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2642])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][76] -> [FAIL][77] ([i915#49])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109280]) +11 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271]) +73 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111825]) +25 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271]) +73 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#1187])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#1187])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [PASS][84] -> [INCOMPLETE][85] ([i915#155])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#533])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][88] ([i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][90] ([fdo#108145] / [i915#265])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#112054])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2733])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#658])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658]) +6 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk1/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109642] / [fdo#111068] / [i915#658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109441])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb4/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][99] -> [SKIP][100] ([fdo#109441]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][101] ([i915#31])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb6/igt@kms_setmode@basic.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2530]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278] / [i915#2530])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271]) +239 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109291]) +5 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb2/igt@prime_nv_pcopy@test3_2.html

  * igt@prime_nv_test@nv_i915_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109291]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb2/igt@prime_nv_test@nv_i915_sharing.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         [PASS][107] -> [FAIL][108] ([i915#3028])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb4/igt@sysfs_clients@recycle-many.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          [PASS][109] -> [FAIL][110] ([i915#3028])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl2/igt@sysfs_clients@recycle-many.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@sysfs_clients@recycle-many.html
    - shard-snb:          NOTRUN -> [FAIL][111] ([i915#3028])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10@vcs0:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#3026]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@sysfs_clients@sema-10@vcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][113] ([i915#2846]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][115] ([i915#2842]) -> [PASS][116] +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][117] ([i915#2842]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/index.html

--===============8918622418542474954==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Test 32x32 cursors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88079/">https://patchwork.freedesktop.org/series/88079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6035_full -&gt; IGTPW_5615_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5615_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">FAIL</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-a-cursor-32x32-random} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html">FAIL</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html">FAIL</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-b-cursor-32x10-random} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">FAIL</a> +23 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">FAIL</a> +33 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html">FAIL</a> +25 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6035_full and IGTPW_5615_full:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.21, 0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-random:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.19, 0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.19, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-random:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.20, 0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.25, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.20, 0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.52, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.39, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.39, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-random:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.31, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.30, 1.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.33, 1.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.45, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-random:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.45, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.43, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.38, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>Statuses : 4 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 5 fail(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-random:</p>
<ul>
<li>Statuses : 1 fail(s) 3 skip(s)</li>
<li>Exec time: [0.0, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-random:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 1.33] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 1 fail(s) 4 skip(s)</li>
<li>Exec time: [0.0, 1.31] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5615_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb7/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk9/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_eio@kms.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_exec_params@secure-non-master.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl3/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl3/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#3183])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk9/igt@gem_mmap_gtt@big-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap-busy@wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@gem_userptr_blits@process-exit-mmap-busy@wc.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl6/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@kms_content_protection@atomic-dpms.html">FAIL</a> ([i915#3137])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109279]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +429 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb5/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb4/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb8/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb6/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109271]) +239 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-tglb2/igt@prime_nv_pcopy@test3_2.html">SKIP</a> ([fdo#109291]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_i915_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb2/igt@prime_nv_test@nv_i915_sharing.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-iclb4/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-iclb7/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl2/igt@sysfs_clients@recycle-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl7/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-snb2/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-apl8/igt@sysfs_clients@sema-10@vcs0.html">SKIP</a> ([fdo#109271] / [i915#3026]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5615/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6035/shard-kbl7">FAIL</a> ([i915#2842]) -&gt; [PASS][118]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8918622418542474954==--

--===============2092276049==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2092276049==--
