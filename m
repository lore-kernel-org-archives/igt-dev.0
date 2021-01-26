Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 Jan 2021 23:20:34 -0000
Message-ID: <161170323458.9813.707296514414459734@emeril.freedesktop.org>
References: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210126130505.2938391-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/sysfs=5Fclient=3A_Ignore_?=
 =?utf-8?q?clients_being_closed_as_we_read_their_sysfs?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0797461089=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0797461089==
Content-Type: multipart/alternative;
 boundary="===============1448078225265722089=="

--===============1448078225265722089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/sysfs_client: Ignore clients being closed as we read their sysfs
URL   : https://patchwork.freedesktop.org/series/86298/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9684_full -> IGTPW_5432_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5432_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@sysfs_clients@recycle} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@sysfs_clients@recycle.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@sysfs_clients@recycle.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@sysfs_clients@recycle.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9684_full and IGTPW_5432_full:

### New IGT tests (1) ###

  * igt@sysfs_clients@recycle:
    - Statuses : 3 fail(s) 4 pass(s)
    - Exec time: [0.73, 5.54] s

  

Known issues
------------

  Here are the changes found in IGTPW_5432_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][4] -> [DMESG-WARN][5] ([i915#1602])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb8/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [PASS][6] -> [DMESG-WARN][7] ([i915#2283])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl3/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl3/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#2283])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#2283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [PASS][12] -> [DMESG-WARN][13] ([i915#1602] / [i915#2283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb5/igt@core_hotunplug@unbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#1839])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb7/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-hsw:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1099]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][17] -> [FAIL][18] ([i915#2846])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-apl:          NOTRUN -> [TIMEOUT][26] ([i915#1729])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2389]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - shard-tglb:         [PASS][28] -> [DMESG-WARN][29] ([i915#2803])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@gem_exec_schedule@u-fairslice@vcs1.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][30] -> [DMESG-WARN][31] ([i915#118] / [i915#95]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-snb:          [PASS][32] -> [INCOMPLETE][33] ([i915#2055])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-snb2/igt@gem_fenced_exec_thrash@too-many-fences.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb1/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk6/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#2190])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#1317]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271]) +60 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271]) +65 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#1317]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#1436] / [i915#716])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#112306])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109289])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [PASS][46] -> [WARN][47] ([i915#2681] / [i915#2684])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-hsw:          [PASS][48] -> [FAIL][49] ([i915#1860])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][50] -> [FAIL][51] ([i915#2597])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-hsw:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw2/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_chamelium@hdmi-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-iclb:         NOTRUN -> [FAIL][59] ([i915#1149] / [i915#315])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][60] ([i915#1149] / [i915#315]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@kms_color@pipe-d-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278] / [i915#1149])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109300] / [fdo#111066])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111828])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [PASS][66] -> [FAIL][67] ([i915#54])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [PASS][68] -> [FAIL][69] ([i915#54])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109279])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109279])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274] / [fdo#109278])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#426])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109274]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][75] -> [FAIL][76] ([i915#2598])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2642])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#2642])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2642])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2672])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#2672])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2587])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2672])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_flip_tiling@flip-yf-tiled:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@kms_flip_tiling@flip-yf-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +71 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#111825]) +12 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109280]) +16 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271]) +50 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][90] ([fdo#108145] / [i915#265]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278]) +7 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#658]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#658]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109642] / [fdo#111068] / [i915#658])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@cursor_plane_onoff:
    - shard-hsw:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#1072]) +6 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@kms_psr@cursor_plane_onoff.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109441]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][100] -> [SKIP][101] ([fdo#109441])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][102] ([IGT#2])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl3/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][103] ([IGT#2])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@kms_sysfs_edid_timing.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#2530])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#2530])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109289])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109291])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109291]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-hsw:          NOTRUN -> [SKIP][109] ([fdo#109271]) +149 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw4/igt@sysfs_heartbeat_interval@precise@vcs0.html

  
#### Possible fixes ####

  * igt@api_intel_bb@render-ccs:
    - shard-tglb:         [INCOMPLETE][110] ([i915#2588]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb5/igt@api_intel_bb@render-ccs.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@api_intel_bb@render-ccs.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][112] ([i915#2846]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][118] ([i915#2842]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [FAIL][120] ([i915#2842]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][122] ([i915#2849]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - shard-iclb:         [DMESG-WARN][124] ([i915#2803]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb4/igt@gem_exec_schedule@u-fairslice@bcs0.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-apl:          [DMESG-WARN][126] ([i915#1610]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl1/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl6/igt@gem_exec_schedule@u-fairslice@vcs0.html
    - shard-kbl:          [DMESG-WARN][128] ([i915#1610] / [i915#2803]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl3/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][130] ([i915#2190]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [INCOMPLETE][132] ([i915#2405]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@huge-split:
    - shard-apl:          [INCOMPLETE][134] ([i915#2502]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl3/igt@gem_userptr_blits@huge-split.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@gem_userptr_blits@huge-split.html

  * igt@gem_workarounds@reset-context:
    - shard-snb:          [TIMEOUT][136] -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-snb1/igt@gem_workarounds@reset-context.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb7/igt@gem_workarounds@reset-context.html

  * igt@i915_selftest@mock@requests:
    - shard-glk:          [INCOMPLETE][138] -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@i915_selftest@mock@requests.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@i915_selftest@mock@requests.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][140] ([i915#2370]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][142] ([i915#2598]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [INCOMPLETE][144] ([i915#155] / [i915#2828]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][146] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@kms_psr2_su@page_flip.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][148] ([fdo#109441]) -> [PASS][149] +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html

--===============1448078225265722089==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] i915/sysfs_client: Ignore clients being closed as we read their sysfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86298/">https://patchwork.freedesktop.org/series/86298/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9684_full -&gt; IGTPW_5432_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5432_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@sysfs_clients@recycle} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@sysfs_clients@recycle.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9684_full and IGTPW_5432_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@sysfs_clients@recycle:<ul>
<li>Statuses : 3 fail(s) 4 pass(s)</li>
<li>Exec time: [0.73, 5.54] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5432_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb8/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl3/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl3/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb5/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602] / [i915#2283])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb7/igt@gem_ctx_persistence@hang.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> ([i915#1729])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@gem_exec_schedule@u-fairslice@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs1.html">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk5/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-snb2/igt@gem_fenced_exec_thrash@too-many-fences.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb1/igt@gem_fenced_exec_thrash@too-many-fences.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +60 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html">SKIP</a> ([fdo#109271]) +65 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb8/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#1860])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl2/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw2/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb5/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@kms_color@pipe-d-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-yf-tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@kms_flip_tiling@flip-yf-tiled.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +71 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html">SKIP</a> ([fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_onoff:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@kms_psr@cursor_plane_onoff.html">SKIP</a> ([fdo#109271] / [i915#1072]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl3/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb7/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb5/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw4/igt@sysfs_heartbeat_interval@precise@vcs0.html">SKIP</a> ([fdo#109271]) +149 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb5/igt@api_intel_bb@render-ccs.html">INCOMPLETE</a> ([i915#2588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb6/igt@api_intel_bb@render-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk5/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb4/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb3/igt@gem_exec_schedule@u-fairslice@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl1/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl6/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl3/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl2/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl2/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-apl3/igt@gem_userptr_blits@huge-split.html">INCOMPLETE</a> ([i915#2502]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-apl8/igt@gem_userptr_blits@huge-split.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@reset-context:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-snb1/igt@gem_workarounds@reset-context.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-snb7/igt@gem_workarounds@reset-context.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@requests:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-glk9/igt@i915_selftest@mock@requests.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-glk7/igt@i915_selftest@mock@requests.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPLETE</a> ([i915#155] / [i915#2828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5432/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9684/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) -&gt; [PASS][149] +1 similar issue</li>
</ul>
</li>
</ul>
<p>[</p>

</body>
</html>

--===============1448078225265722089==--

--===============0797461089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0797461089==--
