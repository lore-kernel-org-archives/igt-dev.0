Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 22 Jul 2021 11:29:18 -0000
Message-ID: <162695335885.30343.14245890291099557651@emeril.freedesktop.org>
References: <20210722082426.4538-1-andrzej.turko@linux.intel.com>
In-Reply-To: <20210722082426.4538-1-andrzej.turko@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ2hlY2sg?=
 =?utf-8?q?the_addresses_of_blocks_being_reserved?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1460880126=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1460880126==
Content-Type: multipart/alternative;
 boundary="===============7614134820667683736=="

--===============7614134820667683736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check the addresses of blocks being reserved
URL   : https://patchwork.freedesktop.org/series/92880/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6147_full -> IGTPW_6043_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6043_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6043_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6043_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  
Known issues
------------

  Here are the changes found in IGTPW_6043_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1839])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@feature_discovery@display-2x.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-iclb:         [PASS][4] -> [INCOMPLETE][5] ([i915#3652])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@gem_exec_endless@dispatch@bcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2842]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-independent@vcs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#3795])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@gem_exec_schedule@u-independent@vcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@gem_exec_schedule@u-independent@vcs0.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#284])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@gem_media_vme.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][17] ([i915#2658])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#768]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#3297])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#109289])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][22] -> [INCOMPLETE][23] ([i915#3698])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#1937])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#579])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#3826])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#110725] / [fdo#111614])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3777]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#3777]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111615])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#3689]) +5 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271]) +23 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271]) +317 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +24 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk9/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_color_chamelium@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111828]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][42] ([i915#1319]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109300] / [fdo#111066]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][44] ([i915#1319]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][45] ([i915#2105])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [PASS][46] -> [DMESG-WARN][47] ([i915#180]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109279] / [i915#3359])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [fdo#109279])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3319])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278]) +23 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3359]) +4 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271]) +357 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111825]) +12 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109274]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#2546])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-apl:          [PASS][59] -> [FAIL][60] ([i915#2546])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-kbl:          [PASS][61] -> [FAIL][62] ([i915#2546])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109280]) +13 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109278])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][69] ([i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-c-tiling-none:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3536]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_plane_lowres@pipe-c-tiling-none.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#658])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109642] / [fdo#111068] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#132] / [i915#3467])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109441])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_psr@psr2_primary_render.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][82] ([i915#31])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2437]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl6/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#2530])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#2530])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109278] / [i915#2530])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_pcopy@test2:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +135 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl6/igt@prime_nv_pcopy@test2.html

  * igt@prime_nv_pcopy@test3_3:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109291]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@prime_nv_pcopy@test3_3.html
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@prime_nv_pcopy@test3_3.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#111656]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109292]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2994]) +6 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@sysfs_clients@create.html

  * igt@sysfs_clients@fair-1:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2994])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@sysfs_clients@fair-1.html
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2994])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [INCOMPLETE][97] ([i915#155]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@gem_eio@in-flight-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][99] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@gem_eio@unwedge-stress.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][101] ([i915#2842]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][103] ([i915#2842]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [SKIP][105] ([fdo#109271]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][107] ([i915#118] / [i915#95]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [DMESG-WARN][109] ([i915#3698]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_addfb_basic@bad-pitch-256:
    - shard-kbl:          [DMESG-WARN][111] ([i915#3746]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@kms_addfb_basic@bad-pitch-256.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@kms_addfb_basic@bad-pitch-256.html
    - shard-iclb:         [DMESG-WARN][113] ([i915#3746]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb5/igt@kms_addfb_basic@bad-pitch-256.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_addfb_basic@bad-pitch-256.html
    - shard-tglb:         [DMESG-WARN][115] ([i915#3746]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb3/igt@kms_addfb_basic@bad-pitch-256.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_addfb_basic@bad-pitch-256.html
    - shard-glk:          [DMESG-WARN][117] ([i915#3746]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk9/igt@kms_addfb_basic@bad-pitch-256.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk1/igt@kms_addfb_basic@bad-pitch-256.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120] +5 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [DMESG-WARN][121] ([i915#180]) -> [PASS][122] +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][123] ([fdo#109441]) -> [PASS][124] +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][125] ([i915#180] / [i915#295]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-glk:          [FAIL][127] ([i915#43]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk7/igt@kms_vblank@pipe-b-accuracy-idle.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [INCOMPLETE][129] ([i915#1982] / [i915#3698]) -> [DMESG-WARN][130] ([i915#3698])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@i915_pm_dc@dc5-psr.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [INCOMPLETE][131] ([i915#3698]) -> [FAIL][132] ([i915#3343])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][133] ([i915#2684]) -> [WARN][134] ([i915#1804] / [i915#2684])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][135] ([i915#658]) -> [SKIP][136] ([i915#2920]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][137] ([i915#2920]) -> [SKIP][138] ([i915#658]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602]) -> ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([i915#1814] / [i915#3002] / [i915#3363] / [i915#602])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@runner@

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/index.html

--===============7614134820667683736==
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
<tr><td><b>Series:</b></td><td>Check the addresses of blocks being reserved</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92880/">https://patchwork.freedesktop.org/series/92880/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6147_full -&gt; IGTPW_6043_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6043_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6043_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6043_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6043_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a> ([i915#3652])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@gem_exec_schedule@u-independent@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@gem_exec_schedule@u-independent@vcs0.html">FAIL</a> ([i915#3795])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#768]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html">INCOMPLETE</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl6/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +317 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk9/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_color_chamelium@pipe-b-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@kms_content_protection@content_type_change.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +357 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#111825]) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#2546])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#2546])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#2546])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-move.html">SKIP</a> ([fdo#109280]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk6/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-none:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_plane_lowres@pipe-c-tiling-none.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@kms_psr@psr2_cursor_blt.html">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@kms_psr@psr2_primary_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-snb7/igt@kms_setmode@basic.html">FAIL</a> ([i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl6/igt@prime_nv_pcopy@test2.html">SKIP</a> ([fdo#109271]) +135 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_3:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@prime_nv_pcopy@test3_3.html">SKIP</a> ([fdo#109291]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@prime_nv_pcopy@test3_3.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109292]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl1/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb1/igt@sysfs_clients@fair-1.html">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@sysfs_clients@split-25.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl1/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb5/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk8/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">DMESG-WARN</a> ([i915#3698]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb8/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-256:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN</a> ([i915#3746]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl2/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb5/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN</a> ([i915#3746]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-tglb3/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN</a> ([i915#3746]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-tglb7/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk9/igt@kms_addfb_basic@bad-pitch-256.html">DMESG-WARN</a> ([i915#3746]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk1/igt@kms_addfb_basic@bad-pitch-256.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-glk7/igt@kms_vblank@pipe-b-accuracy-idle.html">FAIL</a> ([i915#43]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-glk3/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@i915_pm_dc@dc5-psr.html">INCOMPLETE</a> ([i915#1982] / [i915#3698]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb5/igt@i915_pm_dc@dc5-psr.html">DMESG-WARN</a> ([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">INCOMPLETE</a> ([i915#3698]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6043/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6147/shard-kbl6/igt@runner@">FAIL</a>, [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#602]) -&gt; ([FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([i915#1814] / [i915#3002] / [i915#3363] / [i915#602])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7614134820667683736==--

--===============1460880126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1460880126==--
