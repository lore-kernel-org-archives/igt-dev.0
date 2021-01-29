Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 29 Jan 2021 14:29:21 -0000
Message-ID: <161193056179.15524.15142112961281257859@emeril.freedesktop.org>
References: <20210129044152.30238-1-jeevan.b@intel.com>
In-Reply-To: <20210129044152.30238-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_reduce_execution_time_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1602645498=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1602645498==
Content-Type: multipart/alternative;
 boundary="===============3379913503451399783=="

--===============3379913503451399783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: reduce execution time (rev4)
URL   : https://patchwork.freedesktop.org/series/85060/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9697_full -> IGTPW_5442_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5442_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5442_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5442_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-glk:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@sysfs_clients@busy@vecs0}:
    - shard-kbl:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl7/igt@sysfs_clients@busy@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl4/igt@sysfs_clients@busy@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5442_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#658])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@feature_discovery@psr2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb7/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1610])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#2803])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [PASS][25] -> [DMESG-WARN][26] ([i915#2803])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb6/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#118] / [i915#95]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-snb:          [PASS][29] -> [INCOMPLETE][30] ([i915#2055])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-snb2/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-snb6/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#1317]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][32] ([fdo#109271]) +45 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +54 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl2/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#1317]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb5/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1704]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#1704]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][37] -> [TIMEOUT][38] ([i915#2795])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb5/igt@gem_vm_create@destroy-race.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109289]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb5/igt@gen7_exec_parse@bitmasks.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109289]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb3/igt@gen7_exec_parse@bitmasks.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271]) +54 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109506] / [i915#2411])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109293] / [fdo#109506])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#2574])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111614]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl7/igt@kms_chamelium@dp-mode-timings.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk7/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [fdo#109279])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109279]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#72])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][59] -> [FAIL][60] ([i915#2598])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-kbl:          NOTRUN -> [FAIL][61] ([i915#2641])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#2587])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-glk:          NOTRUN -> [FAIL][63] ([i915#2628])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-apl:          NOTRUN -> [FAIL][64] ([i915#2641])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - shard-kbl:          [PASS][65] -> [FAIL][66] ([i915#49])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-apl:          [PASS][67] -> [FAIL][68] ([i915#49])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#49])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#111825]) +18 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109280]) +15 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271]) +47 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109441])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109502])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb7/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109502])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@kms_vrr@flip-dpms.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109291]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109291]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][82] ([i915#2842]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][84] ([i915#2842]) -> [PASS][85] +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][86] ([i915#2842]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [FAIL][88] ([i915#2842]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][90] ([i915#118] / [i915#95]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][92] ([i915#454]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][94] ([i915#2681]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [WARN][96] ([i915#2684]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [FAIL][98] ([i915#54]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          [FAIL][100] ([i915#54]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [FAIL][102] ([i915#2346]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][104] ([i915#2122]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [FAIL][106] ([i915#79]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][108] ([fdo#109441]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][110] ([i915#1542]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@perf@polling-parameterized.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@perf@polling-parameterized.html

  * {igt@sysfs_clients@sema-10@rcs0}:
    - shard-kbl:          [SKIP][112] ([fdo#109271]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl2/igt@sysfs_clients@sema-10@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl7/igt@sysfs_clients@sema-10@rcs0.html

  * {igt@sysfs_clients@split-10@bcs0}:
    - shard-apl:          [SKIP][114] ([fdo#109271]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl4/igt@sysfs_clients@split-10@bcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl3/igt@sysfs_clients@split-10@bcs0.html

  
#### Warnings ####

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][116] ([i915#658]) -> [SKIP][117] ([i915#2920]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][118] ([i915#2920]) -> [SKIP][119] ([i915#658]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][120], [FAIL][121], [FAIL][122]) ([i915#2295]) -> ([FAIL][123], [FAIL][124], [FAIL][125]) ([i915#2295] / [i915#2505])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl2/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl4/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][126], [FAIL][127], [FAIL][128]) ([i915#2295] / [i915#2724]) -> ([FAIL][129], [FAIL][130], [FAIL][131]) ([i915#2295] / [i915#2426] / [i915#2724])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb8/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][132], [FAIL][133], [FAIL][134]) ([i915#2295]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1610] / [i915#2295] / [i915#2426])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl8/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][138], [FAIL][139], [FAIL][140]) ([i915#2295] / [i915#2667]) -> ([FAIL][141], [FAIL][142], [FAIL][143]) ([i915#2295] / [i915#2426] / [i915#2803])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb5/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1317]: https://gitlab.freedesktop.org/drm/intel/issues/1317
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2574]: https://gitlab.freedesktop.org/drm/intel/issues/2574
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2598]: https://gitlab.freedesktop.org/drm/intel/issues/2598
  [i915#2628]: https://gitlab.freedesktop.org/drm/intel/issues/2628
  [i915#2641]: https://gitlab.freedesktop.org/drm/intel/issues/2641
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2803]: https://gitlab.freedesktop.org/drm/intel/issues/2803
  [i915#2842]: h

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/index.html

--===============3379913503451399783==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: reduce execution tim=
e (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85060/">https://patchwork.freedesktop.org/series/85060/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5442/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9697_full -&gt; IGTPW_5442_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5442_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5442_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5442=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-glk9/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@sysfs_clients@busy@vecs0}:<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-kbl7/igt@sysfs_clients@busy@vecs0.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl4/ig=
t@sysfs_clients@busy@vecs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5442_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb7/ig=
t@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
hostile-preempt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-tglb6/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-t=
glb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"h">i915#2=
842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-kbl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"h=
">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shar=
d-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"h">=
i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb3/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb7/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-apl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shar=
d-apl3/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-tglb2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803">i915#2803</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb6/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sh=
ard-iclb3/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2803">i915#2803</a>)=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-glk6/igt@gem_exec_whisper@basic-contexts-priority-all.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5442/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-snb2/igt@gem_fenced_exec_thrash@2-spare-fences.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/=
shard-snb6/igt@gem_fenced_exec_thrash@2-spare-fences.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@gem_userptr_blits@mmap-offset-inva=
lidate-active@gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1317">i915#1317</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-snb6/igt@gem_userptr_blits@mmap-offset-invali=
date-active@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +45 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-kbl2/igt@gem_userptr_blits@mmap-offset-invali=
date-active@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +54 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-tglb5/igt@gem_userptr_blits@mmap-offset-inva=
lidate-active@wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1317">i915#1317</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb8/igt@gem_userptr_blits@readonly-mmap-uns=
ync@wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb1/igt@gem_userptr_blits@readonly-mmap-uns=
ync@wb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1704">i915#1704</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb=
5/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2795">i915#2795</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb5/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb3/igt@gen7_exec_parse@bitmasks.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-apl8/igt@i915_pm_rpm@modeset-pc8-residency-st=
ress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +54 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb1/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb3/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109506">fdo#109506</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard=
-tglb7/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2574">i915#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb3/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-apl7/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-glk7/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_chamelium@vga-edid-read.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5442/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.ht=
ml">FAIL</a> ([i915#72])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
4">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_544=
2/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i915#2598</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-kbl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytileccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2641">i915#2641</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2587">i915#2587</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-glk7/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytileccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2628">i915#2628</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytileccs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2641">i915#2641</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
lflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5442/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
indfb-plflip-blt.html">FAIL</a> ([i915#49])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
lflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5442/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
indfb-plflip-blt.html">FAIL</a> ([i915#49])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-p=
lflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5442/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-=
indfb-plflip-blt.html">FAIL</a> ([i915#49])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-indfb-fliptrack.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb6/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-glk6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-=
iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +3 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb1/igt@kms_vblank@pipe-d-ts-continuation-=
idle-hang.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109502=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109502=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9291">fdo#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb3/igt@prime_nv_api@i915_nv_import_twice.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9291">fdo#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"h">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5442/shard-iclb7/igt@gem_exec_fair@basic-none-share=
@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<=
a href=3D"h">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5442/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PA=
SS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"h">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5442/shard-tglb2/igt@gem_exec_fair@basic-pace-share@=
rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</=
a> (<a href=3D"h">i915#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5442/shard-glk7/igt@gem_exec_fair@basic-pace-share@rc=
s0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-glk8/igt@gem_exec_whisper@basic-forked-all.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5442/shard-glk9/igt@gem_exec_whisper@basic-forked-all.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard=
-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/=
shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/=
shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.ht=
ml">FAIL</a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5442/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-128x128-onsc=
reen.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9697/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.ht=
ml">FAIL</a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5442/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onsc=
reen.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5442/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5442/shard-glk3/igt@kms_flip@2x-plain-flip-f=
b-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAI=
L</a> ([i915#79]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5442/shard-apl8/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_544=
2/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb2/igt@perf@polling-parameterized.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shar=
d-iclb1/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@sema-10@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-kbl2/igt@sysfs_clients@sema-10@rcs0.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sha=
rd-kbl7/igt@sysfs_clients@sema-10@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@split-10@bcs0}:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-apl4/igt@sysfs_clients@split-10@bcs0.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/sh=
ard-apl3/igt@sysfs_clients@split-10@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
-3.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5442/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-kbl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9697/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5442/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-kbl1/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2505">i915#2505</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-iclb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9697/shard-iclb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2724">i915#2724</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb3=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-iclb4/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9697/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl3/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5442/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-apl8/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1610">i915#1610</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2426">i915#2426</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9697/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9697/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9697/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2667">i915#2667</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5442/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5442/shard-tglb8/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2803">i915#2803</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3379913503451399783==--

--===============1602645498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1602645498==--
