Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2963025500992113975=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 08 Nov 2021 17:15:44 -0000
Message-ID: <163639174405.32038.15584951497897697786@emeril.freedesktop.org>
References: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20211108134746.595247-1-marcin.bernatowicz@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?device=5Freset=3A_remove_artificial_timeout?=
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
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2963025500992113975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/device_reset: remove artificial timeout
URL   : https://patchwork.freedesktop.org/series/96665/
State : success

== Summary ==

CI Bug Log - changes from IGT_6275_full -> IGTPW_6382_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/index.html

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_6382_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1] ([i915#3002]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][3] ([i915#2852])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][4] ([i915#2842])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][5] ([i915#2842])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][6] ([i915#2842]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#2849])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk6/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#4270]) +6 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#4270])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#768])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109289]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109289]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#2856]) +2 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#2856])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109506] / [i915#2411])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#1769])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#3777]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111615]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110723]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2705])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3886]) +11 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271]) +98 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3886]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3886]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278] / [i915#3886]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-snb:          NOTRUN -> [SKIP][33] ([fdo#109271]) +59 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3689] / [i915#3886]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3689]) +9 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk8/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111828])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3359]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109279] / [i915#3359]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#4103])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-iclb:         [PASS][52] -> [FAIL][53] ([i915#2346])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#533])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +11 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3788])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111825]) +43 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([i915#3701])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#2672])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2672])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109280]) +10 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271]) +79 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +282 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][68] ([i915#180]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#1187])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][74] ([i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2920]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +6 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109441])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][80] -> [SKIP][81] ([fdo#109441]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][82] ([i915#132] / [i915#3467]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_setmode@basic:
    - shard-glk:          [PASS][83] -> [FAIL][84] ([i915#31])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk7/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][85] -> [INCOMPLETE][86] ([i915#456])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2437])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2530])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109291]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@prime_nv_pcopy@test3_1.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2994]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +5 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-25:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271] / [i915#2994]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk5/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [DMESG-WARN][96] ([i915#118]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk8/igt@gem_ctx_shared@q-smoketest-all.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk4/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][100] ([fdo#109271]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][102] ([i915#2842]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][104] ([i915#180]) -> [PASS][105] +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-snb:          [SKIP][106] ([fdo#109271]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-snb5/igt@i915_suspend@fence-restore-tiled2untiled.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [FAIL][108] ([i915#2346]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][110] ([i915#180] / [i915#636]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][112] ([i915#79]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][114] ([i915#180]) -> [PASS][115] +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [INCOMPLETE][116] ([i915#3614]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][118] ([fdo#109441]) -> [PASS][119] +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb6/igt@kms_psr@psr2_sprite_render.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr@suspend:
    - shard-tglb:         [INCOMPLETE][120] ([i915#456]) -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb7/igt@kms_psr@suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][122] ([i915#2828] / [i915#456]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-kbl:          [INCOMPLETE][124] ([i915#2295]) -> [SKIP][125] ([fdo#109271])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl2/igt@i915_pm_dc@dc6-psr.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][126] ([i915#2684]) -> [WARN][127] ([i915#1804] / [i915#2684])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][128] ([i915#658]) -> [SKIP][129] ([i915#2920]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][130] ([i915#2920]) -> [SKIP][131] ([i915#658]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3363] / [i915#4312] / [i915#602] / [i915#92]) -> ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312] / [i915#602])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@runner@aborted.html
   [137]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/index.html

--===============2963025500992113975==
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
<tr><td><b>Series:</b></td><td>tests/device_reset: remove artificial timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/96665/">https://patchwork.freedesktop.org/series/96665/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6275_full -&gt; IGTPW_6382_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/index.html</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6382_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2852])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk6/igt@gem_exec_whisper@basic-queues-priority.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@gen3_render_tiledy_blits.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([fdo#109271]) +98 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb4/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271]) +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@kms_chamelium@hdmi-cmp-planar-formats.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl6/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk8/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb2/igt@kms_color_chamelium@pipe-b-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb2/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> ([fdo#109271]) +79 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +282 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb8/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb5/igt@kms_psr@psr2_sprite_plane_onoff.html">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk2/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb1/igt@prime_nv_pcopy@test3_1.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl1/igt@sysfs_clients@sema-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk5/igt@sysfs_clients@split-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk8/igt@gem_ctx_shared@q-smoketest-all.html">DMESG-WARN</a> ([i915#118]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk4/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-snb5/igt@i915_suspend@fence-restore-tiled2untiled.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-snb5/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> ([i915#3614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb6/igt@kms_psr@psr2_sprite_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb7/igt@kms_psr@suspend.html">INCOMPLETE</a> ([i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_psr@suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#2828] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl2/igt@i915_pm_dc@dc6-psr.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-kbl2/igt@i915_pm_dc@dc6-psr.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6382/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6275/shard-kbl1/igt@runner@aborted.html">FAIL</a>, [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3363] / [i915#4312] / [i915#602] / [i915#92]) -&gt; ([FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312] / [i915#602])</li>
</ul>
</li>
</ul>
<p>[137]</p>

</body>
</html>

--===============2963025500992113975==--
