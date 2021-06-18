Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 18 Jun 2021 15:02:32 -0000
Message-ID: <162402855247.1291.13374818126043646601@emeril.freedesktop.org>
References: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNTog?=
 =?utf-8?q?Handle_the_case_where_legacy_mmap_is_not_available_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0375737378=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0375737378==
Content-Type: multipart/alternative;
 boundary="===============7159139026466725203=="

--===============7159139026466725203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: Handle the case where legacy mmap is not available (rev3)
URL   : https://patchwork.freedesktop.org/series/90001/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6113_full -> IGTPW_5940_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5940_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5940_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5940_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk1/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk7/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1.html

  
New tests
---------

  New tests have been introduced between IGT_6113_full and IGTPW_5940_full:

### New IGT tests (2) ###

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pipe-a:
    - Statuses : 1 pass(s)
    - Exec time: [4.68] s

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [4.65] s

  

Known issues
------------

  Here are the changes found in IGTPW_5940_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][5] ([i915#3002])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][6] ([i915#3002])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl1/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][16] -> [DMESG-WARN][17] ([i915#118] / [i915#95]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][18] ([i915#2658])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#768]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#3323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#3323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#3323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#3297]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109289])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#112306])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111644] / [i915#1397] / [i915#2411])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl3/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110725] / [fdo#111614])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#2705])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#2705])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb1/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +29 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk1/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][41] ([i915#1319])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][42] ([i915#2105])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278]) +13 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3359]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109279] / [i915#3359]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [fdo#109279])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3319]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271]) +392 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109274] / [fdo#109278])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#79])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111825]) +15 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109274]) +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#180]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#2672])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#2642])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +45 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271]) +86 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#110577])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb5/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109310])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_invalid_dotclock.html

  * igt@kms_lease@simple_lease:
    - shard-snb:          [PASS][63] -> [SKIP][64] ([fdo#109271])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-snb2/igt@kms_lease@simple_lease.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb7/igt@kms_lease@simple_lease.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][65] ([fdo#108145] / [i915#265]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][67] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][68] ([i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#3536])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111615]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2920]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109441])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@kms_psr@psr2_suspend.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][77] ([IGT#2])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2437]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#2530]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#2530])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271]) +285 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [i915#2530])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@nv_self_import:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109291])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@prime_nv_api@nv_self_import.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109292])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl6/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear:
    - shard-glk:          [FAIL][87] ([i915#1888] / [i915#3160]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk7/igt@gem_create@create-clear.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk5/igt@gem_create@create-clear.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][91] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][93] ([i915#2842]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][95] ([i915#2842]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         [FAIL][97] ([i915#2842]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [FAIL][99] ([i915#307]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk6/igt@gem_mmap_gtt@big-copy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk4/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][101] ([i915#307]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@i915_selftest@perf@request:
    - shard-iclb:         [DMESG-WARN][103] -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@i915_selftest@perf@request.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-iclb:         [DMESG-WARN][105] ([i915#3621]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-random-ccs-data:
    - shard-iclb:         [DMESG-WARN][107] ([i915#3219]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_ccs@pipe-a-random-ccs-data.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@kms_ccs@pipe-a-random-ccs-data.html

  * igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:
    - shard-tglb:         [INCOMPLETE][109] -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb6/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb3/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-iclb:         [SKIP][111] ([i915#668]) -> [PASS][112] +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][113] ([i915#433]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-glk:          [FAIL][115] ([i915#2472]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][117] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][119] ([i915#155] / [i915#2828]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][121] ([i915#2851]) -> [FAIL][122] ([i915#2842])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][123] ([i915#2684]) -> [WARN][124] ([i915#1804] / [i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][125] ([i915#658]) -> [SKIP][126] ([i915#2920]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([i915#658]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][129], [FAIL][130]) ([i915#2505] / [i915#3002] / [i915#3363]) -> [FAIL][131] ([i915#3002] / [i915#3363])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][132], [FAIL][133], [FAIL][134]) ([i915#1814] / [i915#3002]) -> ([FAIL][135], [FAIL][136]) ([i915#3002])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb8/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([i915#1610] / [i915#180] / [i915#1814] / [i915#2292] / [i915#3002] / [i915#3363]) -> ([FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.o

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/index.html

--===============7159139026466725203==
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
<tr><td><b>Series:</b></td><td>i915: Handle the case where legacy mmap is n=
ot available (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90001/">https://patchwork.freedesktop.org/series/90001/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5940/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6113_full -&gt; IGTPW_5940_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5940_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5940_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5940=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rc=
s0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk1/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdmi-=
a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5940/shard-glk7/igt@kms_flip@dpms-vs-vblank-race-interruptible@c-hdm=
i-a1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6113_full and IGTPW_5940_full=
:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pip=
e-a:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@vga-1-pip=
e-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.65] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5940_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@feature_discovery@display-4x.html"=
>SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_create@create-massive.html">DMES=
G-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-apl1/igt@gem_create@create-massive.html">DMES=
G-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-snb7/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6113/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard=
-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])=
</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6113/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard=
-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])=
 +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb6/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl6/=
igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_594=
0/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WAR=
N</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-kbl7/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-iclb8/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-glk4/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.h=
tml">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@gen7_exec_parse@basic-offset.html"=
>SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl3/igt@=
i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-tglb1/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_chamelium@dp-crc-multiple.html=
">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@kms_chamelium@hdmi-audio.html">SKI=
P</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-glk1/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm=
-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issu=
es</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_color_chamelium@pipe-invalid-ctm=
-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_content_protection@uevent.html"=
>FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-max-s=
ize-sliding.html">SKIP</a> ([fdo#109278]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-onscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +392 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278=
])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi=
-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5940/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-h=
dmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html">SKI=
P</a> ([fdo#111825]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_flip@2x-flip-vs-wf_vblank-inte=
rruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7=
/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 si=
milar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +12 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-kbl2/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +45 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +86 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-tglb5/igt@kms_invalid_dotclock.html">SKIP</a>=
 ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_invalid_dotclock.html">SKIP</a>=
 ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-snb2/igt@kms_lease@simple_lease.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-snb7/igt@kms=
_lease@simple_lease.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_plane_lowres@pipe-a-tiling-y.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb3/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-glk5/igt@kms_psr2_su@page_flip.html">SKIP</a=
> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb7/igt@kms_psr@psr2_sprite_plane_onoff.ht=
ml">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@kms=
_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl7/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detect=
ion.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([fdo#109271]) +285 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@nouveau_crc@pipe-d-ctx-flip-detect=
ion.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb1/igt@prime_nv_api@nv_self_import.html">=
SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb8/igt@prime_vgem@coherency-gtt.html">SKI=
P</a> ([fdo#109292])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-apl6/igt@sysfs_clients@fair-7.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk7/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888=
] / [i915#3160]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5940/shard-glk5/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG=
-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5940/shard-apl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html=
">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2=
369] / [i915#2481] / [i915#3070]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5940/shard-iclb3/igt@gem_eio@unwedge-stress.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
940/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk1/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i91=
5#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
40/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
940/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk6/igt@gem_mmap_gtt@big-copy.html">FAIL</a> ([i915#307]) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-=
glk4/igt@gem_mmap_gtt@big-copy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> (=
[i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5940/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb1/igt@i915_selftest@perf@request.html">DMESG-WARN</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-i=
clb4/igt@i915_selftest@perf@request.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-WA=
RN</a> ([i915#3621]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5940/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb1/igt@kms_ccs@pipe-a-random-ccs-data.html">DMESG-WARN</=
a> ([i915#3219]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5940/shard-iclb4/igt@kms_ccs@pipe-a-random-ccs-data.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-tglb6/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5940/shard-tglb3/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-=
gtt.html">SKIP</a> ([i915#668]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_frontbuffer_tracking@psr-rgb1=
01010-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i91=
5#433]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_594=
0/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.h=
tml">FAIL</a> ([i915#2472]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5940/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pip=
e-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642=
] / [fdo#111068] / [i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">IN=
COMPLETE</a> ([i915#155] / [i915#2828]) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl1/igt@kms_vblank@pipe-b-ts-conti=
nuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i9=
15#2851]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
940/shard-tglb3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#284=
2])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([=
i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5940/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915=
#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.ht=
ml">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5940/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg=
-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.ht=
ml">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5940/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dm=
g-area-2.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>) ([i915#2505] / [i915#3002] / [i915#3363]) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-kbl7/igt@runner@abor=
ted.html">FAIL</a> ([i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113=
/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#3002])=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shar=
d-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5940/shard-iclb5/igt@runner@aborted.html">FAIL</a=
>) ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6113/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl3/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/s=
hard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl1/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6113/shard-apl8/igt@runner@aborted.html">FAIL</a>) ([i915#16=
10] / [i915#180] / [i915#1814] / [i915#2292] / [i915#3002] / [i915#3363]) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-=
apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5940/shard-apl7/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5940/shard-apl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o">FAIL=
</a>, [FAIL][147]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] /=
 [i915#3363])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7159139026466725203==--

--===============0375737378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0375737378==--
