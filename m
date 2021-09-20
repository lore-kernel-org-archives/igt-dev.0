Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2021249418312284378=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 20 Sep 2021 08:39:41 -0000
Message-ID: <163212718102.25897.6057848775467333065@emeril.freedesktop.org>
References: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20210920063059.10079-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fsync=2Ec_=3A_Add_allocator_support?=
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2021249418312284378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_sync.c : Add allocator support
URL   : https://patchwork.freedesktop.org/series/94846/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6212_full -> IGTPW_6236_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6236_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6236_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6236_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live:
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl4/igt@i915_selftest@live.html

  
Known issues
------------

  Here are the changes found in IGTPW_6236_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-iclb:         [PASS][2] -> [INCOMPLETE][3] ([i915#4130])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb7/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#1839])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#658])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][7] ([i915#3002])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#180]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#2410])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][12] ([i915#2369] / [i915#3063] / [i915#3648])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#109283])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb6/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#109283])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@gem_exec_params@no-bsd.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][20] ([i915#2658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][21] ([i915#2658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109312])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1373] / [i915#456])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb3/igt@gem_softpin@noreloc-s3.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#3297])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#3297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [FAIL][29] ([i915#3318])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289]) +7 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#2856]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#2856]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1937])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][35] ([i915#2681])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][36] ([i915#2684])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111644] / [i915#1397] / [i915#2411])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@live:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][38] ([i915#4136])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@i915_selftest@live.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][39] ([i915#1895])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@i915_selftest@live.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3826])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3886]) +15 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278] / [i915#3886]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689] / [i915#3886]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689]) +14 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3742])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +9 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb7/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [i915#1149])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111828])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][55] ([i915#1319])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#3359]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3319]) +4 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-random:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109279] / [i915#3359]) +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278]) +19 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274] / [fdo#109278])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglb:         [PASS][62] -> [INCOMPLETE][63] ([i915#2411] / [i915#456])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb3/igt@kms_fbcon_fbt@psr-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-iclb:         [PASS][65] -> [SKIP][66] ([i915#3701])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111825]) +49 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#109280]) +13 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][69] ([i915#180]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb1/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#1187])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][73] -> [INCOMPLETE][74] ([i915#456])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [PASS][75] -> [INCOMPLETE][76] ([i915#2828] / [i915#456])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][77] ([i915#265]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#3536])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3536]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-none.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#112054])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_prime@basic-crc@first-to-second:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#1836])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_prime@basic-crc@first-to-second.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +6 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2920]) +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109642] / [fdo#111068] / [i915#658])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109441]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][87] -> [SKIP][88] ([fdo#109441])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> [FAIL][89] ([i915#132] / [i915#3467]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_psr@psr2_sprite_render.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2530]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#2530]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271]) +258 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109291]) +4 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb6/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109291]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109295])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb6/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@sema-10:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#2994]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@sema-25:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#2994])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#2994]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-kbl:          [DMESG-WARN][99] ([i915#4130]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@device_reset@unbind-reset-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl4/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][101] ([i915#2842]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][103] ([i915#2849]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][105] ([i915#1982]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][107] ([i915#454]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [INCOMPLETE][109] ([i915#456]) -> [PASS][110] +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@i915_suspend@sysfs-reader.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [INCOMPLETE][113] ([i915#2411] / [i915#456]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][115] ([fdo#109441]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][117] ([i915#2828] / [i915#456]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-iclb:         [INCOMPLETE][119] -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb7/igt@perf_pmu@rc6-runtime-pm.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@perf_pmu@rc6-runtime-pm.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][121] ([i915#658]) -> [SKIP][122] ([i915#588])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][123] ([i915#1804] / [i915#2684]) -> [WARN][124] ([i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][125] ([i915#155] / [i915#794]) -> [DMESG-WARN][126] ([i915#180])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][127] ([i915#658]) -> [SKIP][128] ([i915#2920]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][129] ([i915#2920]) -> [SKIP][130] ([i915#658]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#2426] / [i915#3002] / [i915#3363])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6212/shard-kbl6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.html

--===============2021249418312284378==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_sync.c : Add allocator suppor=
t</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/94846/">https://patchwork.freedesktop.org/series/94846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6236/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6212_full -&gt; IGTPW_6236_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6236_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6236_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6236=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live:<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl4/igt@i915_selftest@live.html">FAIL</a></=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6236_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb3=
/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> ([i915#4130])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb2/igt@feature_discovery@display-2x.html">=
SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb2/igt@feature_discovery@display-2x.html">=
SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@feature_discovery@psr2.html">SKIP<=
/a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/sh=
ard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([=
i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-=
tglb1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410])</l=
i>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEO=
UT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb=
1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html"=
>FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb6/igt@gem_exec_params@no-bsd.html">SKIP</=
a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb2/igt@gem_exec_params@no-bsd.html">SKIP</=
a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb2/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@gem_softpin@evict-snoop.html">SKIP=
</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb3/igt@gem_softpin@noreloc-s3.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@g=
em_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915#1373] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@gen3_render_tiledy_blits.html">SKI=
P</a> ([fdo#109289]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking=
.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb4/igt@gen9_exec_parse@basic-rejected.htm=
l">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2681])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb5/igt@i915_selftest@live.html">INCOMPLETE=
</a> ([i915#4136])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb6/igt@i915_selftest@live.html">INCOMPLETE=
</a> ([i915#1895])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_big_fb@x-tiled-16bpp-rotate-90=
.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +3 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +15 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_ccs@pipe-b-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_ccs@pipe-c-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +4 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb7/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a> ([fdo#109284] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_chamelium@hdmi-edid-read.html"=
>SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_color@pipe-d-ctm-green-to-red.=
html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-0-7=
5.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb5/igt@kms_content_protection@lic.html">SK=
IP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-kbl7/igt@kms_content_protection@lic.html">TIM=
EOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-sliding.html">SKIP</a> ([i915#3359]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-random.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_cursor_edge_walk@pipe-d-128x12=
8-top-edge.html">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@kms_cursor_legacy@2x-nonblocking-m=
odeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb3/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb7/ig=
t@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456])=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_flip@2x-flip-vs-suspend.html">=
SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-yti=
le.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6236/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-y=
tile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +49 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +13 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html">DM=
ESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-iclb1/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_hdr@static-toggle.html">SKIP</a=
> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl7/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_62=
36/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPL=
ETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_62=
36/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">INCOMPL=
ETE</a> ([i915#2828] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-=
basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb5/igt@kms_plane_lowres@pipe-a-tiling-x.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-non=
e.html">SKIP</a> ([i915#3536]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.=
html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc@first-to-second:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_prime@basic-crc@first-to-secon=
d.html">SKIP</a> ([i915#1836])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP=
</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-icl=
b1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@kms_psr@psr2_sprite_render.html">F=
AIL</a> ([i915#132] / [i915#3467]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-com=
plete.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@prime_nv_pcopy@test2.html">SKIP</a>=
 ([fdo#109271]) +258 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb6/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> ([fdo#109291]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb8/igt@prime_nv_test@i915_nv_sharing.html=
">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb6/igt@prime_vgem@fence-flip-hang.html">S=
KIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb7/igt@sysfs_clients@sema-10.html">SKIP</=
a> ([i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-iclb6/igt@sysfs_clients@sema-25.html">SKIP</=
a> ([i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-kbl3/igt@sysfs_clients@sema-50.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN<=
/a> ([i915#4130]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6236/shard-kbl4/igt@device_reset@unbind-reset-rebind.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i9=
15#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
236/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> =
([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6236/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb8/igt@i915_module_load@reload-with-fault-injection.html=
">INCOMPLETE</a> ([i915#1982]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@i915_module_load@reload-with-fault=
-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454]) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-i=
clb6/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([=
i915#456]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6236/shard-tglb2/igt@i915_suspend@sysfs-reader.html">PASS</a> +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-W=
ARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6236/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PA=
SS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.htm=
l">INCOMPLETE</a> ([i915#2411] / [i915#456]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb2/igt@kms_flip@flip-vs-sus=
pend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> ([fd=
o#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6236/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-tglb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">I=
NCOMPLETE</a> ([i915#2828] / [i915#456]) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_6236/shard-tglb8/igt@kms_vblank@pipe-c-ts-con=
tinuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb7/igt@perf_pmu@rc6-runtime-pm.html">INCOMPLETE</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6236/shard-iclb=
8/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([=
i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6236/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#=
588])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i=
915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6236/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WAR=
N</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">INC=
OMPLETE</a> ([i915#155] / [i915#794]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6236/shard-kbl1/igt@i915_suspend@fence-restore-t=
iled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.ht=
ml">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6236/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg=
-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6212/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</=
a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6236/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP<=
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
>, <a href=3D"https://intel-gfx-ci.01.">FAIL</a>, [FAIL][143]) ([fdo#109271=
] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i=
915#602]) -&gt; ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL]=
[148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FA=
IL][154], [FAIL][155]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#181=
4] / [i915#2426] / [i915#3002] / [i915#3363])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2021249418312284378==--
