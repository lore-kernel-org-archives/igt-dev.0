Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 09 Apr 2021 15:16:39 -0000
Message-ID: <161798139970.10581.8104532328346348746@emeril.freedesktop.org>
References: <20210304155018.12745-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210304155018.12745-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Add_CRC_test_to_make_sure_the_correct_fb?=
 =?utf-8?q?_is_being_scanned_out_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1491429893=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1491429893==
Content-Type: multipart/alternative;
 boundary="===============3452311935929114999=="

--===============3452311935929114999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Add CRC test to make sure the correct fb is being scanned out (rev2)
URL   : https://patchwork.freedesktop.org/series/87632/
State : success

== Summary ==

CI Bug Log - changes from IGT_6063_full -> IGTPW_5723_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5723_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_async_flips@crc} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk6/igt@kms_async_flips@crc.html

  
New tests
---------

  New tests have been introduced between IGT_6063_full and IGTPW_5723_full:

### New IGT tests (1) ###

  * igt@kms_async_flips@crc:
    - Statuses : 1 fail(s) 3 pass(s)
    - Exec time: [2.08, 2.13] s

  

Known issues
------------

  Here are the changes found in IGTPW_5723_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-clear:
    - shard-glk:          [PASS][2] -> [FAIL][3] ([i915#1888] / [i915#3160])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk7/igt@gem_create@create-clear.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk3/igt@gem_create@create-clear.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb5/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][5] ([i915#3002])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][7] ([i915#3354])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][8] ([i915#2846])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk7/igt@gem_exec_nop@basic-parallel.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk2/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][15] ([i915#2389]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#307])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#307]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb6/igt@gem_userptr_blits@readonly-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109289])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb6/igt@gen7_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109289])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb3/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-snb:          NOTRUN -> [SKIP][24] ([fdo#109271]) +331 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][25] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][26] ([i915#2681])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][27] ([i915#1804] / [i915#2684])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          NOTRUN -> [DMESG-WARN][28] ([i915#180])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl1/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-glk:          NOTRUN -> [SKIP][30] ([fdo#109271]) +15 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111614]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111615])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-25:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][36] ([i915#1319])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][37] ([i915#1319])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][38] ([i915#2105])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#109279] / [i915#3359])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [fdo#109279])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271]) +87 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#533])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#52] / [i915#54]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-glk:          [PASS][46] -> [FAIL][47] ([i915#2122])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#2672])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#2642])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][50] -> [FAIL][51] ([i915#49]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [PASS][52] -> [FAIL][53] ([i915#2546] / [i915#49])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109280])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111825])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#533])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180] / [i915#533])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][59] ([fdo#108145] / [i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html
    - shard-kbl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#658]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#658]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk3/igt@kms_psr2_su@page_flip.html
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109642] / [fdo#111068] / [i915#658])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109441])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb4/igt@kms_psr@psr2_primary_render.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][69] ([IGT#2])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][70] -> [INCOMPLETE][71] ([i915#155])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][72] -> [DMESG-WARN][73] ([i915#180]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#2437])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2437])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@kms_writeback@writeback-check-output.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +214 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl2/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109291])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@prime_udl.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109291])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb1/igt@prime_udl.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109295])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb7/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109295])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb5/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-apl:          NOTRUN -> ([FAIL][81], [FAIL][82]) ([i915#180] / [i915#3002])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl8/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl1/igt@runner@aborted.html

  * igt@sysfs_clients@recycle-many:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2994])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-10:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2994])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl1/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][85] ([i915#2846]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          [FAIL][87] ([i915#2842]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [FAIL][89] ([i915#2842]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][91] ([i915#2842]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [DMESG-WARN][93] ([i915#118] / [i915#95]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [FAIL][95] ([i915#307]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][97] ([i915#2428]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:
    - shard-glk:          [FAIL][101] ([i915#52] / [i915#54]) -> [PASS][102] +4 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-snb:          [DMESG-WARN][103] -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][105] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][109] ([i915#1804] / [i915#2684]) -> [WARN][110] ([i915#2681] / [i915#2684])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][111] ([i915#658]) -> [SKIP][112] ([i915#2920])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][113] ([i915#2920]) -> [SKIP][114] ([i915#658]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#3002]) -> ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#602])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2292]: https://gitlab.freedesktop.org/drm/intel/issues/2292
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2428]: https://gitlab.freedesktop.org/drm/intel/issues/2428
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#307]: https://gitlab.freedesktop.org/drm/intel/issues/307
  [i915#3160]: https://gitlab.freedesktop.org/drm/intel/issues/3160
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3354]: https://gitlab.freedesktop.org/drm/intel/issues/3354
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#602]: https://gitlab.freedesktop.org/drm/intel/issues/602
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6063 -> IGTPW_5723

  CI-20190529: 20190529
  CI_DRM_9949: caf1e8d36f0bdd43bfd47e5a6f46d4b691d284e3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5723: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/index.html
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/index.html

--===============3452311935929114999==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Add CRC test to make =
sure the correct fb is being scanned out (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/87632/">https://patchwork.freedesktop.org/series/87632/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5723/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6063_full -&gt; IGTPW_5723_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5723=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@kms_async_flips@crc} (NEW):<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-glk6/igt@kms_async_flips@crc.html">FAIL</a><=
/li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6063_full and IGTPW_5723_full=
:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_async_flips@crc:<ul>
<li>Statuses : 1 fail(s) 3 pass(s)</li>
<li>Exec time: [2.08, 2.13] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5723_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk7/igt@gem_create@create-clear.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk3/igt@ge=
m_create@create-clear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3160">i915#3160</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-snb5/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-apl8/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-snb6/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-snb5/igt@gem_eio@unwedge-stress.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3354">i915#3=
354</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">=
i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7=
/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-g=
lk7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-parallel:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk7/igt@gem_exec_nop@basic-parallel.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-glk2/ig=
t@gem_exec_nop@basic-parallel.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-ic=
lb5/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/307">i915#307</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard=
-glk4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/307">i915#307</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb6/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb8/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb6/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb3/igt@gen7_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10928=
9">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-snb2/igt@gen9_exec_parse@batch-invalid-lengt=
h.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +331 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb2/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/268=
1">i915#2681</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
4">i915#1804</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2684">i915#2684</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl1/igt@i915_suspend@forcewake.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_big_fb@x-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-glk7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +15 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +19 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-kbl2/igt@kms_color_chamelium@pipe-c-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl7/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-iclb3/igt@kms_cursor_crc@pipe-d-cursor-256x8=
5-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-suspen=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +87 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5723/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52">i915#=
52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i91=
5#54</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk7/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5723/shard-glk5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i91=
5#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2642">i915#2642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6063/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-=
onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5723/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/49">i915#49</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6063/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-=
onoff.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5723/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-=
indfb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2546">i915#2546</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl8/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5723/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspe=
nd-pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-7=
efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-glk3/igt@kms_psr2_su@page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-kbl3/igt@kms_psr2_su@page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#10=
9642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068=
">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-iclb4/igt@kms_psr@psr2_primary_render.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
>fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-icl=
b5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723=
/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#1=
55</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723=
/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-apl2/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-kbl7/igt@kms_writeback@writeback-check-output=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl2/igt@prime_nv_api@i915_nv_reimport_twice=
_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +214 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb6/igt@prime_udl.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</a>)<=
/p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb1/igt@prime_udl.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#109291</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-iclb7/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-tglb5/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5723/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-apl1/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3002">i915#3002</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-kbl1/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2994">i915#2994</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5723/shard-apl1/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-=
glk4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/=
shard-kbl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk9/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard=
-glk5/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shar=
d-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk3/igt@gem_exec_whisper@basic-contexts-priority-all.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5723/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority-all=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/307">i915#=
307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
23/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2428">i915#2428<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/s=
hard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5723/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52"=
>i915#52</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
4">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5723/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-ytiled.htm=
l">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-=
b-planes.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5723/shard-snb2/igt@kms_plane@plane-panning-bottom-right=
-suspend-pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#1110=
68</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i9=
15#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5723/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/sh=
ard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2=
684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
23/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#65=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723=
/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2920</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6063/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5723/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6063/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6063/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6063/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#18=
14</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2292">i=
915#2292</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
002">i915#3002</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5723/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723=
/shard-kbl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/602">i915#602</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6063 -&gt; IGTPW_5723</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9949: caf1e8d36f0bdd43bfd47e5a6f46d4b691d284e3 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5723: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5723/index.htm=
l<br />
  IGT_6063: d3b7f74ce5df6fdea03e490b7c64f0c6bfe76f03 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============3452311935929114999==--

--===============1491429893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1491429893==--
