Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Mar 2021 03:52:16 -0000
Message-ID: <161612593673.8628.8973440224055702117@emeril.freedesktop.org>
References: <20210318222124.970997-1-lyude@redhat.com>
In-Reply-To: <20210318222124.970997-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Test_32x32_cursors?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0367973365=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0367973365==
Content-Type: multipart/alternative;
 boundary="===============2526058752118640560=="

--===============2526058752118640560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Test 32x32 cursors
URL   : https://patchwork.freedesktop.org/series/88144/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6038_full -> IGTPW_5625_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5625_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5625_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5625_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +34 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@perf@invalid-oa-format-id:
    - shard-iclb:         [PASS][5] -> [SKIP][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb5/igt@perf@invalid-oa-format-id.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@perf@invalid-oa-format-id.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-tglb:         [PASS][7] -> [SKIP][8] +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb8/igt@perf@whitelisted-registers-userspace-config.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@perf@whitelisted-registers-userspace-config.html

  
New tests
---------

  New tests have been introduced between IGT_6038_full and IGTPW_5625_full:

### New IGT tests (36) ###

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-random:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-random:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-random:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-random:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-random:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-random:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5625_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#1839])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb5/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +10 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][12] -> [FAIL][13] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#2842]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2389])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-snb:          NOTRUN -> [FAIL][24] ([i915#2389]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][25] ([i915#2389])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk8/igt@gem_exec_whisper@basic-forked.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk2/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][28] ([i915#2658])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk7/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][31] ([i915#2658])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][32] ([i915#2658]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][33] ([i915#3002])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1699]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#112306]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271]) +446 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112306]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][38] -> [FAIL][39] ([i915#454])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-kbl:          [PASS][40] -> [TIMEOUT][41] ([i915#1288])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [PASS][42] -> [DMESG-FAIL][43] ([i915#3047])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk8/igt@i915_selftest@live@client.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@i915_selftest@live@client.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111614])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110725] / [fdo#111614])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +30 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-c-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][49] ([i915#1149] / [i915#315])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_color@pipe-c-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][50] ([i915#1149] / [i915#315])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_color@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-green-to-red:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][55] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#2105])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111828])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_content_protection@uevent.html
    - shard-apl:          NOTRUN -> [FAIL][58] ([i915#2105])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_content_protection@uevent.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109300] / [fdo#111066])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * {igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278]) +46 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271]) +87 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109279]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-tglb:         [PASS][64] -> [INCOMPLETE][65] ([i915#1436] / [i915#1982])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][66] -> [FAIL][67] ([i915#2346])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109274]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][69] ([i915#2122])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#2642]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][71] ([i915#2641])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111825]) +18 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109280]) +16 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +94 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109289])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109289])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#533]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html
    - shard-kbl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#658])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109441]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][88] ([i915#31])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +297 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109502])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_vrr@flipline.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109502])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2437]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2530])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2530])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@perf@invalid-oa-format-id:
    - shard-kbl:          [PASS][97] -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@perf@invalid-oa-format-id.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@perf@invalid-oa-format-id.html

  * igt@perf@polling-parameterized:
    - shard-apl:          NOTRUN -> [FAIL][99] ([i915#1542])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl8/igt@perf@polling-parameterized.html

  * igt@perf@whitelisted-registers-userspace-config:
    - shard-glk:          [PASS][100] -> [SKIP][101] ([fdo#109271]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk1/igt@perf@whitelisted-registers-userspace-config.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk5/igt@perf@whitelisted-registers-userspace-config.html
    - shard-apl:          [PASS][102] -> [SKIP][103] ([fdo#109271]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl1/igt@perf@whitelisted-registers-userspace-config.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@perf@whitelisted-registers-userspace-config.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109291])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [FAIL][106] ([i915#2842]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][108] ([i915#2842]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-apl:          [DMESG-WARN][110] ([i915#1610]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [DMESG-WARN][112] ([i915#118] / [i915#95]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][114] ([i915#2428]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][116] ([i915#2782]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b:
    - shard-kbl:          [FAIL][118] ([i915#3168]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl4/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl7/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][120] ([i915#180]) -> [PASS][121] +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-glk:          [FAIL][122] ([i915#49]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk3/igt@km

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html

--===============2526058752118640560==
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
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/88144/">https://patchwork.freedesktop.org/series/88144/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6038_full -&gt; IGTPW_5625_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5625_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5625_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5625_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> +34 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered-pipe-b-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl1/igt@kms_plane@plane-position-covered-pipe-b-planes.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-format-id:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb5/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@perf@invalid-oa-format-id.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb8/igt@perf@whitelisted-registers-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@perf@whitelisted-registers-userspace-config.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6038_full and IGTPW_5625_full:</p>
<h3>New IGT tests (36)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-random:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-random:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-random:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-random:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-random:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-sliding:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-random:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5625_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@gem_exec_reloc@basic-many-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk8/igt@gem_exec_whisper@basic-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk2/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl8/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl6/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb2/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> ([fdo#109271]) +446 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">TIMEOUT</a> ([i915#1288])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk8/igt@i915_selftest@live@client.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@i915_selftest@live@client.html">DMESG-FAIL</a> ([i915#3047])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_color@pipe-c-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_color@pipe-c-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk1/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl7/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-green-to-red:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-green-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb8/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_content_protection@uevent.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109278]) +46 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk6/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html">SKIP</a> ([fdo#109271]) +87 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +94 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk4/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl2/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +297 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb7/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-format-id:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@perf@invalid-oa-format-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl2/igt@perf@invalid-oa-format-id.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl8/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@perf@whitelisted-registers-userspace-config:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk1/igt@perf@whitelisted-registers-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk5/igt@perf@whitelisted-registers-userspace-config.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl1/igt@perf@whitelisted-registers-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@perf@whitelisted-registers-userspace-config.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk2/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-glk3/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#2428]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-snb6/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-kbl4/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b.html">FAIL</a> ([i915#3168]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-kbl7/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@dp-1-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5625/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6038/shard-glk3/igt@km">FAIL</a> ([i915#49]) -&gt; [PASS][123]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2526058752118640560==--

--===============0367973365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0367973365==--
