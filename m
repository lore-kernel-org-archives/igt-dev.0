Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 Jan 2021 22:48:50 -0000
Message-ID: <161187413010.13619.8290310355089098489@emeril.freedesktop.org>
References: <20210128182149.20278-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210128182149.20278-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fvrr=3A_Update_condition_checks_for_flipline_test_=28rev4?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0653338044=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0653338044==
Content-Type: multipart/alternative;
 boundary="===============2882637211539670178=="

--===============2882637211539670178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_vrr: Update condition checks for flipline test (rev4)
URL   : https://patchwork.freedesktop.org/series/84932/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9693_full -> IGTPW_5437_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5437_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5437_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5437_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5437_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-hsw:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb7/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_persistence@userptr:
    - shard-hsw:          NOTRUN -> [SKIP][5] ([fdo#109271]) +57 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_ctx_persistence@userptr.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl4/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2842]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842]) +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109313])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#112283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1610])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl8/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@gem_exec_schedule@u-fairslice@vecs0.html
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#2803])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@hang:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk6/igt@gem_mmap_gtt@hang.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@gem_mmap_gtt@hang.html

  * igt@gem_pread@exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#768]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#110542])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb8/igt@gem_userptr_blits@coherency-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109290])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][28] ([i915#3002])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#1317]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-hsw:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3012])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110892])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([i915#155] / [i915#636])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@i915_suspend@forcewake.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#1769])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1769])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111614])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110723])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@pipe-d-crc-primary-basic:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +50 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl4/igt@kms_ccs@pipe-d-crc-primary-basic.html

  * igt@kms_chamelium@vga-hpd:
    - shard-snb:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb5/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278] / [i915#1149])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-hsw:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109300] / [fdo#111066])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111828])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109279]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][53] ([i915#54])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][54] -> [FAIL][55] ([i915#54])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278]) +9 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +75 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:
    - shard-hsw:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][59] -> [FAIL][60] ([i915#96]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-hsw:          [PASS][61] -> [FAIL][62] ([i915#2370])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274] / [fdo#109278])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271]) +92 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][66] -> [FAIL][67] ([i915#2598])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][68] -> [INCOMPLETE][69] ([i915#2055])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#2642])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-apl:          NOTRUN -> [FAIL][71] ([i915#2641])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
    - shard-kbl:          NOTRUN -> [FAIL][72] ([i915#2641])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109285])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109285])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111825]) +19 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +22 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271]) +54 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][78] -> [SKIP][79] ([i915#433])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][80] -> [FAIL][81] ([i915#1036])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#111615])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#658])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2920])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#658]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109642] / [fdo#111068] / [i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@primary_mmap_cpu:
    - shard-hsw:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#1072]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_psr@primary_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109441])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][92] -> [SKIP][93] ([fdo#109441])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2530]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb8/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2530]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109291]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_nv_test@nv_i915_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109291]) +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7/igt@prime_nv_test@nv_i915_sharing.html

  
#### Possible fixes ####

  * igt@drm_read@short-buffer-block:
    - shard-glk:          [DMESG-WARN][98] ([i915#118] / [i915#95]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk4/igt@drm_read@short-buffer-block.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk8/igt@drm_read@short-buffer-block.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-iclb:         [INCOMPLETE][100] ([i915#1185]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][102] ([i915#2851]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         [FAIL][106] ([i915#2842]) -> [PASS][107] +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][108] ([i915#2842]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][110] ([i915#454]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_selftest@live@hangcheck:
    - shard-hsw:          [INCOMPLETE][112] ([i915#2782]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@i915_selftest@live@hangcheck.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [DMESG-WARN][114] ([i915#180]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][116] ([i915#2370]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][118] ([i915#2598]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-kbl:          [FAIL][120] ([i915#79]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_plane@plane-panning-top-left-pipe-a-planes:
    - shard-glk:          [FAIL][122] ([i915#1036]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk4/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][124] ([fdo#109441]) -> [PASS][125] +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-hsw:          [FAIL][126] ([IGT#2]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_sysfs_edid_timing.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_sysfs_edid_timing.html

  * {igt@sysfs_clients@sema-10@rcs0}:
    - shard-kbl:          [SKIP][128] ([fdo#109271]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@sysfs_clients@sema-10@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@sysfs_clients@sema-10@rcs0.html

  * {igt@sysfs_clients@sema-10@vcs0}:
    - shard-apl:          [SKIP][130] ([fdo#109271]) -> [PASS][131] +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl1/igt@sysfs_clients@sema-10@vcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl3/igt@sysfs_clients@sema-10@vcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][132] ([i915#1804] / [i915#2684]) -> [WARN][133] ([i915#2684])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-snb:          [INCOMPLETE][134] -> [SKIP][135] ([fdo#109271])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-snb5/igt@i915_pm_rpm@sysfs-read.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb7/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][136] ([i915#2920]) -> [SKIP][137] ([i915#658]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][138] ([i915#658]) -> [SKIP][139] ([i915#2920]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][140], [FAIL][141], [FAIL][142]) ([i915#2295] / [i915#2724]) -> ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#2295] / [i915#2426] / [i915#2724])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb8/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb5/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb4/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/index.html

--===============2882637211539670178==
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
<tr><td><b>Series:</b></td><td>tests/kms_vrr: Update condition checks for flipline test (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84932/">https://patchwork.freedesktop.org/series/84932/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9693_full -&gt; IGTPW_5437_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5437_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5437_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5437_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_flip@2x-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5437_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb7/igt@gem_ctx_persistence@idempotent.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@userptr:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_ctx_persistence@userptr.html">SKIP</a> ([fdo#109271]) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl8/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#1610])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb7/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#2803])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk6/igt@gem_mmap_gtt@hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@gem_mmap_gtt@hang.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb8/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([fdo#109271] / [i915#3012])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#155] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl4/igt@kms_ccs@pipe-d-crc-primary-basic.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb5/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb1/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html">SKIP</a> ([fdo#109278]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +75 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_edge_walk@pipe-d-64x64-top-edge.html">SKIP</a> ([fdo#109271] / [i915#533]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">FAIL</a> ([i915#2370])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html">SKIP</a> ([fdo#109271]) +92 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">FAIL</a> ([i915#1036])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb4/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_cpu:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_psr@primary_mmap_cpu.html">SKIP</a> ([fdo#109271] / [i915#1072]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb3/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb8/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb2/igt@prime_nv_test@i915_nv_sharing.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_i915_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7/igt@prime_nv_test@nv_i915_sharing.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-block:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk4/igt@drm_read@short-buffer-block.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk8/igt@drm_read@short-buffer-block.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@vecs0.html">INCOMPLETE</a> ([i915#1185]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2851]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw7/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left-pipe-a-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-glk4/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html">FAIL</a> ([i915#1036]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-glk9/igt@kms_plane@plane-panning-top-left-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-hsw1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-hsw1/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@sema-10@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-kbl7/igt@sysfs_clients@sema-10@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-kbl1/igt@sysfs_clients@sema-10@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@sema-10@vcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-apl1/igt@sysfs_clients@sema-10@vcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-apl3/igt@sysfs_clients@sema-10@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-snb5/igt@i915_pm_rpm@sysfs-read.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-snb7/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9693/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5437/shard-iclb7">FAIL</a>, [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#2295] / [i915#2426] / [i915#2724])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2882637211539670178==--

--===============0653338044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0653338044==--
