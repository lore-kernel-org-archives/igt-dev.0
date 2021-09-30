Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6315078857108211300=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Sep 2021 07:09:08 -0000
Message-ID: <163298574861.18253.4804179551653763782@emeril.freedesktop.org>
References: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Fnop=3A_Update_poll_sequential?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6315078857108211300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_nop: Update poll sequential
URL   : https://patchwork.freedesktop.org/series/95251/
State : success

== Summary ==

CI Bug Log - changes from IGT_6228_full -> IGTPW_6271_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/index.html

Known issues
------------

  Here are the changes found in IGTPW_6271_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([i915#658])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@feature_discovery@psr2.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-apl:          [PASS][3] -> [FAIL][4] ([i915#2410])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-apl3/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][5] ([i915#2369] / [i915#3063] / [i915#3648])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_eio@unwedge-stress.html
    - shard-iclb:         NOTRUN -> [TIMEOUT][6] ([i915#2369] / [i915#2481] / [i915#3070])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][7] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][9] ([i915#2849])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#109283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#112283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#112283])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][14] -> [SKIP][15] ([i915#2190])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3297])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@gem_userptr_blits@access-control.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#3297])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@gem_userptr_blits@access-control.html

  * igt@gen7_exec_parse@load-register-reg:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109289]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#1436] / [i915#716])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#2856]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#1937])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#1937])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][26] ([i915#2681])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][27] ([i915#2684])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109506] / [i915#2411])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111614]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#110725] / [fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#3777]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3777]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3777])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271]) +248 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3886]) +12 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886]) +7 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#3689] / [i915#3886]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [i915#3886]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3886]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3689]) +10 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk9/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [i915#1149])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][48] ([i915#1319]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109300] / [fdo#111066])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@kms_content_protection@atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111828])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][51] ([i915#1319]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3359]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][54] ([i915#180])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3319]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279] / [i915#3359]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278]) +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +223 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
    - shard-tglb:         [PASS][59] -> [INCOMPLETE][60] ([i915#2411] / [i915#4211])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-glk:          [PASS][61] -> [DMESG-WARN][62] ([i915#118] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111825]) +37 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-dp1:
    - shard-kbl:          [PASS][66] -> [FAIL][67] ([i915#2122])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate@c-dp1.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2587])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2672])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +12 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271]) +62 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109289]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][74] -> [INCOMPLETE][75] ([i915#456])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [PASS][76] -> [DMESG-WARN][77] ([i915#180]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][78] ([i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][79] ([i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][80] ([fdo#108145] / [i915#265])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#112054])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3536])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109274]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +5 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_dpms:
    - shard-tglb:         NOTRUN -> [FAIL][89] ([i915#132] / [i915#3467]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][90] -> [SKIP][91] ([fdo#109441]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109441]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][93] ([IGT#2])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][94] ([IGT#2])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109309])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][96] -> [DMESG-WARN][97] ([i915#180])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109502])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2437]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@kms_writeback@writeback-fb-id.html
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#2437]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2530]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2530])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@prime_nv_api@nv_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([fdo#109291])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@prime_nv_api@nv_self_import.html
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109291]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@prime_nv_api@nv_self_import.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109295])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@prime_vgem@fence-read-hang.html
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109295])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@pidname:
    - shard-kbl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2994]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@sysfs_clients@pidname.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-tglb:         [PASS][110] -> [FAIL][111] ([i915#1755])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb3/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-tglb:         [INCOMPLETE][112] ([i915#456]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb7/igt@gem_eio@in-flight-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][116] ([i915#118] / [i915#95]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglb:         [INCOMPLETE][118] ([i915#2411] / [i915#456] / [i915#750]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][120] ([i915#118] / [i915#1982] / [i915#95]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [FAIL][122] ([i915#1888]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-glk:          [FAIL][124] ([i915#3444]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [DMESG-FAIL][126] ([i915#118] / [i915#1888] / [i915#95]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][128] ([i915#79]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [DMESG-WARN][130] ([i915#180]) -> [PASS][131] +7 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][132] ([fdo#109441]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb7/igt@kms_psr@psr2_primary_render.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-iclb:         [FAIL][134] ([i915#1755]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@sysfs_heartbeat_interval@precise@vecs0.html
    - shard-kbl:          [FAIL][136] ([i915#1755]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl1/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [137]: https://intel-gfx-ci.0

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/index.html

--===============6315078857108211300==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_nop: Update poll sequential</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/95251/">https://patchwork.freedesktop.org/series/95251/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6228_full -&gt; IGTPW_6271_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6271_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-apl3/igt@gem_ctx_persistence@engines-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@gem_ctx_persistence@engines-hang@rcs0.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@load-register-reg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@gen7_exec_parse@load-register-reg.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> ([i915#1436] / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2856]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb4/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +248 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk9/igt@kms_chamelium@hdmi-aspect-ratio.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl4/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-dpms.html">SKIP</a> ([fdo#109278]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> ([fdo#109271]) +223 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#4211])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_flip@plain-flip-fb-recreate@c-dp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@kms_psr@psr2_dpms.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb6/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl6/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb7/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb5/igt@nouveau_crc@pipe-c-source-outp-inactive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb1/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb1/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl1/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-apl8/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb3/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb2/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> ([i915#1755])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb7/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> ([i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb8/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk1/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-tglb7/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> ([i915#2411] / [i915#456] / [i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#1982] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#1888]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk9/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html">DMESG-FAIL</a> ([i915#118] / [i915#1888] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-kbl4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb7/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-iclb2/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> ([i915#1755]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6271/shard-iclb8/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6228/shard-kbl1/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> ([i915#1755]) -&gt; <a href="https://intel-gfx-ci.0">PASS</a></p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6315078857108211300==--
