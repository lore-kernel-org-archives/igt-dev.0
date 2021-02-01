Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 01 Feb 2021 18:43:00 -0000
Message-ID: <161220498005.18677.13090656896121044710@emeril.freedesktop.org>
References: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210201123654.1536642-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?prime=5Fvgem=3A_Skip_userptr_test_on_!llc=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1559077804=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1559077804==
Content-Type: multipart/alternative;
 boundary="===============7814462032988219486=="

--===============7814462032988219486==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/prime_vgem: Skip userptr test on !llc.
URL   : https://patchwork.freedesktop.org/series/86532/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5983_full -> IGTPW_5462_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5462_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5462_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5462_full:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@unaligned-read:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk4/igt@fbdev@unaligned-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@fbdev@unaligned-read.html

  * igt@kms_color@pipe-b-legacy-gamma-reset:
    - shard-apl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl2/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html
    - shard-kbl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/igt@kms_color@pipe-b-legacy-gamma-reset.html

  
Known issues
------------

  Here are the changes found in IGTPW_5462_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@replace-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][7] ([fdo#109271]) +67 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw1/igt@gem_ctx_persistence@replace-hostile.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-tglb:         [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2389])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2389])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_render_copy@yf-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#110542])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gem_userptr_blits@coherency-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109290])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109289]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109289]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#112306]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#112306]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110892]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_selftest@live@hangcheck:
    - shard-hsw:          [PASS][32] -> [INCOMPLETE][33] ([i915#2782])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-hsw6/igt@i915_selftest@live@hangcheck.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-iclb:         [PASS][34] -> [FAIL][35] ([i915#2521])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         NOTRUN -> [FAIL][36] ([i915#2597])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb7/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#1769])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111615]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2705])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb2/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2705])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl1/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2705])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb6/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#2705])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk8/igt@kms_big_joiner@basic.html
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#2705])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@dp-audio-edid:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb7/igt@kms_chamelium@dp-audio-edid.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk2/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl3/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-c-ctm-limited-range:
    - shard-hsw:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-limited-range.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109279]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#180]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-random:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271]) +50 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278]) +8 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent:
    - shard-hsw:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533]) +7 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw7/igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271]) +99 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-snb:          [PASS][60] -> [SKIP][61] ([fdo#109271])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-snb5/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [PASS][63] -> [FAIL][64] ([i915#2346])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][66] -> [DMESG-WARN][67] ([i915#180]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          NOTRUN -> [FAIL][68] ([i915#2546]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +80 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111825]) +19 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271]) +61 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109280]) +14 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#533])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][77] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#1836])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#1836])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb8/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2920]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#658]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#658]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109441]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109441]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@sprite_render:
    - shard-hsw:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#1072]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw8/igt@kms_psr@sprite_render.html

  * igt@kms_vrr@flip-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109502])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_vrr@flip-dpms.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109502])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb5/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#2437])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_writeback@writeback-check-output.html
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#2437])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb4/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2437])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2437])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb3/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2437])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2530])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#2530]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278] / [i915#2530])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#112283])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html
    - shard-tglb:         NOTRUN -> [SKIP][101] ([fdo#112283])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_api@i915_nv_double_import:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109291]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb2/igt@prime_nv_api@i915_nv_double_import.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109291]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@prime_udl.html

  * igt@prime_vgem@basic-userptr:
    - shard-apl:          [PASS][104] -> [SKIP][105] ([fdo#109271])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl4/igt@prime_vgem@basic-userptr.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl3/igt@prime_vgem@basic-userptr.html
    - shard-glk:          [PASS][106] -> [SKIP][107] ([fdo#109271])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk4/igt@prime_vgem@basic-userptr.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk2/igt@prime_vgem@basic-userptr.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][108] ([i915#2842]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [FAIL][110] ([i915#2842]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][112] ([i915#2842]) -> [PASS][113] +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][114] ([i915#454]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][116] ([i915#180]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@i915_suspend@debugfs-reader.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][118] ([i915#79]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          [FAIL][120] ([i915#79]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][122] ([fdo#109441]) -> [PASS][123] +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][124] ([i915#658]) -> [SKIP][125] ([i915#2920]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][126] ([i915#2920]) -> [SKIP][127] ([i915#658])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2426]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#2505])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#2295]) -> ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([fdo#109271] / [i915#1814] / [i915#2295])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@runner@aborted.html
    - shard-glk:          ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#2295] / [i915#2426] / [k.org#202321]) -> ([FAIL][151], [FAIL][152], [FAIL][153]) ([i915#2295] / [k.org#202321])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk8/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk7/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk9/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk7/igt@runner@aborted.html
   [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.html

--===============7814462032988219486==
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
<tr><td><b>Series:</b></td><td>tests/prime_vgem: Skip userptr test on !llc.=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/86532/">https://patchwork.freedesktop.org/series/86532/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5462/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5983_full -&gt; IGTPW_5462_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5462_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5462_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5462=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk4/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@fbde=
v@unaligned-read.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-apl2/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-=
apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-=
kbl4/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5462_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@replace-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-hsw1/igt@gem_ctx_persistence@replace-hostile=
.html">SKIP</a> ([fdo#109271]) +67 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7=
/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl6/i=
gt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-tglb7=
/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +1 similar =
issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-g=
lk7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-apl2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/sha=
rd-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#238=
9])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
462/shard-glk1/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG=
-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-=
linear.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gem_userptr_blits@coherency-unsync.=
html">SKIP</a> ([fdo#110542])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gem_userptr_blits@coherency-unsync.=
html">SKIP</a> ([fdo#109290])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gen3_render_mixed_blits.html">SKIP<=
/a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb7/igt@gen3_render_mixed_blits.html">SKIP<=
/a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SK=
IP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-hsw6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-hsw2/i=
gt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_546=
2/shard-iclb2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> =
([i915#2521])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb7/igt@kms_async_flips@test-time-stamp.ht=
ml">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb3/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb6/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb2/igt@kms_big_joiner@basic.html">SKIP</a>=
 ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-kbl1/igt@kms_big_joiner@basic.html">SKIP</a> =
([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb6/igt@kms_big_joiner@basic.html">SKIP</a>=
 ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-glk8/igt@kms_big_joiner@basic.html">SKIP</a> =
([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_big_joiner@basic.html">SKIP</a> =
([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-audio-edid:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb7/igt@kms_chamelium@dp-audio-edid.html">=
SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-glk2/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl3/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb4/igt@kms_chamelium@vga-hpd-with-enabled=
-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-hsw8/igt@kms_color_chamelium@pipe-c-ctm-limit=
ed-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-snb6/igt@kms_color_chamelium@pipe-c-ctm-limit=
ed-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-sliding.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shar=
d-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915=
#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-random.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-256x2=
56-rapid-movement.html">SKIP</a> ([fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-alpha-transparent:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-hsw7/igt@kms_cursor_crc@pipe-d-cursor-alpha-=
transparent.html">SKIP</a> ([fdo#109271] / [i915#533]) +7 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +99 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-snb5/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/s=
hard-snb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">SKIP</a> ([fdo#=
109271])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb=
-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5462/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">F=
AIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
462/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG=
-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-snb5/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-shrfb-pgflip-blt.html">FAIL</a> ([i915#2546]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +80 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +61 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +14 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-glk2/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_prime@basic-crc@first-to-second=
.html">SKIP</a> ([i915#1836])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb8/igt@kms_prime@basic-crc@first-to-second=
.html">SKIP</a> ([i915#1836])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-glk6/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-iclb=
5/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_render:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-hsw8/igt@kms_psr@sprite_render.html">SKIP</a=
> ([fdo#109271] / [i915#1072]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb1/igt@kms_vrr@flip-dpms.html">SKIP</a> ([=
fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb5/igt@kms_vrr@flip-dpms.html">SKIP</a> ([=
fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-apl7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb4/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-kbl4/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb3/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-glk4/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb7/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb1/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb3/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-iclb3/igt@perf_pmu@event-wait@rcs0.html">SKIP=
</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5462/shard-tglb1/igt@perf_pmu@event-wait@rcs0.html">SKIP=
</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-tglb2/igt@prime_nv_api@i915_nv_double_import=
.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5462/shard-iclb2/igt@prime_udl.html">SKIP</a> ([fdo#109=
291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-apl4/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl3/igt@pr=
ime_vgem@basic-userptr.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_5983/shard-glk4/igt@prime_vgem@basic-userptr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk2/igt@pr=
ime_vgem@basic-userptr.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i91=
5#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_54=
62/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
462/shard-iclb8/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
462/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-ic=
lb5/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-apl8/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (=
[i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5462/shard-apl7/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
c-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk4/igt@kms_flip@2x-flip-vs-e=
xpired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-apl3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp=
1.html">FAIL</a> ([i915#79]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5462/shard-apl8/igt@kms_flip@flip-vs-expired-vblank-inter=
ruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb3/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([f=
do#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5462/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 simi=
lar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.ht=
ml">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5462/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-1.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.ht=
ml">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5462/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dm=
g-area-2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_5983/shard-kbl4/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426])=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5462/shard-kbl2/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5462/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-kbl7/igt@run=
ner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2505])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-apl8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/s=
hard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_5983/shard-apl2/igt@runner@aborted.html">FAIL</a>=
) ([i915#2295]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5462/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
462/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-apl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/sha=
rd-apl7/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i915#1814] / [i=
915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_5983/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/shard-glk7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5983/s=
hard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_5983/shard-glk9/igt@runner@aborted.html">FAIL</a>=
) ([i915#2295] / [i915#2426] / [k.org#202321]) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462/shard-glk8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5462=
/shard-glk7/igt@runner@aborted.html">FAIL</a>, [FAIL][153]) ([i915#2295] / =
[k.org#202321])</p>
</li>
</ul>
</li>
</ul>
<p>[</p>

</body>
</html>

--===============7814462032988219486==--

--===============1559077804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1559077804==--
