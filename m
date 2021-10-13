Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6179305548453644451=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 13 Oct 2021 17:08:32 -0000
Message-ID: <163414491289.10252.12961784359514300877@emeril.freedesktop.org>
References: <20211013105744.2869089-1-jigar.bhatt@intel.com>
In-Reply-To: <20211013105744.2869089-1-jigar.bhatt@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/i915=5Fpm=5Fdc=3A_Fix_condition_in_dc9-test_=28rev5=29?=
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
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6179305548453644451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/i915_pm_dc: Fix condition in dc9-test (rev5)
URL   : https://patchwork.freedesktop.org/series/95610/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10731_full -> IGTPW_6314_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/index.html

Known issues
------------

  Here are the changes found in IGTPW_6314_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][1] ([i915#3002]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +5 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-snb5/igt@gem_ctx_persistence@engines-mixed-process.html

  * igt@gem_eio@hibernate:
    - shard-glk:          NOTRUN -> [DMESG-WARN][3] ([i915#1610])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk5/igt@gem_eio@hibernate.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][4] -> [TIMEOUT][5] ([i915#2369] / [i915#3063] / [i915#3648])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][6] -> [FAIL][7] ([i915#2842]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][8] -> [FAIL][9] ([i915#2842]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271]) +437 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-snb5/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk5/igt@gem_exec_whisper@basic-contexts-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk4/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#4270]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4270])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#768])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb6/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#3297]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][19] ([i915#3002])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl8/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#109289])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109289])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb1/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2856]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([i915#4281])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][27] ([i915#2681])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271]) +231 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#2411] / [i915#456])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_suspend@sysfs-reader:
    - shard-tglb:         [PASS][31] -> [INCOMPLETE][32] ([i915#456]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-tglb6/igt@i915_suspend@sysfs-reader.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110725] / [fdo#111614])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#3777]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111615]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3689] / [i915#3886]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3886]) +10 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3886]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278] / [i915#3886])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3886]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk9/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][43] ([fdo#109271]) +70 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk9/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl6/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl1/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#1149])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk3/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3319])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#3444])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#180]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279] / [i915#3359]) +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +81 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
    - shard-tglb:         [PASS][59] -> [INCOMPLETE][60] ([i915#2411] / [i915#4211])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][61] -> [DMESG-WARN][62] ([i915#180]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#2672]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109280]) +7 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111825]) +12 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#1187])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb3/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#1187])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][69] ([fdo#108145] / [i915#265]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][70] ([i915#265]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][71] ([fdo#108145] / [i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2920])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk1/igt@kms_psr2_su@frontbuffer.html
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#1911])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_psr2_su@frontbuffer.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109642] / [fdo#111068] / [i915#658])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
    - shard-kbl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb3/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-b-wait-idle-hang:
    - shard-apl:          [PASS][81] -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl7/igt@kms_vblank@pipe-b-wait-idle-hang.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl7/igt@kms_vblank@pipe-b-wait-idle-hang.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#533]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#533]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109502])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2437])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl3/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2437])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk6/igt@kms_writeback@writeback-fb-id.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl8/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@sema-50:
    - shard-glk:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#2994])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk1/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][90] ([i915#658]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb4/igt@feature_discovery@psr2.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +5 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          [FAIL][94] ([i915#2842]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][98] ([i915#794]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][100] ([i915#2122]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk8/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][102] ([i915#180]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][104] ([fdo#109441]) -> [PASS][105] +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [FAIL][106] ([i915#2842]) -> [FAIL][107] ([i915#2851])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][108] ([i915#658]) -> [SKIP][109] ([i915#2920]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][110] ([i915#2920]) -> [SKIP][111] ([i915#658]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][112], [FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3363] / [i915#602]) -> ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl1/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl3/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl1/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl7/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl7/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl1/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([i915#180] / [i915#3363]) -> ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl3/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl8/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl8/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl1/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl3/igt@runner@aborted.html
    - shard-glk:          ([FAIL][131], [FAIL][132], [FAIL][133]) ([i915#2426] / [i915#3002] / [i915#3363] / [k.org#202321]) -> ([FAIL][134], [FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2426] / [i915#3002] / [i915#3363] / [k.org#202321])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk1/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk5/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk5/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk3/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk7/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2842]: https://gitlab.freed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/index.html

--===============6179305548453644451==
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
<tr><td><b>Series:</b></td><td>tests/i915/i915_pm_dc: Fix condition in dc9-=
test (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/95610/">https://patchwork.freedesktop.org/series/95610/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6314/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10731_full -&gt; IGTPW_6314_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6314_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-snb5/igt@gem_ctx_persistence@engines-mixed-p=
rocess.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1099">i915#1099</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk5/igt@gem_eio@hibernate.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#=
1610</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb7/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2369">i915#2369</a> / [i915#3063] / [i915#3648=
])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-=
tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freed">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/sh=
ard-glk8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freed">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-snb5/igt@gem_exec_schedule@semaphore-codepen=
dency.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +437 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk5/igt@gem_exec_whisper@basic-contexts-all.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/s=
hard-glk4/igt@gem_exec_whisper@basic-contexts-all.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> ([i915#4270])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb6/igt@gem_render_copy@yf-tiled-to-vebox-=
yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl8/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@gem_userptr_blits@readonly-unsync.=
html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb1/igt@gen3_render_linear_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gen3_render_linear_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb1/igt@gen9_exec_parse@batch-without-end.=
html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb3/igt@=
i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb5/igt@i915_pm_rc6_residency@rc6-fence.ht=
ml">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
81">i915#2681</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +231 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/s=
hard-tglb7/igt@i915_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>=
 / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-tglb6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-tglb=
7/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#456]) +2 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3777]) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886]) +10 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_ccs@pipe-b-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk9/igt@kms_ccs@pipe-c-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#3886]) +5 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_ccs@pipe-d-bad-rotation-90-yf_=
tiled_ccs.html">SKIP</a> ([i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk9/igt@kms_ccs@pipe-d-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +70 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-kbl6/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl1/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_color@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk3/igt@kms_color_chamelium@pipe-d-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-onscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6314/shard-glk7/igt@kms_cursor_crc@pipe-b-cursor-alpha-opaque.html">FAIL</a=
> ([i915#3444])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/=
shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-max-s=
ize-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-suspend=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a>) +81 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10731/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/=
shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411<=
/a> / [i915#4211])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6314/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl8/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb3/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb5/igt@kms_hdr@static-toggle-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1187">i9=
15#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk4/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-glk1/igt@kms_psr2_su@frontbuffer.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-tglb2/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#=
1911</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#=
109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1110=
68">fdo#111068</a> / [i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-kbl1/igt@kms_psr2_su@frontbuffer.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard=
-iclb3/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-idle-hang:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-apl7/igt@kms_vblank@pipe-b-wait-idle-hang.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shar=
d-apl7/igt@kms_vblank@pipe-b-wait-idle-hang.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-apl2/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-glk3/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb6/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#1095=
02</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl3/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk6/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-apl8/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2994]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-glk1/igt@sysfs_clients@sema-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb4/igt@feature_discovery@psr2.html">SKIP</a> ([i915#=
658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/=
shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6314/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PAS=
S</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-kbl2/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> (=
<a href=3D"https://gitlab.freed">i915#2842</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl2/igt@gem_exec_fair@basi=
c-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freed">i915#2842</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk8/igt@gem_exec_fair=
@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>INCOMPLETE</a> ([i915#794]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_6314/shard-kbl3/igt@i915_suspend@fence-restore-tiled2unti=
led.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@=
ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk8/igt@kms_flip@2x-plain-flip-ts-=
check-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6314/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-d=
p1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_63=
14/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freed">i915#2842</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-iclb8/igt@gem_exec_fa=
ir@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2851])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6314/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</=
a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
1.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6314/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10731/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10731/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-kbl7/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1814">i915#1814</a> / [i915#3363] / [i915#602]) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6314/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl1/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6314/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-kbl3/igt@runner@aborted.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436"=
>i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1814">i915#1814</a> / [i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10731/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-apl8/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a> / [i915#3363]) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6314/shard-apl8/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6314/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-apl3/igt@ru=
nner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#3002] / [i915#3363])<=
/p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10731/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10731/shard-glk1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10731/shard-glk4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2426">i915#2426</a> / [i915#3002]=
 / [i915#3363] / [k.org#202321]) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6314/shard-glk5/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk5/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6314/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6314/shard-glk7/igt@runn=
er@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2426">i915#2426</a> / [i915#3002] / [i915#3363] / [k.org#=
202321])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6179305548453644451==--
