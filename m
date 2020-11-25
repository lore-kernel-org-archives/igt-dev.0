Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 25 Nov 2020 13:57:03 -0000
Message-ID: <160631262359.8877.4196955861669021032@emeril.freedesktop.org>
References: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20201125112540.426554-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/perf=3A_verify_non_zero_reason_field_in_OA_reports?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0824057803=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0824057803==
Content-Type: multipart/alternative;
 boundary="===============0088272418547476630=="

--===============0088272418547476630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/perf: verify non zero reason field in OA reports
URL   : https://patchwork.freedesktop.org/series/84258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9389_full -> IGTPW_5226_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5226_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@perf@non-zero-reason} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@perf@non-zero-reason.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_userptr_blits@vma-merge}:
    - shard-snb:          [FAIL][2] ([i915#1635]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-snb4/igt@gem_userptr_blits@vma-merge.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-snb6/igt@gem_userptr_blits@vma-merge.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9389_full and IGTPW_5226_full:

### New IGT tests (1) ###

  * igt@perf@non-zero-reason:
    - Statuses : 1 fail(s) 4 pass(s) 2 skip(s)
    - Exec time: [0.0, 41.66] s

  

Known issues
------------

  Here are the changes found in IGTPW_5226_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_eio@kms:
    - shard-kbl:          [PASS][4] -> [DMESG-WARN][5] ([i915#165] / [i915#78]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@gem_eio@kms.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@gem_eio@kms.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2389])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_workarounds@suspend-resume:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#2635])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk9/igt@gem_workarounds@suspend-resume.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@gem_workarounds@suspend-resume.html
    - shard-iclb:         [PASS][10] -> [INCOMPLETE][11] ([i915#1185])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@gem_workarounds@suspend-resume.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@gem_workarounds@suspend-resume.html
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#1635] / [i915#2635])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@gem_workarounds@suspend-resume.html
    - shard-kbl:          [PASS][14] -> [INCOMPLETE][15] ([i915#155])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl3/igt@gem_workarounds@suspend-resume.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@gem_workarounds@suspend-resume.html
    - shard-hsw:          [PASS][16] -> [INCOMPLETE][17] ([i915#2637])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@gem_workarounds@suspend-resume.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][18] -> [SKIP][19] ([i915#579])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#78]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#1982]) +6 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][24] -> [FAIL][25] ([i915#96])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-apl:          [PASS][26] -> [DMESG-WARN][27] ([i915#1635] / [i915#1982]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][28] -> [FAIL][29] ([i915#2346])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#1982]) +5 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#2598]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][34] -> [INCOMPLETE][35] ([i915#2295])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence:
    - shard-tglb:         [PASS][36] -> [DMESG-WARN][37] ([i915#1982]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#109441]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][40] -> [SKIP][41] ([fdo#109271])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-hsw:          [PASS][42] -> [SKIP][43] ([fdo#109271])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][44] -> [SKIP][45] ([fdo#109278])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-kbl:          [PASS][46] -> [SKIP][47] ([fdo#109271])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-apl:          [PASS][48] -> [SKIP][49] ([fdo#109271] / [i915#1635])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][50] -> [FAIL][51] ([i915#1542] / [i915#1635])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl7/igt@perf@polling-parameterized.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl7/igt@perf@polling-parameterized.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-glk:          [INCOMPLETE][52] ([i915#2283] / [i915#2405]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [INCOMPLETE][54] ([i915#1635] / [i915#2283] / [i915#2405]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@device_reset@unbind-reset-rebind.html
    - shard-kbl:          [INCOMPLETE][56] ([i915#2283] / [i915#2405]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
    - shard-tglb:         [INCOMPLETE][58] ([i915#1602] / [i915#750]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [INCOMPLETE][60] ([i915#2283] / [i915#2405]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@device_reset@unbind-reset-rebind.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][62] ([i915#658]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [DMESG-WARN][64] ([i915#118] / [i915#95]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - shard-iclb:         [DMESG-WARN][66] -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][68] ([i915#454]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][70] ([fdo#109271]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][72] ([fdo#109271] / [i915#1635]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][74] ([fdo#109271]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_busy@basic-modeset-pipe-c:
    - shard-hsw:          [DMESG-WARN][78] ([i915#44]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@kms_busy@basic-modeset-pipe-c.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [DMESG-WARN][80] ([i915#1635] / [i915#1982]) -> [PASS][81] +4 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-glk:          [DMESG-WARN][82] ([i915#1982]) -> [PASS][83] +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-glk:          [FAIL][84] ([i915#64]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][86] ([i915#62]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-kbl:          [FAIL][88] ([i915#49]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
    - shard-apl:          [FAIL][90] ([i915#1635] / [i915#49]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][92] ([i915#1982]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][94] ([fdo#109441]) -> [PASS][95] +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-b-wait-forked-busy:
    - shard-kbl:          [DMESG-WARN][96] ([i915#1982]) -> [PASS][97] +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html

  * igt@perf_pmu@module-unload:
    - shard-apl:          [DMESG-WARN][98] ([i915#1635] / [i915#1982] / [i915#262]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl1/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-hsw:          [INCOMPLETE][100] ([i915#2283] / [i915#2405]) -> [WARN][101] ([i915#2283])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_workarounds@suspend-resume:
    - shard-tglb:         [DMESG-WARN][102] ([i915#2411]) -> [DMESG-WARN][103] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb1/igt@gem_workarounds@suspend-resume.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][104] ([i915#588]) -> [SKIP][105] ([i915#658])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][106] ([i915#1804] / [i915#2684]) -> [WARN][107] ([i915#2684])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-tglb:         [DMESG-WARN][108] ([i915#2411]) -> [SKIP][109] ([i915#579])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][110] ([i915#2411]) -> [SKIP][111] ([i915#2648])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][112] ([i915#2283] / [i915#2295]) -> [FAIL][113] ([fdo#109271] / [i915#2295])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][114], [FAIL][115], [FAIL][116]) ([i915#1814] / [i915#2283] / [i915#2295] / [i915#483]) -> ([FAIL][117], [FAIL][118]) ([i915#2295])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][119], [FAIL][120]) ([i915#1635] / [i915#2295]) -> ([FAIL][121], [FAIL][122]) ([fdo#109271] / [i915#1635] / [i915#2295])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][123], [FAIL][124], [FAIL][125]) ([i915#2295]) -> ([FAIL][126], [FAIL][127]) ([i915#1602] / [i915#2295])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2283]: https://gitlab.freedesktop.org/drm/intel/issues/2283
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#44]: https://gitlab.freedesktop.org/drm/intel/issues/44
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5870 -> IGTPW_5226
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html

--===============0088272418547476630==
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
<tr><td><b>Series:</b></td><td>tests/i915/perf: verify non zero reason field in OA reports</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84258/">https://patchwork.freedesktop.org/series/84258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9389_full -&gt; IGTPW_5226_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5226_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@perf@non-zero-reason} (NEW):<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@perf@non-zero-reason.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_userptr_blits@vma-merge}:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-snb4/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-snb6/igt@gem_userptr_blits@vma-merge.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9389_full and IGTPW_5226_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@perf@non-zero-reason:<ul>
<li>Statuses : 1 fail(s) 4 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 41.66] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5226_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@gem_eio@kms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk2/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk9/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl4/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl3/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk3/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk1/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@kms_frontbuffer_tracking@psr-farfromfence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@kms_frontbuffer_tracking@psr-farfromfence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl7/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl7/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk2/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl6/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/750">i915#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb3/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@device_reset@unbind-reset-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk3/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb7/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-modeset-pipe-c:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw4/igt@kms_busy@basic-modeset-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/44">i915#44</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@kms_busy@basic-modeset-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-glk6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/64">i915#64</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-glk7/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_flip@flip-vs-rmfb-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl1/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl2/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-forked-busy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-kbl1/igt@kms_vblank@pipe-b-wait-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-kbl2/igt@kms_vblank@pipe-b-wait-forked-busy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/262">i915#262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl1/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@device_reset@unbind-reset-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw2/igt@device_reset@unbind-reset-rebind.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb1/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2648">i915#2648</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-hsw5/igt@runner@aborted.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-iclb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2283">i915#2283</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-iclb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9389/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5870 -&gt; IGTPW_5226</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9389: b0c2cf3ad04abd9e7a44abe12e736bb5ab587393 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5226: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5226/index.html<br />
  IGT_5870: 08b13995b85df26a77212e4fb21fd772976ef33c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0088272418547476630==--

--===============0824057803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0824057803==--
