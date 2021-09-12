Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7729361507494564538=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 12 Sep 2021 17:33:04 -0000
Message-ID: <163146798408.26520.1084590765662154549@emeril.freedesktop.org>
References: <20210912160106.539575-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210912160106.539575-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Move_Intel_specific_kms_tests_to_i915_directory_=28rev3?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============7729361507494564538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms: Move Intel specific kms tests to i915 directory (rev3)
URL   : https://patchwork.freedesktop.org/series/93224/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10572_full -> IGTPW_6212_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6212_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6212_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6212_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_exec_suspend@basic-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_exec_suspend@basic-s3.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_6212_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@gem_create@create-massive.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#109314])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][15] ([i915#2842]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_offset@clear:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#3160])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@gem_mmap_offset@clear.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb7/igt@gem_mmap_offset@clear.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#768])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271]) +179 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#3323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][25] ([i915#3002]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [FAIL][26] ([i915#3318])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109289])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#2856]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@gen9_exec_parse@bb-large.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][29] -> [FAIL][30] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_query@query-topology-unsupported:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109302])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@i915_query@query-topology-unsupported.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][32] ([i915#118] / [i915#95]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111614])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3777]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3777])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +8 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +10 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689] / [i915#3886])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3689]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271]) +224 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#3742])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb1/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl2/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][50] ([i915#1319]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][51] ([i915#1319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][52] ([i915#2105])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3319]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279] / [i915#3359]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3359]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +188 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111825]) +19 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#3451])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][60] -> [INCOMPLETE][61] ([i915#180])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3701])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#3701])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-snb:          NOTRUN -> [SKIP][70] ([fdo#109271]) +352 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#1888] / [i915#2546])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][73] -> [DMESG-WARN][74] ([i915#180]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#533])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#533]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][79] ([i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][80] ([i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#112054])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3536])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2733])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2920])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109441])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][91] ([i915#132] / [i915#3467]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][92] -> [SKIP][93] ([fdo#109441]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#111615]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][95] ([i915#180] / [i915#295])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][96] ([i915#155] / [i915#2828])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2530])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2530])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109291])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@prime_nv_api@i915_self_import.html

  * igt@sysfs_clients@recycle:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2994]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@sysfs_clients@sema-50.html
    - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@drm_import_export@flink:
    - shard-glk:          [INCOMPLETE][103] ([i915#2369]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk9/igt@drm_import_export@flink.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@drm_import_export@flink.html

  * igt@drm_import_export@prime:
    - shard-glk:          [INCOMPLETE][105] ([i915#2055] / [i915#2944]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk1/igt@drm_import_export@prime.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk3/igt@drm_import_export@prime.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [TIMEOUT][107] ([i915#3063]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][109] ([i915#2369] / [i915#3063] / [i915#3648]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][111] ([i915#2842]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][115] ([i915#2842] / [i915#3468]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][117] ([i915#2842]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-glk:          [INCOMPLETE][119] ([i915#2944]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk5/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][121] ([i915#2190]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [INCOMPLETE][123] ([i915#155]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_workarounds@suspend-resume.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl1/igt@gem_workarounds@suspend-resume.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][125] ([i915#180]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][127] ([i915#118] / [i915#95]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [INCOMPLETE][129] ([i915#2411] / [i915#456]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][131] ([i915#180]) -> [PASS][132] +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][133] ([fdo#109441]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-glk:          [FAIL][135] ([i915#65]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk6/igt@kms_rotation_crc@cursor-rotation-180.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@kms_rotation_crc@cursor-rotation-180.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][137] ([i915#1804] / [i915#2684]) -> [WARN][138] ([i915#2684])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/s

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/index.html

--===============7729361507494564538==
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
<tr><td><b>Series:</b></td><td>tests/kms: Move Intel specific kms tests to i915 directory (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/93224/">https://patchwork.freedesktop.org/series/93224/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10572_full -&gt; IGTPW_6212_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6212_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6212_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6212_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6212_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb2/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@gem_mmap_offset@clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb7/igt@gem_mmap_offset@clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([fdo#109271]) +179 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb8/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +224 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb1/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl7/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl2/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb7/igt@kms_color_chamelium@pipe-b-ctm-0-25.html">SKIP</a> ([fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +188 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-ytiled.html">FAIL</a> ([i915#3451])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#109280])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> ([fdo#109271]) +352 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">FAIL</a> ([i915#1888] / [i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl1/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb6/igt@kms_plane_lowres@pipe-c-tiling-none.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#2828])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb1/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@nouveau_crc@pipe-d-source-outp-complete.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb8/igt@prime_nv_api@i915_self_import.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl3/igt@sysfs_clients@recycle.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl6/igt@sysfs_clients@sema-50.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@sysfs_clients@sema-50.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_import_export@flink:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk9/igt@drm_import_export@flink.html">INCOMPLETE</a> ([i915#2369]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@drm_import_export@flink.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@drm_import_export@prime:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk1/igt@drm_import_export@prime.html">INCOMPLETE</a> ([i915#2055] / [i915#2944]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk3/igt@drm_import_export@prime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb8/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk5/igt@gem_exec_flush@basic-wb-ro-before-default.html">INCOMPLETE</a> ([i915#2944]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk8/igt@gem_exec_flush@basic-wb-ro-before-default.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl4/igt@gem_workarounds@suspend-resume.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl1/igt@gem_workarounds@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk6/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-tglb2/igt@kms_frontbuffer_tracking@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/shard-glk6/igt@kms_rotation_crc@cursor-rotation-180.html">FAIL</a> ([i915#65]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6212/shard-glk2/igt@kms_rotation_crc@cursor-rotation-180.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_pm_rc6_residency@rc6-idle:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10572/s">WARN</a> ([i915#1804] / [i915#2684]) -&gt; [WARN][138] ([i915#2684])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7729361507494564538==--
