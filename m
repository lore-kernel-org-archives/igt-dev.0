Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6228241553868828752=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Sep 2021 10:26:25 -0000
Message-ID: <163213358564.25896.7933865062659382549@emeril.freedesktop.org>
References: <20210916141227.17554-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916141227.17554-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/intel=5Fmemory=5Fregion=3A_Fix_regression_on_5=2E4_kernel_?=
 =?utf-8?b?KHJldjMp?=
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

--===============6228241553868828752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/intel_memory_region: Fix regression on 5.4 kernel (rev3)
URL   : https://patchwork.freedesktop.org/series/94761/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6212_full -> IGTPW_6237_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6237_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6237_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6237_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-tglb:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb3/igt@gem_exec_flush@basic-uc-pro-default.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html

  
Known issues
------------

  Here are the changes found in IGTPW_6237_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][8] ([i915#3002])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][9] ([i915#2369] / [i915#3063] / [i915#3648])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2846])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842]) +5 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2842]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][14] -> [SKIP][15] ([fdo#109271]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb3/igt@gem_exec_params@no-bsd.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#2190])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109312])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3297]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109289]) +6 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2856]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb3/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#2856]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1937])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][32] ([i915#2681])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][33] ([i915#1804] / [i915#2684])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@i2c:
    - shard-tglb:         NOTRUN -> [FAIL][34] ([i915#2411]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][36] ([i915#151] / [i915#155])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][37] ([i915#2373])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][38] ([i915#1759] / [i915#2291])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_selftest@live@gt_pm.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3826])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3777]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111615]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#2705])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb3/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +13 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [i915#3886]) +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689] / [i915#3886]) +5 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689]) +16 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3742])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +15 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#1149])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][54] ([i915#1319]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111828])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3359]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3319]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109279] / [i915#3359]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][60] ([i915#180]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278]) +19 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][62] ([i915#155] / [i915#180] / [i915#636])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#2587])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][65] -> [INCOMPLETE][66] ([i915#456])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109280]) +15 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +46 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#1187])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][71] -> [DMESG-WARN][72] ([i915#180]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][73] -> [INCOMPLETE][74] ([i915#2828] / [i915#456])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([i915#265]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3536])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3536]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#112054])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#1836])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2920]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109642] / [fdo#111068] / [i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109441])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][87] ([i915#132] / [i915#3467]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][88] ([IGT#2])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-iclb:         [PASS][89] -> [INCOMPLETE][90] ([i915#1373] / [i915#2828])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2530]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +249 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109291]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109291]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([fdo#109295])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@sema-10:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#2994]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#2994])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@sysfs_clients@sema-25.html
    - shard-kbl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994]) +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-kbl:          [INCOMPLETE][100] ([i915#4130]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         [FAIL][102] ([i915#2842]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][106] ([i915#1982]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][108] ([i915#454]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][110] ([i915#456]) -> [PASS][111] +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [INCOMPLETE][112] ([i915#2411] / [i915#456]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][114] ([i915#180]) -> [PASS][115] +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb3/igt@kms_psr@psr2_primary_render.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][118] ([i915#2828] / [i915#456]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-iclb:         [INCOMPLETE][120] -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb7/igt@perf_pmu@rc6-runtime-pm.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@perf_pmu@rc6-runtime-pm.html

  
#### Warnings ####

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][122] ([i915#658]) -> [SKIP][123] ([i915#2920]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][124] ([i915#2920]) -> [SKIP][125] ([i915#658]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602] / [i915#92])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.o

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/index.html

--===============6228241553868828752==
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
<tr><td><b>Series:</b></td><td>lib/i915/intel_memory_region: Fix regression=
 on 5.4 kernel (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/94761/">https://patchwork.freedesktop.org/series/94761/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6237/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6212_full -&gt; IGTPW_6237_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6237_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6237_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6237=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb3/igt@gem_exec_flush@basic-uc-pro-default.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shar=
d-tglb2/igt@gem_exec_flush@basic-uc-pro-default.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb5/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard=
-iclb1/igt@i915_pm_rpm@system-suspend-devices.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6237_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb8/igt@feature_discovery@display-2x.html">=
SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb2/igt@feature_discovery@display-2x.html">=
SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@feature_discovery@psr2.html">SKIP<=
/a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEO=
UT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb6/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html"=
>FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/=
igt@gem_exec_fair@basic-pace@rcs0.html">SKIP</a> ([fdo#109271]) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl6/=
igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb1/igt@gem_exec_params@no-bsd.html">SKIP</=
a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb3/igt@gem_exec_params@no-bsd.html">SKIP</=
a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb8/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb2/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP=
</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-afte=
r-close.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-afte=
r-close.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@gen3_render_tiledy_blits.html">SKI=
P</a> ([fdo#109289]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb2/igt@gen7_exec_parse@oacontrol-tracking=
.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb3/igt@gen9_exec_parse@basic-rejected.htm=
l">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2681])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@i915_pm_rpm@i2c.html">FAIL</a> ([i=
915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@i915_pm_rpm@system-suspend-devices.=
html">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_big_fb@x-tiled-16bpp-rotate-90=
.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +4 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb3/igt@kms_big_joiner@2x-modeset.html">SK=
IP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +13 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb1/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +4 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb3/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_chamelium@hdmi-edid-read.html"=
>SKIP</a> ([fdo#109284] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_color@pipe-d-ctm-green-to-red.=
html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@kms_color_chamelium@pipe-d-ctm-0-7=
5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl6/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_content_protection@lic.html">S=
KIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspen=
d.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb5/igt@kms_cursor_edge_walk@pipe-d-128x12=
8-top-edge.html">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INC=
OMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_flip@2x-flip-vs-suspend.html">=
SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/sha=
rd-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i9=
15#456])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +15 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([fdo#111825]) +46 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-tglb6/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_623=
7/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WAR=
N</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_62=
37/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPL=
ETE</a> ([i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb6/igt@kms_plane_lowres@pipe-a-tiling-x.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_plane_lowres@pipe-b-tiling-non=
e.html">SKIP</a> ([i915#3536]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.=
html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_prime@basic-crc@first-to-secon=
d.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#2920]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP=
</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-icl=
b8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@kms_psr@psr2_sprite_render.html">F=
AIL</a> ([i915#132] / [i915#3467]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6237/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> ([i915#1373] / [i915#2828])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@nouveau_crc@pipe-c-source-outp-com=
plete.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-kbl1/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109271]) +249 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb6/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-iclb8/igt@prime_nv_test@i915_nv_sharing.html=
">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb2/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@sysfs_clients@sema-10.html">SKIP</=
a> ([i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-iclb1/igt@sysfs_clients@sema-25.html">SKIP</a=
> ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6237/shard-kbl7/igt@sysfs_clients@sema-25.html">SKIP</a>=
 ([fdo#109271] / [i915#2994]) +5 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl4/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> =
([i915#4130]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6237/shard-kbl6/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a>=
 ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6237/shard-tglb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
237/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html=
">INCOMPLETE</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6237/shard-tglb5/igt@i915_module_load@reload-with-fault=
-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454]) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-i=
clb7/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([=
i915#456]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6237/shard-tglb7/igt@i915_suspend@sysfs-reader.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.htm=
l">INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb1/igt@kms_flip@flip-vs-sus=
pend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-W=
ARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6237/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PA=
SS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb3/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#=
109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_62=
37/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">I=
NCOMPLETE</a> ([i915#2828] / [i915#456]) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6237/shard-tglb8/igt@kms_vblank@pipe-c-ts-con=
tinuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb7/igt@perf_pmu@rc6-runtime-pm.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-iclb=
2/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</=
a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6237/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</=
a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6237/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP<=
/a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6212/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6212/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/=
shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([fdo#10=
9271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] =
/ [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6237/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_623=
7/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6237/shard-kbl7/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6237/shard=
-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.o">FAIL</a>, [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][14=
9], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1436] / [i91=
5#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602] / [i915#92])<=
/li>
</ul>
</li>
</ul>

</body>
</html>

--===============6228241553868828752==--
