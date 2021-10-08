Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2198519937886758271=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 08 Oct 2021 09:02:56 -0000
Message-ID: <163368377674.16849.16761267721266428170@emeril.freedesktop.org>
References: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211008065432.15482-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUHJlcGFy?=
 =?utf-8?q?e_IGTs_to_allow_only_zero_alignment?=
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

--===============2198519937886758271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare IGTs to allow only zero alignment
URL   : https://patchwork.freedesktop.org/series/95597/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10697_full -> IGTPW_6300_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/index.html

Known issues
------------

  Here are the changes found in IGTPW_6300_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-glk:          NOTRUN -> [DMESG-WARN][1] ([i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk9/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +4 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-snb6/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-iclb:         [PASS][3] -> [TIMEOUT][4] ([i915#3070])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb2/igt@gem_eio@in-flight-contexts-immediate.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][5] -> [TIMEOUT][6] ([i915#2369] / [i915#3063] / [i915#3648])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][7] ([i915#2842]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842]) +4 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk8/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][15] ([i915#2658])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl1/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][16] ([i915#2658])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#4270])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#768])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][19] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@gem_sync@basic-many-each:
    - shard-kbl:          [PASS][20] -> [INCOMPLETE][21] ([i915#4274])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl7/igt@gem_sync@basic-many-each.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@gem_sync@basic-many-each.html
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#4274])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb4/igt@gem_sync@basic-many-each.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb6/igt@gem_sync@basic-many-each.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][25] ([i915#3002])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-snb6/igt@gem_userptr_blits@input-checking.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109289])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#2856])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#2856])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][29] ([i915#454])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3777])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3777]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111615]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110723])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3886]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689] / [i915#3886])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +6 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk4/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][47] ([i915#1319])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3359])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-kbl:          [PASS][50] -> [FAIL][51] ([i915#3444])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-iclb:         [PASS][52] -> [FAIL][53] ([i915#3444])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#3444])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-tglb:         [PASS][56] -> [FAIL][57] ([i915#2124] / [i915#4024])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][58] ([i915#180]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271]) +352 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#79])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111825]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#533]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][69] -> [DMESG-WARN][70] ([i915#180]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2733])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2733])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2733])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2920])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#658]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-tglb:         NOTRUN -> [FAIL][81] ([i915#132] / [i915#3467])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271]) +50 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_vblank@pipe-b-query-forked-busy-hang:
    - shard-apl:          [PASS][83] -> [SKIP][84] ([fdo#109271])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
    - shard-glk:          [PASS][85] -> [SKIP][86] ([fdo#109271])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][87] -> [DMESG-WARN][88] ([i915#180])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2437]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2437])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +264 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +147 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109291])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109291]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl7/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#2994])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk9/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#2994]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          [FAIL][101] ([i915#2842]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-iclb:         [FAIL][103] ([i915#2842]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb2/igt@gem_exec_fair@basic-pace@bcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [FAIL][105] ([i915#2842]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][107] ([i915#2190]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][109] ([fdo#109271]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl8/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         [SKIP][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [DMESG-WARN][113] ([i915#118]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][115] ([i915#79]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][119] ([fdo#109441]) -> [PASS][120] +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb7/igt@kms_psr@psr2_cursor_render.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][121] ([i915#1542]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb4/igt@perf@polling-parameterized.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][123] ([i915#1804] / [i915#2684]) -> [WARN][124] ([i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][125] ([i915#2684]) -> [WARN][126] ([i915#1804] / [i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         [DMESG-FAIL][127] ([i915#1759] / [i915#2291]) -> [DMESG-FAIL][128] ([i915#1759])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-tglb3/igt@i915_selftest@live@gt_pm.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@i915_selftest@live@gt_pm.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][129] ([i915#658]) -> [SKIP][130] ([i915#2920]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][131] ([i915#2920]) -> [SKIP][132] ([i915#658]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2426] / [i915#3002] / [i915#3363])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl4/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][148], [FAIL][149]) ([i915#3002]) -> ([FAIL][150], [FAIL][151], [FAIL][152]) ([i915#2426] / [i915#3002] / [i915#3690])
   [1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/index.html

--===============2198519937886758271==
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
<tr><td><b>Series:</b></td><td>Prepare IGTs to allow only zero alignment</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/95597/">https://patchwork.freedesktop.org/series/95597/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6300/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10697_full -&gt; IGTPW_6300_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6300_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-glk9/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-snb6/igt@gem_ctx_persistence@process.html">S=
KIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb2/igt@gem_eio@in-flight-contexts-immediate.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300=
/shard-iclb5/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a> ([i=
915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-tglb8/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-tglb3/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i=
915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/s=
hard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#284=
2]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk9/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-=
glk7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +4 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk5/igt@gem_exec_whisper@basic-fds-priority.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/s=
hard-glk8/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> ([i9=
15#118])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl1/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@gem_pxp@verify-pxp-stale-buf-optou=
t-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-=
WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-many-each:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-kbl7/igt@gem_sync@basic-many-each.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/ig=
t@gem_sync@basic-many-each.html">INCOMPLETE</a> ([i915#4274])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-iclb4/igt@gem_sync@basic-many-each.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb6/=
igt@gem_sync@basic-many-each.html">INCOMPLETE</a> ([i915#4274])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-snb6/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@gen7_exec_parse@load-register-reg.=
html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-iclb7/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
([i915#454])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb6/igt@kms_big_fb@linear-64bpp-rotate-270=
.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_big_fb@y-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64b=
pp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar =
issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb3/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_ccs@pipe-a-bad-rotation-90-y_til=
ed_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issu=
es</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb2/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-glk4/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html">=
SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-blue-=
to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_content_protection@srm.html">TI=
MEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-rapid-movement.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
300/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a>=
 ([i915#3444])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6300/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</=
a> ([i915#3444])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
300/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a>=
 ([i915#3444])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6300/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</=
a> ([i915#2124] / [i915#4024])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspen=
d.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x42-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_cursor_crc@pipe-d-cursor-128x4=
2-offscreen.html">SKIP</a> ([fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +352 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@kms_flip@2x-flip-vs-rmfb.html">SKI=
P</a> ([fdo#111825]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-onoff.html">SKIP</a> ([fdo#109280]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-p=
ipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar =
issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-apl3/igt@kms_pipe_crc_basic@nonblocking-crc-p=
ipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6300/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG=
-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-apl1/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_plane_scaling@scaler-with-clippi=
ng-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#10927=
1] / [i915#2733])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb8/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-i=
clb1/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb3/igt@kms_psr@psr2_sprite_blt.html">FAIL=
</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-glk5/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-270.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy-hang:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-apl3/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_63=
00/shard-apl8/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">SKIP</a> (=
[fdo#109271])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-glk4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_63=
00/shard-glk4/igt@kms_vblank@pipe-b-query-forked-busy-hang.html">SKIP</a> (=
[fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6300/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-W=
ARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl8/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl1/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> ([fdo#109271]) +264 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-com=
plete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109271]) +147 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@prime_nv_test@i915_nv_sharing.html=
">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl7/igt@sysfs_clients@fair-7.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-glk9/igt@sysfs_clients@recycle.html">SKIP</a=
> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@sysfs_clients@sema-25.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">D=
MESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6300/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.=
html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6300/shard-glk3/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb2/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6300/shard-iclb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6300/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2=
190]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/=
shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271=
]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/sha=
rd-apl8/igt@i915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10697/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-iclb7/igt@i=
915_pm_dc@dc9-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMES=
G-WARN</a> ([i915#118]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6300/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-glk6/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([f=
do#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6300/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb4/igt@perf@polling-parameterized.html">FAIL</a> ([i=
915#1542]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6300/shard-iclb5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6300/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i9=
15#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-tglb3/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a>=
 ([i915#1759] / [i915#2291]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6300/shard-tglb3/igt@i915_selftest@live@gt_pm.html">DMESG=
-FAIL</a> ([i915#1759])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
2.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6300/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
5.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6300/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-5.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10697/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10697/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10697/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10697/shard-kbl1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
0697/shard-kbl3/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#180=
] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6300/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl4/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6300/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl7/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/sh=
ard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6300/shard-kbl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6300/shard-kbl=
4/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814=
] / [i915#2426] / [i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-iclb:         ([FAIL][148], [FAIL][149]) ([i915#3002]) -&gt; ([FAI=
L][150], [FAIL][151], [FAIL][152]) ([i915#2426] / [i915#3002] / [i915#3690]=
)<br />
   [1</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2198519937886758271==--
