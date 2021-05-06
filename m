Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 May 2021 13:24:19 -0000
Message-ID: <162030745901.15691.6434907596630075529@emeril.freedesktop.org>
References: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20210506065709.345576-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2k5?=
 =?utf-8?q?15/perf=3A_Fix_non-card0_processing_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1002165963=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1002165963==
Content-Type: multipart/alternative;
 boundary="===============5620249660708002371=="

--===============5620249660708002371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/i915/perf: Fix non-card0 processing (rev5)
URL   : https://patchwork.freedesktop.org/series/89701/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10051_full -> IGTPW_5787_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5787_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5787_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5787_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-tglb:         [PASS][1] -> [FAIL][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5787_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][3] ([i915#3002]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][4] ([i915#180]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][6] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk5/igt@gem_exec_fair@basic-deadline.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][9] ([i915#2842]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2389]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#307]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#3323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][21] ([i915#3297])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-kbl:          NOTRUN -> [FAIL][22] ([i915#3324])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl4/igt@gem_userptr_blits@set-cache-level.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([i915#2527])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#2527])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111644] / [i915#1397] / [i915#2411])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#110892])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +166 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110725] / [fdo#111614])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#111614])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#111615])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [i915#1149])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-25:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@kms_color_chamelium@pipe-b-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3116])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#3116])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][38] ([i915#1319])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-size-change:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#2124])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-size-change.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#109279] / [i915#3359]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +26 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#426])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#426])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][46] -> [INCOMPLETE][47] ([i915#180] / [i915#1982])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-busy-flip:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +58 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109274]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-apl:          NOTRUN -> [FAIL][50] ([i915#79])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#180])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2642]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-glk:          [PASS][54] -> [FAIL][55] ([i915#49])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +11 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271]) +443 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109280]) +8 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +4 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][61] ([i915#265])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][62] ([fdo#108145] / [i915#265]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#658]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle-hang:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/igt@kms_vblank@pipe-d-ts-continuation-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-c-source-outp-inactive:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#2530]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-inactive.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2530]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb8/igt@nouveau_crc@pipe-c-source-outp-inactive.html

  * igt@runner@aborted:
    - shard-snb:          NOTRUN -> ([FAIL][73], [FAIL][74]) ([i915#3002] / [i915#698])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/igt@runner@aborted.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2994]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/igt@sysfs_clients@create.html

  * igt@sysfs_clients@fair-0:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#2994])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb1/igt@sysfs_clients@fair-0.html
    - shard-glk:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2994])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk7/igt@sysfs_clients@fair-0.html
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#2994])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@sysfs_clients@fair-0.html
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#2994])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/igt@sysfs_clients@fair-0.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][80] ([i915#2369] / [i915#3063]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][82] ([i915#2842]) -> [PASS][83] +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][84] ([i915#2842]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][86] ([i915#2842]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-sync@rcs0:
    - shard-kbl:          [SKIP][88] ([fdo#109271]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl6/igt@gem_exec_fair@basic-sync@rcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@gem_exec_fair@basic-sync@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][90] ([i915#2190]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tglb5/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-glk:          [FAIL][92] ([i915#307]) -> [PASS][93] +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk9/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [FAIL][94] ([i915#307]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][96] ([i915#2880]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][98] ([i915#180]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [FAIL][100] ([i915#49]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_properties@connector-properties-atomic:
    - shard-glk:          [DMESG-WARN][102] ([i915#118] / [i915#95]) -> [PASS][103] +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk2/igt@kms_properties@connector-properties-atomic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk3/igt@kms_properties@connector-properties-atomic.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][104] ([fdo#109441]) -> [PASS][105] +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/igt@kms_psr@psr2_sprite_render.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][106] ([i915#1542]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-glk1/igt@perf@polling-parameterized.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][108] ([i915#2849]) -> [FAIL][109] ([i915#2842])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][110] ([i915#2920]) -> [SKIP][111] ([i915#658]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][112] ([i915#658]) -> [SKIP][113] ([i915#2920]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl2/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][126], [FAIL][127]) ([i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][128], [FAIL][129], [FAIL][130]) ([i915#180] / [i915#3002] / [i915#3363])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2124]: https://gitlab.freedesktop.org/drm/intel/issues/2124
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2642]: https://gitlab.freedesktop.org/drm/intel/issues/2642
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2880]: https://gitlab.freedesktop.org/drm/intel/issues/2880
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#307]: https://gitlab.freedesktop.org/drm/intel/issues/307
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3324]: https://gitlab.freedesktop.org/drm/intel/issues/3324
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6080 -> IGTPW_5787
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/index.html

--===============5620249660708002371==
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
<tr><td><b>Series:</b></td><td>lib/i915/perf: Fix non-card0 processing (rev=
5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/89701/">https://patchwork.freedesktop.org/series/89701/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5787/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10051_full -&gt; IGTPW_5787_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5787_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5787_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5787=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_big_fb@linear-16bpp-rotate-0:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/sha=
rd-tglb1/igt@kms_big_fb@linear-16bpp-rotate-0.html">FAIL</a> +1 similar iss=
ue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5787_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-snb5/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/300=
2">i915#3002</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@v=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-snb5/igt@gem_ctx_persistence@clone.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
099">i915#1099</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10051/shard-glk5/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-glk=
5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-=
iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-=
glk7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/sha=
rd-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/sha=
rd-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/307">i915#307</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb8/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl4/igt@gem_userptr_blits@set-cache-level.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
324">i915#3324</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb5/igt@gen9_exec_parse@bb-oversize.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i=
915#2527</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb7/igt@gen9_exec_parse@bb-oversize.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i=
915#2527</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl3/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +166 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl8/igt@kms_chamelium@hdmi-edid-change-duri=
ng-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-iclb8/igt@kms_color@pipe-d-ctm-green-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@kms_color_chamelium@pipe-b-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb1/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-size-change:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-size-change.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5787/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-size-change.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2124">i915#21=
24</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x51=
2-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-glk3/igt@kms_cursor_crc@pipe-d-cursor-512x512=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a>) +26 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/426">i915#426</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pat=
tern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/426">i915#426</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl6/=
igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl7/igt@kms_flip@2x-busy-flip.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +58 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-iclb4/igt@kms_flip@2x-flip-vs-suspend.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-int=
erruptible@c-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5787/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2642">i915#2642</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-s=
hrfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5787/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-shrfb-draw-pwrite.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111825">fdo#111825</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-snb6/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +443 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-kbl6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb7/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-glk1/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-kbl2/igt@kms_psr2_sf@plane-move-sf-dmg-area-=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-iclb4/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-iclb8/igt@kms_vblank@pipe-d-ts-continuation-=
idle-hang.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-inactive:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb3/igt@nouveau_crc@pipe-c-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb8/igt@nouveau_crc@pipe-c-source-outp-inac=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5787/shard-snb5/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-snb5/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/698">i915#698</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5787/shard-apl2/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-tglb1/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-glk7/igt@sysfs_clients@fair-0.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-iclb4/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5787/shard-kbl6/igt@sysfs_clients@fair-0.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-tglb1/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2369">i915#2369</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#30=
63</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_578=
7/shard-tglb8/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
787/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +2 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5787/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/s=
hard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-kbl6/igt@gem_exec_fair@basic-sync@rcs0.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787=
/shard-kbl1/igt@gem_exec_fair@basic-sync@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-tg=
lb5/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk9/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/307">i915#307<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/s=
hard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/307">i915#307=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/=
shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-snb6/igt@i915_module_load@reload-with-fault-injection.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2880">i915#2880</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5787/shard-snb6/igt@i915_module_load@reload-with-fault-injec=
tion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-kbl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787=
/shard-kbl7/igt@i915_suspend@debugfs-reader.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk2/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/49">=
i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5787/shard-glk6/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@connector-properties-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk2/igt@kms_properties@connector-properties-atomic.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5787/shard-glk3/igt@kms_properties@connector-properties-atomic=
.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb8/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/s=
hard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-glk1/igt@perf@polling-parameterized.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shar=
d-glk2/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
787/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i9=
15#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5787/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-iclb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5787/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area=
-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10051/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-kbl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10051/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shar=
d-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5787/shard-kbl1/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5787/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5787/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-kbl3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2505">i915#2505</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3363">i915#3363</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10051/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10051/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3363">i915#3363</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5787/shard-apl8/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5787/shard-a=
pl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5787/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#30=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3363">i=
915#3363</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6080 -&gt; IGTPW_5787</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190</p>

</body>
</html>

--===============5620249660708002371==--

--===============1002165963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1002165963==--
