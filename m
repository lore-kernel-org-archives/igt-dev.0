Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 25 Jan 2021 20:37:12 -0000
Message-ID: <161160703239.3418.14951523740490142045@emeril.freedesktop.org>
References: <20210125152801.2515999-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210125152801.2515999-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9z?=
 =?utf-8?q?ysfs=5Fclients=3A_Check_that_client_ids_are_cyclic?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0099427147=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0099427147==
Content-Type: multipart/alternative;
 boundary="===============5091159505395129078=="

--===============5091159505395129078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/sysfs_clients: Check that client ids are cyclic
URL   : https://patchwork.freedesktop.org/series/86263/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9680_full -> IGTPW_5430_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5430_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5430_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5430_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition@1x-outputs:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb7/igt@kms_atomic_transition@modeset-transition@1x-outputs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_atomic_transition@modeset-transition@1x-outputs.html

  * {igt@sysfs_clients@recycle} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb6/igt@sysfs_clients@recycle.html
    - shard-hsw:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw5/igt@sysfs_clients@recycle.html
    - shard-iclb:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@sysfs_clients@recycle.html
    - shard-kbl:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@sysfs_clients@recycle.html
    - shard-apl:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl7/igt@sysfs_clients@recycle.html
    - shard-glk:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk2/igt@sysfs_clients@recycle.html
    - shard-tglb:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@sysfs_clients@recycle.html

  * igt@sysfs_timeslice_duration@duration:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@sysfs_timeslice_duration@duration.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_create@create-massive}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw7/igt@gem_create@create-massive.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9680_full and IGTPW_5430_full:

### New IGT tests (12) ###

  * igt@gem_blits@basic:
    - Statuses : 7 pass(s)
    - Exec time: [1.49, 14.06] s

  * igt@gem_userptr_blits@userfault:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 6.13] s

  * igt@kms_busy@basic-flip-pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.29, 0.91] s

  * igt@kms_busy@basic-flip-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.44, 1.91] s

  * igt@kms_busy@basic-flip-pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.72] s

  * igt@kms_busy@basic-flip-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 1.74] s

  * igt@kms_busy@basic-modeset-pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.51, 3.05] s

  * igt@kms_busy@basic-modeset-pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.48, 4.13] s

  * igt@kms_busy@basic-modeset-pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 4.14] s

  * igt@kms_busy@basic-modeset-pipe-d:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 4.02] s

  * igt@sysfs_clients@recycle:
    - Statuses : 7 fail(s)
    - Exec time: [0.30, 1.57] s

  

Known issues
------------

  Here are the changes found in IGTPW_5430_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw4/igt@gem_ctx_persistence@engines-cleanup.html
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb2/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2846])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#2842]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109283])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109283]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#2389]) +4 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-snb:          NOTRUN -> [FAIL][26] ([i915#2389]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb1/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2389]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#2389]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl4/igt@gem_exec_reloc@basic-many-active@vcs0.html
    - shard-hsw:          NOTRUN -> [FAIL][29] ([i915#2389]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw8/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#1610] / [i915#2803])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118] / [i915#95])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-iclb:         [PASS][34] -> [INCOMPLETE][35] ([i915#2295])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#768])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1704]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1704]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#112306])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#112306])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation (NEW):
    - shard-iclb:         [SKIP][41] ([i915#588]) -> [SKIP][42] ([i915#658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#1937])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#1937])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#1937])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_selftest@live@hangcheck:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][46] ([i915#2782])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#2705])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#2705])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl2/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#2705])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#2705])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk6/igt@kms_big_joiner@basic.html
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#2705])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl6/igt@kms_big_joiner@basic.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][52] ([i915#1149] / [i915#315])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_color@pipe-b-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [FAIL][53] ([i915#1149] / [i915#315])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw1/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb5/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb1/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [fdo#109279])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109279])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
    - shard-kbl:          [PASS][64] -> [FAIL][65] ([i915#54])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
    - shard-glk:          [PASS][66] -> [FAIL][67] ([i915#54])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
    - shard-apl:          [PASS][68] -> [FAIL][69] ([i915#54])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#72])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#533])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274]) +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][77] -> [FAIL][78] ([i915#2598])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][79] -> [FAIL][80] ([i915#79])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2672])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2587])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#111825]) +18 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109280]) +17 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271]) +36 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271]) +83 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#1187])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#1187])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#1839])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109289])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278]) +10 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][93] ([fdo#108145] / [i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][94] ([fdo#108145] / [i915#265])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][95] ([fdo#108145] / [i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#658]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#658]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#658]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#2920]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109441])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][102] -> [INCOMPLETE][103] ([i915#155])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271]) +47 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl3/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2530]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#2530]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@sysfs_heartbeat_interval@precise@rcs0:
    - shard-snb:          NOTRUN -> [SKIP][107] ([fdo#109271]) +71 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb7/igt@sysfs_heartbeat_interval@precise@rcs0.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-hsw:          NOTRUN -> [SKIP][108] ([fdo#109271]) +107 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw5/igt@sysfs_heartbeat_interval@precise@vcs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109307])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@tools_test@sysfs_l3_parity.html
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109307])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][111] ([i915#2846]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][115] ([i915#2842]) -> [PASS][116] +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][117] ([i915#2849]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [DMESG-WARN][119] ([i915#2803]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vcs0.html
    - shard-kbl:          [DMESG-WARN][121] ([i915#1610] / [i915#2803]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][123] ([i915#118] / [i915#95]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_whisper@basic-normal-all.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][125] ([i915#2190]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb5/igt@gem_huc_copy@huc-copy.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][127] ([i915#2880]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][129] ([i915#2880]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][131] ([i915#54]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][133] ([i915#79]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][135] ([i915#2598]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][137] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/index.html

--===============5091159505395129078==
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
<tr><td><b>Series:</b></td><td>i915/sysfs_clients: Check that client ids are cyclic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86263/">https://patchwork.freedesktop.org/series/86263/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9680_full -&gt; IGTPW_5430_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5430_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5430_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5430_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition@1x-outputs:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb7/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb6/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw5/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl7/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk2/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@sysfs_timeslice_duration@duration.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_create@create-massive}:<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw7/igt@gem_create@create-massive.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9680_full and IGTPW_5430_full:</p>
<h3>New IGT tests (12)</h3>
<ul>
<li>
<p>igt@gem_blits@basic:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [1.49, 14.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@userfault:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 6.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-flip-pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.29, 0.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-flip-pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.44, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-flip-pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-flip-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 1.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.51, 3.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.48, 4.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 4.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 4.02] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.30, 1.57] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5430_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw4/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb2/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl4/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw8/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb4/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@gem_exec_whisper@basic-queues-forked-all.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation (NEW):</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl2/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk6/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl6/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw1/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb5/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb1/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk1/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +83 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-apl3/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +47 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb7/igt@sysfs_heartbeat_interval@precise@rcs0.html">SKIP</a> ([fdo#109271]) +71 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw5/igt@sysfs_heartbeat_interval@precise@vcs0.html">SKIP</a> ([fdo#109271]) +107 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl6/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk9/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5430/">PASS</a></li>
</ul>
</li>
</ul>

</body>
</html>

--===============5091159505395129078==--

--===============0099427147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0099427147==--
