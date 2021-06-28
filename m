Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 28 Jun 2021 19:20:24 -0000
Message-ID: <162490802431.2572.13410718178502399300@emeril.freedesktop.org>
References: <20210628131435.1070725-1-Anson.Jacob@amd.com>
In-Reply-To: <20210628131435.1070725-1-Anson.Jacob@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Fmultiple=3A_Start_continuous_CRC_capture_after_co?=
 =?utf-8?q?mmit_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1447074632=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Victor Lu <victorchengchi.lu@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1447074632==
Content-Type: multipart/alternative;
 boundary="===============7139090606147003638=="

--===============7139090606147003638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_multiple: Start continuous CRC capture after commit (rev2)
URL   : https://patchwork.freedesktop.org/series/81857/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6121_full -> IGTPW_5963_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5963_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5963_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5963_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_reloc@basic-parallel:
    - shard-tglb:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@gem_exec_reloc@basic-parallel.html

  
Known issues
------------

  Here are the changes found in IGTPW_5963_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#1888] / [i915#3160])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk9/igt@gem_create@create-clear.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk9/igt@gem_create@create-clear.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-snb2/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][6] -> [TIMEOUT][7] ([i915#2369] / [i915#3063])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][8] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#2842]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842] / [i915#3468])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#112283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][16] ([i915#3633]) +3 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][17] ([i915#3633]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][18] ([i915#3633]) +4 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#2190])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@big-copy-xy:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#307])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk4/igt@gem_mmap_gtt@big-copy-xy.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk1/igt@gem_mmap_gtt@big-copy-xy.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#3323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][27] ([i915#3002])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@gem_userptr_blits@input-checking.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#112306]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#112306])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#3288])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][31] ([i915#3343])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110892])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271]) +46 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([i915#1769])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#1769])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#110723])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk1/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl7/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109278] / [i915#1149])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb4/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][46] ([i915#1319])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3359]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][49] ([i915#180])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][50] ([i915#180])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +156 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109274] / [fdo#109278])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#533])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#533]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([i915#155] / [i915#180] / [i915#636])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#79]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][62] -> [DMESG-WARN][63] ([i915#2867]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#2587])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111825]) +15 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +15 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109289])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][68] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][69] ([fdo#108145] / [i915#265]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][70] ([i915#265])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][77] ([IGT#2])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][78] ([IGT#2])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271]) +362 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-snb6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][80] -> [DMESG-WARN][81] ([i915#180]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271]) +187 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278]) +11 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb4/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2530]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2530]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109289])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109291]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109291])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@prime_nv_pcopy@test3_1.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2994]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl6/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2994])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2994]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk7/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2994])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2994]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][94] ([i915#180]) -> [PASS][95] +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][96] ([i915#2842]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][100] ([i915#307]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [TIMEOUT][102] ([i915#2795]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb3/igt@gem_vm_create@destroy-race.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [INCOMPLETE][104] -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [INCOMPLETE][106] ([i915#1982] / [i915#3698]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb8/igt@i915_pm_dc@dc6-psr.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb1/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-glk:          [DMESG-WARN][108] ([i915#118] / [i915#95]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-glk7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][112] ([fdo#109441]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@prime_vgem@sync@bcs0:
    - shard-tglb:         [INCOMPLETE][114] ([i915#409]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-tglb1/igt@prime_vgem@sync@bcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@prime_vgem@sync@bcs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][116] ([i915#2684]) -> [WARN][117] ([i915#1804] / [i915#2684]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][118] ([i915#2920]) -> [SKIP][119] ([i915#658]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][120] ([i915#658]) -> [SKIP][121] ([i915#2920]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#92])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl3/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1814] / [i915#3002]) -> ([FAIL][151], [FAIL][152]) ([i915#3002])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb7/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb8/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb8/igt@runner@aborted.html
    - shard-apl:          ([FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161]) ([i915#1610] / [i915#1814] / [i915#2292] / [i915#3002] / [i915#3363])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-apl8/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/index.html

--===============7139090606147003638==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_multiple: Start continuous C=
RC capture after commit (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/81857/">https://patchwork.freedesktop.org/series/81857/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5963/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6121_full -&gt; IGTPW_5963_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5963_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5963_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5963=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_reloc@basic-parallel:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb=
5/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5963_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk9/igt@gem_create@create-clear.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk9/igt@ge=
m_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-snb2/igt@gem_ctx_persistence@idempotent.html=
">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@g=
em_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk3/=
igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk3=
/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842] / [i915#346=
8])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tgl=
b2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl1/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-snb2/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html">FAIL</a> ([i915#3633]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-kbl6/igt@gem_exec_reloc@basic-wide-active@rcs=
0.html">FAIL</a> ([i915#3633]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/=
shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a=
> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6121/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-tglb6/igt@gem=
_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk4/igt@gem_mmap_gtt@big-copy-xy.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-glk1/igt@g=
em_mmap_gtt@big-copy-xy.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@gen9_exec_parse@bb-chained.html">S=
KIP</a> ([fdo#112306]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.=
html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> =
([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> =
([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> ([fdo#109271]) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-iclb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-tglb6/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-glk1/igt@kms_chamelium@dp-hpd-storm-disable.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl7/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl4/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb4/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_color_chamelium@pipe-invalid-d=
egamma-lut-sizes.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl3/igt@kms_content_protection@lic.html">TI=
MEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-max-s=
ize-onscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend=
.html">DMESG-WARN</a> ([i915#180])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend=
.html">DMESG-WARN</a> ([i915#180])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-onscreen.html">SKIP</a> ([fdo#109271]) +156 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-kbl2/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-apl3/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@=
kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [=
i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_flip@2x-plain-flip-fb-recreate=
-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hd=
mi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5963/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-hdmi-a2.html">FAIL</a> ([i915#79]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6=
/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +6 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb3/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-ic=
lb1/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> ([i915#2867]) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +15 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +15 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-glk3/igt@kms_psr2_su@page_flip.html">SKIP</a=
> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb=
6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 simila=
r issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-apl6/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-snb6/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> ([fdo#109271]) +362 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963=
/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN<=
/a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-i=
dle.html">SKIP</a> ([fdo#109271]) +187 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb4/igt@kms_vblank@pipe-d-ts-continuation-=
idle-hang.html">SKIP</a> ([fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@nouveau_crc@pipe-c-source-outp-ina=
ctive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb5/igt@perf@gen8-unprivileged-single-ctx-=
counters.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_clo=
se.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-tglb7/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-apl6/igt@sysfs_clients@recycle-many.html">SKI=
P</a> ([fdo#109271] / [i915#2994]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-iclb3/igt@sysfs_clients@recycle-many.html">SK=
IP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-glk7/igt@sysfs_clients@recycle-many.html">SKI=
P</a> ([fdo#109271] / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5963/shard-tglb2/igt@sysfs_clients@recycle-many.html">SK=
IP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@sysfs_clients@sema-50.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG=
-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5963/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html=
">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
963/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5963/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([=
i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5963/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb3/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i9=
15#2795]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
963/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb5/ig=
t@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">INCOMPLETE</a> ([i915#19=
82] / [i915#3698]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5963/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-glk7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMES=
G-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5963/shard-glk8/igt@kms_cursor_legacy@cursor-vs-fl=
ip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
b-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-apl8/igt@kms_plane@plane-panning=
-bottom-right-suspend@pipe-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb5/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shar=
d-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-tglb1/igt@prime_vgem@sync@bcs0.html">INCOMPLETE</a> ([i915#=
409]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/=
shard-tglb1/igt@prime_vgem@sync@bcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([=
i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5963/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915=
#1804] / [i915#2684]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</=
a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5963/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP<=
/a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.ht=
ml">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5963/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg=
-area-4.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/s=
hard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6121/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6121/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6121/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6121/shard-kbl1/igt@runner@aborted.html">FAIL</a=
>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i=
915#3002] / [i915#3363] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5963/shard-kbl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kb=
l4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5963/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5963/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl6/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5963/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/sh=
ard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-kbl=
7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5963/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i9=
15#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#300=
2] / [i915#3363] / [i915#92])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-iclb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb5/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6121=
/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_6121/shard-iclb8/igt@runner@aborted.html">FAIL=
</a>) ([i915#1814] / [i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5963/shard-iclb6/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5963/shard-iclb8=
/igt@runner@aborted.html">FAIL</a>) ([i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6121/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip">FAIL</a>, [FAIL][155], [FAIL][156]) ([i91=
5#180] / [i915#1814] / [i915#3002] / [i915#3363]) -&gt; ([FAIL][157], [FAIL=
][158], [FAIL][159], [FAIL][160], [FAIL][161]) ([i915#1610] / [i915#1814] /=
 [i915#2292] / [i915#3002] / [i915#3363])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7139090606147003638==--

--===============1447074632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1447074632==--
