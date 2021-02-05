Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 05 Feb 2021 18:48:54 -0000
Message-ID: <161255093487.1861.3942125130193362337@emeril.freedesktop.org>
References: <20210205090743.8464-1-ramalingam.c@intel.com>
In-Reply-To: <20210205090743.8464-1-ramalingam.c@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fmodule=5Fload=3A_obj_size_based_on_the_engine_count?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1760755605=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1760755605==
Content-Type: multipart/alternative;
 boundary="===============3664520226904507355=="

--===============3664520226904507355==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_module_load: obj size based on the engine count
URL   : https://patchwork.freedesktop.org/series/86748/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9736_full -> IGTPW_5484_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/index.html

Known issues
------------

  Here are the changes found in IGTPW_5484_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][3] -> [FAIL][4] ([i915#2846])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
    - shard-apl:          NOTRUN -> [FAIL][5] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][7] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][11] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2849])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][18] ([i915#2389]) +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-iclb:         [PASS][19] -> [DMESG-WARN][20] ([i915#2803])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb5/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#2803])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#3002])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][24] ([i915#2502] / [i915#2667])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([i915#2795])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb2/igt@gem_vm_create@destroy-race.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb2/igt@gem_vm_create@destroy-race.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109289])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb3/igt@gen7_exec_parse@batch-without-end.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb3/igt@gen7_exec_parse@batch-without-end.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1937])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#1937])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1937])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111644] / [i915#1397] / [i915#2411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110892])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109506] / [i915#2411])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271]) +75 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#1769])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#1769])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111615]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-snb6/igt@kms_chamelium@dp-crc-single.html
    - shard-hsw:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw1/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk1/igt@kms_chamelium@dp-mode-timings.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb3/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][44] ([i915#1149] / [i915#315])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][45] ([i915#1149] / [i915#315]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-legacy-gamma-reset:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#2964])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl1/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html
    - shard-kbl:          [PASS][48] -> [FAIL][49] ([i915#2964])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl6/igt@kms_color@pipe-b-legacy-gamma-reset.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl2/igt@kms_color@pipe-b-legacy-gamma-reset.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111828])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb3/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#54])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#54])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][57] ([i915#180])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#54])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109279]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][63] -> [FAIL][64] ([i915#2598])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +32 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-hsw:          NOTRUN -> [SKIP][67] ([fdo#109271]) +24 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +22 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#533]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][70] -> [DMESG-WARN][71] ([i915#180])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][74] ([fdo#108145] / [i915#265])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271]) +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb.html
    - shard-hsw:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#533]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw6/igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#658]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#658])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2920]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271]) +28 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-snb5/igt@kms_psr@sprite_plane_onoff.html
    - shard-hsw:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#1072])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw1/igt@kms_psr@sprite_plane_onoff.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109309])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [PASS][89] -> [FAIL][90] ([i915#1542])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk1/igt@perf@polling-parameterized.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@nv_self_import_to_different_fd:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb3/igt@prime_nv_api@nv_self_import_to_different_fd.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109291])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb1/igt@prime_nv_api@nv_self_import_to_different_fd.html

  * igt@sysfs_clients@recycle:
    - shard-hsw:          [PASS][93] -> [FAIL][94] ([i915#3028])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-hsw4/igt@sysfs_clients@recycle.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw1/igt@sysfs_clients@recycle.html
    - shard-apl:          [PASS][95] -> [FAIL][96] ([i915#3028])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl6/igt@sysfs_clients@recycle.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@sema-10@rcs0:
    - shard-kbl:          [PASS][97] -> [SKIP][98] ([fdo#109271] / [i915#3026])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl2/igt@sysfs_clients@sema-10@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@sysfs_clients@sema-10@rcs0.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#3026])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl6/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [SKIP][100] ([fdo#109271]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][102] ([i915#2842]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_schedule@u-fairslice-all:
    - shard-tglb:         [DMESG-WARN][106] ([i915#2803]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-tglb6/igt@gem_exec_schedule@u-fairslice-all.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@gem_exec_schedule@u-fairslice-all.html

  * igt@i915_selftest@live@hangcheck:
    - shard-hsw:          [INCOMPLETE][108] ([i915#2782]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-hsw4/igt@i915_selftest@live@hangcheck.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111] +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_color@pipe-c-legacy-gamma-reset:
    - shard-kbl:          [FAIL][112] ([i915#2964]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-apl:          [FAIL][114] ([i915#2964]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-glk:          [FAIL][116] ([i915#2964]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk7/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk7/igt@kms_color@pipe-c-legacy-gamma-reset.html
    - shard-hsw:          [FAIL][118] ([i915#2964]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-hsw2/igt@kms_color@pipe-c-legacy-gamma-reset.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw1/igt@kms_color@pipe-c-legacy-gamma-reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [FAIL][120] ([i915#54]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [FAIL][122] ([i915#54]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:
    - shard-kbl:          [DMESG-WARN][124] ([i915#165] / [i915#180]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][126] ([i915#2055]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][128] ([i915#180]) -> [PASS][129] +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][130] ([fdo#109441]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb3/igt@kms_psr@psr2_dpms.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * {igt@sysfs_clients@recycle-many}:
    - shard-glk:          [FAIL][132] ([i915#3028]) -> [PASS][133] +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-glk3/igt@sysfs_clients@recycle-many.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/igt@sysfs_clients@recycle-many.html
    - shard-hsw:          [FAIL][134] ([i915#3028]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-hsw6/igt@sysfs_clients@recycle-many.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-10@vcs0:
    - shard-apl:          [SKIP][136] ([fdo#109271] / [i915#3026]) -> [PASS][137] +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-apl3/igt@sysfs_clients@sema-10@vcs0.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl8/igt@sysfs_clients@sema-10@vcs0.html

  * igt@testdisplay:
    - shard-kbl:          [DMESG-WARN][138] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl2/igt@testdisplay.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl3/igt@testdisplay.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][140] ([i915#2684]) -> [WARN][141] ([i915#1804] / [i915#2684])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][142] ([i915#2684]) -> [WARN][143] ([i915#2681] / [i915#2684])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][144] ([i915#2920]) -> [SKIP][145] ([i915#658]) +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-iclb:         [SKIP][146] ([i915#658]) -> [SKIP][147] ([i915#2920]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151]) ([i915#1814] / [i915#2295] / [i915#2505] / [i915#3002]) -> ([FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155], [FAIL][156]) ([i915#1436] / [i915#2295] / [i915#2505] / [i915#3002])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl3/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl3/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl4/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl3/igt@r

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/index.html

--===============3664520226904507355==
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
<tr><td><b>Series:</b></td><td>tests/i915_module_load: obj size based on th=
e engine count</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/86748/">https://patchwork.freedesktop.org/series/86748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5484/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9736_full -&gt; IGTPW_5484_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5484_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484=
/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a>=
 ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl7=
/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-apl6/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb1/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-glk6/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb5/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/s=
hard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#28=
42])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">=
FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-tglb2/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tg=
lb7/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard=
-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1=
 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shar=
d-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl7/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-iclb5/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/sha=
rd-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915=
#2803])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/sha=
rd-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915=
#2803])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@gem_userptr_blits@vma-merge.html">=
INCOMPLETE</a> ([i915#2502] / [i915#2667])</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-tglb2/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-tglb=
2/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb3/igt@gen7_exec_parse@batch-without-end.h=
tml">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb3/igt@gen7_exec_parse@batch-without-end.h=
tml">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-apl8/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi=
-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl1/igt@i915_pm_rpm@modeset-lpsp-stress.htm=
l">SKIP</a> ([fdo#109271]) +75 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb5/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0=
.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-snb6/igt@kms_chamelium@dp-crc-single.html">SK=
IP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-hsw1/igt@kms_chamelium@dp-crc-single.html">SK=
IP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-glk1/igt@kms_chamelium@dp-mode-timings.html">=
SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb3/igt@kms_chamelium@dp-mode-timings.html"=
>SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@kms_chamelium@vga-frame-dump.html"=
>SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html">FAI=
L</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html">FAI=
L</a> ([i915#1149] / [i915#315]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-apl1/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/sha=
rd-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-kbl6/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/sha=
rd-kbl2/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl4/igt@kms_color_chamelium@pipe-c-ctm-max.=
html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb3/igt@kms_content_protection@atomic.html=
">SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5484/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL<=
/a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5484/shard-apl2/igt@kms_cursor_crc@pipe-b-cursor-128x42-sliding.html">FAIL<=
/a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-suspen=
d.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/s=
hard-glk3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">FAIL</a> ([i915#54=
])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-offscreen.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipa=
-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-iclb8/igt@kms_flip@2x-flip-vs-dpms.html">SKI=
P</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_548=
4/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i=
915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-kbl3/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +32 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-cur-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +4 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-hsw2/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109271]) +24 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-spr-indfb-onoff.html">SKIP</a> ([fdo#111825]) +22 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sani=
tycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5484/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-=
WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-glk3/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-constan=
t-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-glk3/igt@kms_plane_alpha_blend@pipe-d-alpha-o=
paque-fb.html">SKIP</a> ([fdo#109271]) +8 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-hsw6/igt@kms_plane_alpha_blend@pipe-d-alpha-o=
paque-fb.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-alpha-=
opaque-fb.html">SKIP</a> ([fdo#109278])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-glk1/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-5.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb8/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-=
iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441]) +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-snb5/igt@kms_psr@sprite_plane_onoff.html">SKI=
P</a> ([fdo#109271]) +28 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-hsw1/igt@kms_psr@sprite_plane_onoff.html">SKI=
P</a> ([fdo#109271] / [i915#1072])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-tglb6/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> ([fdo#109309])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-glk1/igt@perf@polling-parameterized.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-glk3/=
igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-tglb3/igt@prime_nv_api@nv_self_import_to_diff=
erent_fd.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb1/igt@prime_nv_api@nv_self_import_to_diff=
erent_fd.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-hsw4/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw1/igt@sy=
sfs_clients@recycle.html">FAIL</a> ([i915#3028])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-apl6/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-apl2/igt@sy=
sfs_clients@recycle.html">FAIL</a> ([i915#3028])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-kbl2/igt@sysfs_clients@sema-10@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/=
igt@sysfs_clients@sema-10@rcs0.html">SKIP</a> ([fdo#109271] / [i915#3026])<=
/li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-apl6/igt@sysfs_clients@split-10@bcs0.html">S=
KIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP<=
/a> ([fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5484/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5484/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS<=
/a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</=
a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a=
></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-tglb6/igt@gem_exec_schedule@u-fairslice-all.html">DMESG-=
WARN</a> ([i915#2803]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5484/shard-tglb6/igt@gem_exec_schedule@u-fairslice-all.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-hsw4/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</=
a> ([i915#2782]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-hsw8/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-kbl3/igt@i915_suspend@fence-restore-untiled.html">DMESG-=
WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5484/shard-kbl4/igt@i915_suspend@fence-restore-untiled.html">PAS=
S</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</=
a> ([i915#2964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-kbl4/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a=
></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-apl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</=
a> ([i915#2964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-apl2/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a=
></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-glk7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</=
a> ([i915#2964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-glk7/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a=
></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-hsw2/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</=
a> ([i915#2964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5484/shard-hsw1/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</a=
></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">FAIL<=
/a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5484/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a=
></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">FAIL<=
/a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5484/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a=
></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-kbl2/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html=
">DMESG-WARN</a> ([i915#165] / [i915#180]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl2/igt@kms_cursor_edge_walk@pi=
pe-c-64x64-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vg=
a1-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-hsw4/igt@kms_flip@2x-flip-vs-=
suspend-interruptible@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5484/shard-apl2/igt@kms_flip@flip-vs-suspend-interrupt=
ible@a-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb3/igt@kms_psr@psr2_dpms.html">SKIP</a> ([fdo#109441]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shar=
d-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@recycle-many}:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-glk3/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915=
#3028]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_548=
4/shard-glk3/igt@sysfs_clients@recycle-many.html">PASS</a> +1 similar issue=
</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9736/shard-hsw6/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i915=
#3028]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_548=
4/shard-hsw6/igt@sysfs_clients@recycle-many.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-apl3/igt@sysfs_clients@sema-10@vcs0.html">SKIP</a> ([fdo=
#109271] / [i915#3026]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5484/shard-apl8/igt@sysfs_clients@sema-10@vcs0.html">PASS</a> =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-kbl2/igt@testdisplay.html">DMESG-WARN</a> ([i915#165] / =
[i915#180] / [i915#78]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5484/shard-kbl3/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5484/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i=
915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5484/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i91=
5#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5484/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-1.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9736/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKI=
P</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5484/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKI=
P</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_9736/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_9736/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9736/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2505] / [i915#3002]) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl=
6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5484/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5484/shard-kbl6/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5484/shard-kbl3/igt@r">FAIL</a>, [FAIL][156]) ([i915#1436] / [=
i915#2295] / [i915#2505] / [i915#3002])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3664520226904507355==--

--===============1760755605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1760755605==--
