Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1531531154564370798=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 04 Oct 2021 13:28:52 -0000
Message-ID: <163335413229.1481.10986534342281536722@emeril.freedesktop.org>
References: <20210902151334.15818-1-vidya.srinivas@intel.com>
In-Reply-To: <20210902151334.15818-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fpsr2=5Fsf=3A_Skip_tests_if_selected_fetch_is_not_availabl?=
 =?utf-8?q?e_=28rev3=29?=
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1531531154564370798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_psr2_sf: Skip tests if selected fetch is not available (rev3)
URL   : https://patchwork.freedesktop.org/series/94288/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6229_full -> IGTPW_6273_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6273_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6273_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6273_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_lease@invalid-create-leases:
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@kms_lease@invalid-create-leases.html
    - shard-apl:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl6/igt@kms_lease@invalid-create-leases.html

  
Known issues
------------

  Here are the changes found in IGTPW_6273_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb2/igt@gem_ctx_persistence@process.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][4] ([i915#2369] / [i915#3063] / [i915#3648])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#2842]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][17] ([fdo#109271]) +494 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109313])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][19] ([i915#2658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109289]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@gen3_render_linear_blits.html

  * igt@gen3_render_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109289])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][24] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][26] -> [FAIL][27] ([i915#454])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109293] / [fdo#109506])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109506] / [i915#2411])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][30] ([i915#180])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#2411] / [i915#456])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@i915_suspend@forcewake.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#1769])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          NOTRUN -> [DMESG-WARN][34] ([i915#118] / [i915#95])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#118] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110725] / [fdo#111614])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111614]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3777])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3777]) +3 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110723])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2705])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#2705])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689] / [i915#3886]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#3886]) +16 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689]) +14 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [i915#3886])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb5/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109278] / [i915#1149])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_concurrent@pipe-d:
    - shard-tglb:         NOTRUN -> [FAIL][58] ([i915#1385])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_concurrent@pipe-d.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][59] ([i915#1319])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#3116])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3116])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111828])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3359]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3319]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-size-change:
    - shard-kbl:          [PASS][67] -> [FAIL][68] ([i915#3444])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-tglb:         [PASS][69] -> [FAIL][70] ([i915#2124] / [i915#4024])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
    - shard-iclb:         [PASS][71] -> [FAIL][72] ([i915#3444])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-size-change.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +208 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109279] / [i915#3359]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109278]) +23 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111825]) +33 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3788])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][79] -> [INCOMPLETE][80] ([i915#155] / [i915#180] / [i915#636])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109274]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2587])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([i915#3701])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109280]) +16 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][86] -> [DMESG-WARN][87] ([i915#180]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#533]) +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][89] -> [DMESG-WARN][90] ([i915#180])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][91] ([fdo#108145] / [i915#265]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][92] ([i915#265])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][93] ([i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][94] ([i915#265])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][95] ([fdo#108145] / [i915#265]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][96] ([fdo#108145] / [i915#265]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271]) +73 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#3536]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#3536]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#658])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#658]) +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#2920]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#658]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109441]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-tglb:         NOTRUN -> [FAIL][105] ([i915#132] / [i915#3467]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [PASS][106] -> [SKIP][107] ([fdo#109441]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#111615]) +5 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][109] ([i915#31])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271]) +310 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#533]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#2437])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#2437])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#2437])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2437])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2530]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@nouveau_crc@pipe-c-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#2530])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#112283])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@perf_pmu@event-wait@rcs0.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#109291]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@prime_nv_pcopy@test3_5.html

  * igt@sysfs_clients@pidname:
    - shard-apl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#2994]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][121] ([i915#658]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb7/igt@feature_discovery@psr2.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][123] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][125] ([i915#2842]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][127] ([i915#2842]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][129] ([i915#118] / [i915#95]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-glk:          [FAIL][131] ([i915#3444]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-tglb:         [FAIL][133] ([i915#2124] / [i915#4024]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - shard-snb:          [FAIL][135] ([i915#4024]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
    - sha

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/index.html

--===============1531531154564370798==
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
<tr><td><b>Series:</b></td><td>tests/kms_psr2_sf: Skip tests if selected fetch is not available (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94288/">https://patchwork.freedesktop.org/series/94288/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6229_full -&gt; IGTPW_6273_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6273_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6273_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6273_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@kms_lease@invalid-create-leases.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl6/igt@kms_lease@invalid-create-leases.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6273_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb2/igt@gem_ctx_persistence@process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109271]) +494 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb1/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk6/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb5/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb5/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_concurrent@pipe-d.html">FAIL</a> ([i915#1385])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#111828])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-random.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-size-change:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#3444])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#2124] / [i915#4024])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-size-change.html">FAIL</a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">SKIP</a> ([fdo#109271]) +208 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb4/igt@kms_cursor_edge_walk@pipe-d-256x256-left-edge.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([fdo#111825]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_dither@fb-8bpc-vs-panel-8bpc@edp-1-pipe-a.html">SKIP</a> ([i915#3788])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-viewport-size-256:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk7/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb1/igt@kms_plane_lowres@pipe-b-tiling-none.html">SKIP</a> ([i915#3536]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([fdo#111615]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb5/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl8/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> ([fdo#109271]) +310 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb8/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb7/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@nouveau_crc@pipe-c-source-rg.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb5/igt@prime_nv_pcopy@test3_5.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb7/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-iclb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#2124] / [i915#4024]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6229/shard-snb2/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a> ([i915#4024]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6273/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">PASS</a></p>
</li>
<li>
<p>sha</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1531531154564370798==--
