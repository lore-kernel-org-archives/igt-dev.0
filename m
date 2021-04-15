Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 15 Apr 2021 23:23:29 -0000
Message-ID: <161852900939.1079.1450719352381574360@emeril.freedesktop.org>
References: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Let=27s_not_create_full_screen_framebuffe?=
 =?utf-8?q?rs_in_a_loop?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0390518202=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0390518202==
Content-Type: multipart/alternative;
 boundary="===============8283692970976641507=="

--===============8283692970976641507==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cursor_crc: Let's not create full screen framebuffers in a loop
URL   : https://patchwork.freedesktop.org/series/89063/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9967_full -> IGTPW_5743_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5743_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5743_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5743_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@perf@engine_cs:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@i915_selftest@perf@engine_cs.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_selftest@perf@engine_cs.html

  
#### Warnings ####

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         [SKIP][3] ([i915#3319]) -> [SKIP][4] +13 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  
Known issues
------------

  Here are the changes found in IGTPW_5743_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][5] ([i915#180])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_ringsize@create:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][7] ([i915#180] / [i915#62])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_ctx_ringsize@create.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][8] ([i915#2842]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#2849])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][21] ([i915#2389]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#307])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#768])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271]) +53 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][29] ([i915#3002])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@process-exit-mmap@wb:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#1699]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@gem_userptr_blits@process-exit-mmap@wb.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-kbl:          NOTRUN -> [FAIL][31] ([i915#3324])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@gem_userptr_blits@set-cache-level.html
    - shard-apl:          NOTRUN -> [FAIL][32] ([i915#3324])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@gem_userptr_blits@set-cache-level.html

  * igt@gem_workarounds@suspend-resume:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_workarounds@suspend-resume.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#112306]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#112306]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_hangman@engine-error@vecs0:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271]) +208 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html

  * igt@i915_module_load@reload:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][38] ([i915#180] / [i915#203] / [i915#62])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_module_load@reload.html

  * igt@i915_selftest@perf@region:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#203]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@i915_selftest@perf@region.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_selftest@perf@region.html

  * igt@i915_suspend@debugfs-reader:
    - shard-iclb:         [PASS][41] -> [INCOMPLETE][42] ([i915#1185])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb4/igt@i915_suspend@debugfs-reader.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-snb:          [PASS][43] -> [SKIP][44] ([fdo#109271]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-snb7/igt@kms_async_flips@test-time-stamp.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111615]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#2705])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][53] ([i915#1319]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#3116])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3116])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][56] ([i915#1319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109300] / [fdo#111066])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#3319]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#3359])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][61] ([fdo#109271]) +366 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#533]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#533]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#52] / [i915#54])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][68] ([i915#180]) +9 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-kbl:          NOTRUN -> [FAIL][69] ([i915#2641])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#2587])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-glk:          NOTRUN -> [FAIL][71] ([i915#2628])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
    - shard-apl:          NOTRUN -> [FAIL][72] ([i915#2641])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2672])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2642]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109280]) +10 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111825]) +12 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109289])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109289])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_cursor@pipe-a-primary-size-128:
    - shard-kbl:          [PASS][83] -> [DMESG-WARN][84] ([i915#62]) +3 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-128.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html

  * igt@kms_plane_cursor@pipe-a-primary-size-64:
    - shard-glk:          [PASS][85] -> [FAIL][86] ([i915#2657])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk7/igt@kms_plane_cursor@pipe-a-primary-size-64.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_cursor@pipe-a-primary-size-64.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#658]) +7 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109642] / [fdo#111068] / [i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][92] -> [SKIP][93] ([fdo#109441]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-c:
    - shard-kbl:          [PASS][94] -> [DMESG-WARN][95] ([i915#180] / [i915#62]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html

  * igt@kms_vblank@pipe-c-accuracy-idle:
    - shard-glk:          [PASS][96] -> [FAIL][97] ([i915#43])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#2437])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2437])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#2530]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@nouveau_crc@pipe-a-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#2530]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271]) +192 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@prime_nv_pcopy@test3_3.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@prime_nv_pcopy@test3_3.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#2994]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-50:
    - shard-glk:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#2994])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@sysfs_clients@sema-50.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2994]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear:
    - shard-iclb:         [FAIL][108] ([i915#3160]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_create@create-clear.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_create@create-clear.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][110] ([i915#3063]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][112] ([i915#2369] / [i915#3063]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         [TIMEOUT][114] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_eio@unwedge-stress.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [FAIL][118] ([i915#2842]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][120] ([i915#2842]) -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][122] ([i915#118] / [i915#95]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-iclb:         [INCOMPLETE][124] ([i915#1895]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [INCOMPLETE][126] ([i915#155] / [i915#2405]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][130] ([i915#2574]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][132] ([i915#52] / [i915#54]) -> [PASS][133] +6 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-tglb:         [FAIL][134] ([i915#79]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-glk:          [FAIL][136] ([i915#49]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][138] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141] +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@kms_psr@psr2_basic.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr@psr2_basic.html

  
#### Warnings ####

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html

--===============8283692970976641507==
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
<tr><td><b>Series:</b></td><td>tests/kms_cursor_crc: Let&#39;s not create full screen framebuffers in a loop</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89063/">https://patchwork.freedesktop.org/series/89063/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9967_full -&gt; IGTPW_5743_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5743_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5743_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5743_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@perf@engine_cs:<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@i915_selftest@perf@engine_cs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_selftest@perf@engine_cs.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3319]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> +13 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5743_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_ringsize@create:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_ctx_ringsize@create.html">DMESG-WARN</a> ([i915#180] / [i915#62])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> ([fdo#109271]) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@gem_userptr_blits@process-exit-mmap@wb.html">SKIP</a> ([fdo#109271] / [i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@gem_userptr_blits@set-cache-level.html">FAIL</a> ([i915#3324])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_workarounds@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error@vecs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html">SKIP</a> ([fdo#109271]) +208 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#180] / [i915#203] / [i915#62])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@region:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@i915_selftest@perf@region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_selftest@perf@region.html">DMESG-WARN</a> ([i915#203]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#1185])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-snb7/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@kms_async_flips@test-time-stamp.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@kms_chamelium@dp-frame-dump.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_chamelium@dp-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_content_protection@mei_interface.html">SKIP</a> ([fdo#109300] / [fdo#111066])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +366 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2628])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-128:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html">DMESG-WARN</a> ([i915#62]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-primary-size-64:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk7/igt@kms_plane_cursor@pipe-a-primary-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_cursor@pipe-a-primary-size-64.html">FAIL</a> ([i915#2657])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html">DMESG-WARN</a> ([i915#180] / [i915#62]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html">FAIL</a> ([i915#43])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +192 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@prime_nv_pcopy@test3_3.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@prime_nv_pcopy@test3_3.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@sysfs_clients@sema-50.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_create@create-clear.html">FAIL</a> ([i915#3160]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_eio@unwedge-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html">INCOMPLETE</a> ([i915#1895]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> ([i915#155] / [i915#2405]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@kms_psr@psr2_basic.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>

</body>
</html>

--===============8283692970976641507==--

--===============0390518202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0390518202==--
