Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2364173047410039944=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 05 Jan 2022 08:47:34 -0000
Message-ID: <164137245483.25404.6028636627480416057@emeril.freedesktop.org>
References: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220105064945.9640-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN0?=
 =?utf-8?q?art_offset_and_alignment_detection_=28rev6=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2364173047410039944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add start offset and alignment detection (rev6)
URL   : https://patchwork.freedesktop.org/series/98402/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11047_full -> IGTPW_6537_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/index.html

Participating hosts (13 -> 8)
------------------------------

  Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6537_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_eio@suspend:
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@gem_eio@suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-tglu}:       NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@i915_pm_dc@dc6-psr.html

  * igt@prime_busy@hang-wait@vcs1:
    - {shard-tglu}:       [INCOMPLETE][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-7/igt@prime_busy@hang-wait@vcs1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@prime_busy@hang-wait@vcs1.html

  * igt@prime_busy@hang-wait@vecs0:
    - {shard-tglu}:       NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@prime_busy@hang-wait@vecs0.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11047_full and IGTPW_6537_full:

### New IGT tests (1) ###

  * igt@gem_softpin@safe-start:
    - Statuses : 6 pass(s)
    - Exec time: [0.01, 0.03] s

  

Known issues
------------

  Here are the changes found in IGTPW_6537_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][6] ([i915#3002])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@gem_create@create-massive.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2849])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#2190])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#4613])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#4613]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4613])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#4613]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][22] ([fdo#109271]) +222 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][24] -> [DMESG-WARN][25] ([i915#180]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl6/igt@gem_workarounds@suspend-resume.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][26] ([i915#454])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#454])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][29] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][32] -> [DMESG-WARN][33] ([i915#118])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3777])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-kbl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3777]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3777]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111615] / [i915#3689])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689] / [i915#3886])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [i915#3886])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#1149])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-snb:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][51] ([i915#1319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl4/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][52] ([i915#1319])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][53] ([i915#2105])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3359])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109279] / [i915#3359]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#111825]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274] / [fdo#109278])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][60] -> [FAIL][61] ([i915#2122])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][62] ([i915#180]) +8 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][63] -> [DMESG-WARN][64] ([i915#180]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#4911])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([i915#3701])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-glk:          NOTRUN -> [SKIP][69] ([fdo#109271]) +17 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +8 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109280] / [fdo#111825]) +12 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271]) +19 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#533])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][76] ([i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][77] ([i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][78] ([i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111615] / [fdo#112054])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_psr@psr2_sprite_render.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +129 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2437])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2437])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#2530])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2530]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@sysfs_clients@sema-10:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2994])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb1/igt@sysfs_clients@sema-10.html
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2994]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@sysfs_clients@sema-10.html
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2994])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl8/igt@sysfs_clients@sema-10.html
    - shard-glk:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2994])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@sysfs_clients@sema-10.html

  
#### Possible fixes ####

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][93] ([i915#232]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb8/igt@gem_eio@kms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][95] ([i915#2481] / [i915#3070]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][97] ([i915#4525]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][99] ([i915#2846]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@gem_exec_fair@basic-deadline.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk6/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          [FAIL][101] ([i915#2846]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl1/igt@gem_exec_fair@basic-deadline.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][105] ([i915#2842]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][107] ([i915#2842]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - {shard-tglu}:       [INCOMPLETE][111] ([i915#750]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-7/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][113] ([i915#180]) -> [PASS][114] +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl3/igt@gem_workarounds@suspend-resume-context.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][115] ([fdo#109271]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         [SKIP][117] ([i915#4281]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][119] ([i915#2681] / [i915#2684]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html
    - {shard-tglu}:       [WARN][121] ([i915#2681]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - {shard-tglu}:       [DMESG-WARN][123] ([i915#402]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-1/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][125] ([i915#118]) -> [PASS][126] +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         [FAIL][127] ([i915#2346]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [FAIL][129] ([i915#79]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][131] ([i915#3701]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][133] ([i915#180]) -> [PASS][134] +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][135] ([fdo#109441]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][137] ([i915#180] / [i915#295]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-apl:          [DMESG-WARN][139] ([i915#180] / [i915#295]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@prime_busy@hang-wait@bcs0:
    - {shard-tglu}:       [DMESG-WARN][141] -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shar

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/index.html

--===============2364173047410039944==
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
<tr><td><b>Series:</b></td><td>Add start offset and alignment detection (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/98402/">https://patchwork.freedesktop.org/series/98402/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11047_full -&gt; IGTPW_6537_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/index.html</p>
<h2>Participating hosts (13 -&gt; 8)</h2>
<p>Missing    (5): pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6537_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@gem_eio@suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@i915_pm_dc@dc6-psr.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@vcs1:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-7/igt@prime_busy@hang-wait@vcs1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@prime_busy@hang-wait@vcs1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@vecs0:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-7/igt@prime_busy@hang-wait@vecs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11047_full and IGTPW_6537_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_softpin@safe-start:<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6537_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb5/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +222 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl6/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-snb5/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl4/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl4/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([fdo#109278]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">FAIL</a> ([i915#4911])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> ([fdo#109271]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-snb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html">SKIP</a> ([fdo#109271]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_plane_lowres@pipe-d-tiling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb7/igt@kms_psr@psr2_sprite_render.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb1/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#109441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +129 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb3/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb1/igt@sysfs_clients@sema-10.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@sysfs_clients@sema-10.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl8/igt@sysfs_clients@sema-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk9/igt@sysfs_clients@sema-10.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb8/igt@gem_eio@kms.html">FAIL</a> ([i915#232]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb6/igt@gem_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> ([i915#4525]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk6/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@gem_exec_fair@basic-deadline.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctxn:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-7/igt@gem_ppgtt@blt-vs-render-ctxn.html">INCOMPLETE</a> ([i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@gem_ppgtt@blt-vs-render-ctxn.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl3/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl1/igt@gem_workarounds@suspend-resume-context.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
<li>
<p>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-tglu-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-WARN</a> ([i915#402]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-tglu-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#3701]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6537/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_busy@hang-wait@bcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11047/shar">DMESG-WARN</a> -&gt; [PASS][142]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2364173047410039944==--
