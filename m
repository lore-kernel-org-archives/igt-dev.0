Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5756523997933342927=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Sep 2021 05:10:51 -0000
Message-ID: <163176905133.8839.1530850786877152335@emeril.freedesktop.org>
References: <20210915033358.561080-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210915033358.561080-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium=3A_Skip_CTM_test_if_property_is_not_pre?=
 =?utf-8?q?sent_=28rev2=29?=
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============5756523997933342927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_chamelium: Skip CTM test if property is not present (rev2)
URL   : https://patchwork.freedesktop.org/series/94653/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10586_full -> IGTPW_6220_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6220_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6220_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6220_full:

### IGT changes ###

#### Possible regressions ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@device_reset@unbind-reset-rebind.html

  * igt@i915_selftest@mock:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@i915_selftest@mock.html

  
Known issues
------------

  Here are the changes found in IGTPW_6220_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4] ([i915#4130])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#1839])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@feature_discovery@display-2x.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_mmap_gtt@coherency:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([fdo#111656])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#768])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#3297])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([fdo#109289])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#109289])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#2856]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#2856]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#454])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         NOTRUN -> [WARN][20] ([i915#1804] / [i915#2684])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110892])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][22] ([i915#2373])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][23] ([i915#1759] / [i915#2291])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@i915_selftest@live@gt_pm.html

  * igt@i915_selftest@live@mman:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][24] ([i915#4129])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@i915_selftest@live@mman.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][25] ([i915#4129])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@i915_selftest@live@mman.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111614]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#3777])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110723])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271]) +92 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#109278] / [i915#3886]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3886]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3689] / [i915#3886]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3689]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3359]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [PASS][41] -> [INCOMPLETE][42] ([i915#2411] / [i915#456])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109279] / [i915#3359]) +5 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3319])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109274]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-iclb:         [PASS][48] -> [INCOMPLETE][49] ([i915#1373])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#2672])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#111825]) +20 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109280]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][53] -> [SKIP][54] ([i915#433])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_dotclock:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109310])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#533])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#180]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][59] ([i915#180]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-d-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3536])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#112054]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#2920])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#658])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#658]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109441]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-tglb:         NOTRUN -> [FAIL][67] ([i915#132] / [i915#3467]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][68] -> [SKIP][69] ([fdo#109441])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@suspend:
    - shard-tglb:         [PASS][70] -> [INCOMPLETE][71] ([i915#456]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-tglb7/igt@kms_psr@suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@kms_psr@suspend.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109309])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][73] -> [DMESG-WARN][74] ([i915#180] / [i915#295])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109502])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb5/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2437])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#2437])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#2530]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][80] -> [FAIL][81] ([i915#1542])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb2/igt@perf@polling-parameterized.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109291])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2994])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@sema-50:
    - shard-kbl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2994]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-iclb:         [TIMEOUT][87] ([i915#3070]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb6/igt@gem_eio@in-flight-contexts-10ms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][89] ([i915#2369] / [i915#3063] / [i915#3648]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_endless@dispatch@vcs0:
    - shard-iclb:         [INCOMPLETE][91] ([i915#3778]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb8/igt@gem_exec_endless@dispatch@vcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@gem_exec_endless@dispatch@vcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][93] ([i915#2842]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][95] ([i915#2842]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][97] ([i915#2849]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-iclb:         [INCOMPLETE][99] -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][101] ([i915#456]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-tglb7/igt@i915_suspend@debugfs-reader.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-b-ctm-blue-to-red:
    - shard-iclb:         [INCOMPLETE][103] ([i915#1149]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb1/igt@kms_color@pipe-b-ctm-blue-to-red.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_color@pipe-b-ctm-blue-to-red.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Warnings ####

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][107] ([i915#2920]) -> [SKIP][108] ([i915#658])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][109] ([i915#658]) -> [SKIP][110] ([i915#2920]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][111], [FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119], [FAIL][120]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#602] / [i915#92]) -> ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2426] / [i915#3002] / [i915#3363] / [i915#602] / [i915#92])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl7/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl1/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl3/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl4/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl4/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][131], [FAIL][132]) ([i915#3002]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#2426] / [i915#3002] / [i915#3690])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb5/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157]) ([i915#1610] / [i915#2426] / [i915#3363]) -> ([FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167], [FAIL][168], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179]) ([i915#1610] / [i915#1814] / [i915#2426] / [i915#3363])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl2/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl2/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl7/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl2/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl1/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl1/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html
   [156]: https://

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.html

--===============5756523997933342927==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_chamelium: Skip CTM test if =
property is not present (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/94653/">https://patchwork.freedesktop.org/series/94653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6220/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10586_full -&gt; IGTPW_6220_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6220_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6220_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6220=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@device_reset@unbind-reset-rebind.ht=
ml">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@i915_selftest@mock.html">INCOMPLET=
E</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6220_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-i=
clb6/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> ([i915#4130])</l=
i>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@feature_discovery@display-2x.html"=
>SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kb=
l1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs=
0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-iclb4/igt@gem_exec_params@no-vebox.html">SKIP=
</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-tglb3/igt@gem_exec_params@no-vebox.html">SKIP=
</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@gem_mmap_gtt@coherency.html">SKIP<=
/a> ([fdo#111656])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-y-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@gen3_render_linear_blits.html">SKI=
P</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@gen9_exec_parse@basic-rejected.htm=
l">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@gen9_exec_parse@bb-start-param.htm=
l">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@=
i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.htm=
l">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> ([i915#2373])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> ([i915#1759] / [i915#2291])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@mman:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-kbl2/igt@i915_selftest@live@mman.html">INCOMP=
LETE</a> ([i915#4129])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-iclb4/igt@i915_selftest@live@mman.html">INCOM=
PLETE</a> ([i915#4129])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-27=
0.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-64=
bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-kbl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271]) +92 similar iss=
ues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#111615])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl6/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +6 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_ccs@pipe-c-random-ccs-data-y_t=
iled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@kms_chamelium@vga-hpd-for-each-pipe=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_color_chamelium@pipe-invalid-d=
egamma-lut-sizes.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-random.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220=
/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> =
([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-64x21=
-sliding.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6220/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.htm=
l">INCOMPLETE</a> ([i915#1373])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +20 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> ([fdo#109280]) +8 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-t=
glb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_invalid_dotclock.html">SKIP</a=
> ([fdo#109310])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl4/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6220/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG=
-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-c.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-x.h=
tml">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-t=
iling-yf.html">SKIP</a> ([fdo#112054]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-2.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-5.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl7/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">S=
KIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@kms_psr@psr2_primary_mmap_gtt.html=
">FAIL</a> ([i915#132] / [i915#3467]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-i=
clb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-tglb7/igt@kms_psr@suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@kms=
_psr@suspend.html">INCOMPLETE</a> ([i915#456]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb6/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6220/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-W=
ARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb5/igt@kms_vrr@flip-suspend.html">SKIP</a=
> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-iclb7/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-tglb8/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb7/igt@nouveau_crc@pipe-b-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb2/igt@perf@polling-parameterized.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-icl=
b8/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twic=
e_check_flink_name.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@sysfs_clients@fair-1.html">SKIP</a=
> ([i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@sysfs_clients@sema-50.html">SKIP</a=
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
/CI_DRM_10586/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html">D=
MESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6220/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.=
html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb6/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT=
</a> ([i915#3070]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6220/shard-iclb6/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i9=
15#2369] / [i915#3063] / [i915#3648]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6220/shard-tglb2/igt@gem_eio@unwedge-stress.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb8/igt@gem_exec_endless@dispatch@vcs0.html">INCOMPLE=
TE</a> ([i915#3778]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6220/shard-iclb8/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6220/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6220/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6220/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html">=
INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6220/shard-iclb6/igt@gem_workarounds@suspend-resume-context.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-tglb7/igt@i915_suspend@debugfs-reader.html">INCOMPLETE<=
/a> ([i915#456]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6220/shard-tglb5/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb1/igt@kms_color@pipe-b-ctm-blue-to-red.html">INCOMP=
LETE</a> ([i915#1149]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6220/shard-iclb3/igt@kms_color@pipe-b-ctm-blue-to-red.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb3/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 ([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6220/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 =
similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
1.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6220/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
2.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6220/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10586/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl3/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10586/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
0586/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl4/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1058=
6/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-kbl1/igt@runner@aborted.html">F=
AIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363=
] / [i915#602] / [i915#92]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6220/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6220/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6220/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_622=
0/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6220/shard-kbl2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard=
-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6220/shard-kbl1/igt@runner@aborted.html">FAIL</a>) =
([i915#1436] / [i915#180] / [i915#1814] / [i915#2426] / [i915#3002] / [i915=
#3363] / [i915#602] / [i915#92])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-iclb5/igt@runner@a=
borted.html">FAIL</a>) ([i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6220/shard-iclb8/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6220/shard-ic=
lb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6220/shard-iclb1/igt@runner@aborted.html">FAIL</a>) (=
[i915#2426] / [i915#3002] / [i915#3690])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10586/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10586/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10586/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl2/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
0586/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1058=
6/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/s=
hard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_10586/shard-apl7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shar=
d-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_10586/shard-apl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-a=
pl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_10586/shard-apl8/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl8=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_10586/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10586/shard-apl1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/CI_DRM_10586/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://">FAIL</a>, [FAIL][157]) ([i915#1610] / [i915#2426] / [i915#33=
63]) -&gt; ([FAIL][158], [FAIL][159], [FAIL][160], [FAIL][161], [FAIL][162]=
, [FAIL][163], [FAIL][164], [FAIL][165], [FAIL][166], [FAIL][167], [FAIL][1=
68], [FAIL][169], [FAIL][170], [FAIL][171], [FAIL][172], [FAIL][173], [FAIL=
][174], [FAIL][175], [FAIL][176], [FAIL][177], [FAIL][178], [FAIL][179]) ([=
i915#1610] / [i915#1814] / [i915#2426] / [i915#3363])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============5756523997933342927==--
