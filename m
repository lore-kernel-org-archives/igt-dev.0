Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9019291623220201649=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Sep 2021 16:45:24 -0000
Message-ID: <163181072444.8837.3699096407277225805@emeril.freedesktop.org>
References: <20210916132716.75963-1-stylon.wang@amd.com>
In-Reply-To: <20210916132716.75963-1-stylon.wang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?amdgpu=3A_Add_amd=5Flink=5Fsettings_test?=
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
To: Stylon Wang <stylon.wang@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============9019291623220201649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: Add amd_link_settings test
URL   : https://patchwork.freedesktop.org/series/94752/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10597_full -> IGTPW_6226_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/index.html

Known issues
------------

  Here are the changes found in IGTPW_6226_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1] ([i915#4130])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@device_reset@unbind-reset-rebind.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#658]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#180]) +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][5] ([i915#2369] / [i915#3063] / [i915#3648])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][10] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2842]) +4 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#2190])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_huc_copy@huc-copy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][15] ([fdo#109271]) +212 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109312])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109312])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#3297])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3297]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#3318])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#2856]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#110892]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#111644] / [i915#1397] / [i915#2411])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#2411] / [i915#456]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@i915_pm_rpm@system-suspend.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [PASS][28] -> [INCOMPLETE][29] ([i915#456]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@i915_suspend@debugfs-reader.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_atomic@plane-primary-legacy:
    - shard-iclb:         [PASS][30] -> [DMESG-WARN][31] ([i915#3728])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb1/igt@kms_atomic@plane-primary-legacy.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_atomic@plane-primary-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111614]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3777]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111615]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110723])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3689] / [i915#3886]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [i915#3886]) +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3689]) +12 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#3742])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3742])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278] / [i915#1149])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#3116])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3116])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109300] / [fdo#111066]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@kms_content_protection@legacy.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][51] ([i915#1319]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_content_protection@legacy.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111828]) +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][53] ([i915#2105])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279] / [i915#3359]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3319]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3359]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_dsc@xrgb8888-dsc-compression:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3828])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_dsc@xrgb8888-dsc-compression.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][61] ([i915#155] / [i915#180] / [i915#636])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111825] / [i915#3966])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274]) +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111825]) +33 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][65] ([i915#180]) +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([i915#3701])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#2587])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2672])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109280]) +22 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#1187])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_hdr@static-toggle.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#110577])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109310])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@kms_invalid_dotclock.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#1839])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([i915#265]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_cursor@pipe-d-primary-size-64:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278]) +23 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_plane_cursor@pipe-d-primary-size-64.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([i915#3536]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3536]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#2733])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2920]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#1911])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_psr2_su@page_flip.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109642] / [fdo#111068] / [i915#658])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][85] ([i915#132] / [i915#3467]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][86] -> [SKIP][87] ([fdo#109441]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109441]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109309])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2437]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2530]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109289]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109289]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@perf@unprivileged-single-ctx-counters.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109291]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109291]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@prime_udl.html

  * igt@prime_vgem@coherency-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#111656])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@prime_vgem@coherency-gtt.html
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109292])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109295]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-read-hang:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109295]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#2994]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994]) +3 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@fair-7:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#2994]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@sysfs_clients@fair-7.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][106] ([i915#2849]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-iclb:         [DMESG-WARN][108] ([i915#3728]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_atomic@atomic-invalid-params.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][110] ([i915#2828] / [i915#456]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][112] ([i915#180]) -> [PASS][113] +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][114] ([i915#433]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-b-primary-size-256:
    - shard-iclb:         [INCOMPLETE][116] -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb1/igt@kms_plane_cursor@pipe-b-primary-size-256.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_plane_cursor@pipe-b-primary-size-256.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][118] ([fdo#109441]) -> [PASS][119] +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][120] ([i915#2411]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][122] ([i915#3896]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][124] ([i915#588]) -> [SKIP][125] ([i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][126] ([i915#2684]) -> [WARN][127] ([i915#1804] / [i915#2684])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][128] ([i915#1804] / [i915#2684]) -> [WARN][129] ([i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-kbl:          [SKIP][130] ([fdo#109271]) -> [INCOMPLETE][131] ([i915#151])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][132] ([i915#658]) -> [SKIP][133] ([i915#2920])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
    - shard-iclb:         [SKIP][134] ([i915#2920]) -> [SKIP][135] ([i915#658]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155],

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/index.html

--===============9019291623220201649==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: Add amd_link_settings test</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/94752/">https://patchwork.freedesktop.org/series/94752/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10597_full -&gt; IGTPW_6226_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6226_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> ([i915#4130])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +212 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> ([i915#2411] / [i915#456]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> ([i915#456]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-legacy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb1/igt@kms_atomic@plane-primary-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_atomic@plane-primary-legacy.html">DMESG-WARN</a> ([i915#3728])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([i915#3689]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_color@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#109300] / [fdo#111066]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#111828]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-bo:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_cursor_legacy@pipe-d-single-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_dsc@xrgb8888-dsc-compression.html">SKIP</a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#111825] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-primary-size-64:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_plane_cursor@pipe-d-primary-size-64.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@kms_plane_lowres@pipe-b-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-y.html">SKIP</a> ([i915#3536]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl4/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([i915#1911])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl1/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb7/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@nouveau_crc@pipe-c-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb5/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@prime_nv_api@i915_nv_double_export.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@prime_udl.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb1/igt@prime_vgem@fence-read-hang.html">SKIP</a> ([fdo#109295]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb8/igt@sysfs_clients@busy.html">SKIP</a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl3/igt@sysfs_clients@fair-3.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@sysfs_clients@fair-7.html">SKIP</a> ([i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-invalid-params:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_atomic@atomic-invalid-params.html">DMESG-WARN</a> ([i915#3728]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_atomic@atomic-invalid-params.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">INCOMPLETE</a> ([i915#2828] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-b-primary-size-256:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb1/igt@kms_plane_cursor@pipe-b-primary-size-256.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_plane_cursor@pipe-b-primary-size-256.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html">SKIP</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-dpms-rpm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#3896]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-tglb7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-kbl1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-kbl6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">INCOMPLETE</a> ([i915#151])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10597/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6226/shard-iclb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          ([FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -&gt; ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155],</li>
</ul>
</li>
</ul>

</body>
</html>

--===============9019291623220201649==--
