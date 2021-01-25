Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 25 Jan 2021 19:58:19 -0000
Message-ID: <161160469975.3419.12048937068801177421@emeril.freedesktop.org>
References: <20210125135514.23925-1-petri.latvala@intel.com>
In-Reply-To: <20210125135514.23925-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Fix_graceful_exit_result_parsing_for_dynamic_subtests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0960116157=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0960116157==
Content-Type: multipart/alternative;
 boundary="===============7359148319044626473=="

--===============7359148319044626473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runner: Fix graceful exit result parsing for dynamic subtests
URL   : https://patchwork.freedesktop.org/series/86258/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9680_full -> IGTPW_5429_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5429_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_create@create-massive}:
    - shard-hsw:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw4/igt@gem_create@create-massive.html

  
Known issues
------------

  Here are the changes found in IGTPW_5429_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][2] -> [INCOMPLETE][3] ([i915#794])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-hsw:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw2/igt@gem_ctx_persistence@engines-cleanup.html
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb5/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2846])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109283])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109283]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2389]) +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb6/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][20] ([i915#2389])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-snb:          NOTRUN -> [FAIL][21] ([i915#2389]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb7/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2389]) +3 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][23] ([i915#2389]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_reloc@basic-many-active@vcs0.html
    - shard-hsw:          NOTRUN -> [FAIL][24] ([i915#2389]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-tglb:         [PASS][25] -> [DMESG-WARN][26] ([i915#2803])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#768])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#1704]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#1704]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#112306])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#112306])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#1937])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#1937])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1937])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb8/igt@i915_suspend@fence-restore-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2705])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2705])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#2705])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#2705])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@kms_big_joiner@basic.html
    - shard-apl:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2705])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@kms_big_joiner@basic.html

  * igt@kms_color@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [FAIL][42] ([i915#1149] / [i915#315])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@kms_color@pipe-b-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [FAIL][43] ([i915#1149] / [i915#315])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@kms_color@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb7/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109279]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:
    - shard-apl:          [PASS][54] -> [FAIL][55] ([i915#54])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
    - shard-kbl:          [PASS][56] -> [FAIL][57] ([i915#54])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#533])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#533])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk3/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274]) +4 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][63] -> [FAIL][64] ([i915#2122])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2672])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#2587])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-apl:          [PASS][67] -> [FAIL][68] ([i915#49])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
    - shard-kbl:          [PASS][69] -> [FAIL][70] ([i915#49])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +18 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111825]) +18 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271]) +38 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +89 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#1187])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#1187])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#1839])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109289])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#109289])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278]) +10 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][83] ([fdo#108145] / [i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#658]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#658]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2920]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_sequence@get-forked:
    - shard-hsw:          [PASS][89] -> [INCOMPLETE][90] ([i915#2055])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw7/igt@kms_sequence@get-forked.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw7/igt@kms_sequence@get-forked.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271]) +50 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530]) +2 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([i915#2530]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@sysfs_heartbeat_interval@precise@rcs0:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271]) +73 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb2/igt@sysfs_heartbeat_interval@precise@rcs0.html

  * igt@sysfs_heartbeat_interval@precise@vcs0:
    - shard-hsw:          NOTRUN -> [SKIP][95] ([fdo#109271]) +112 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw8/igt@sysfs_heartbeat_interval@precise@vcs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109307])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@tools_test@sysfs_l3_parity.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109307])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][98] ([i915#2846]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-deadline.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][100] ([i915#2842]) -> [PASS][101] +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][102] ([i915#2842]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-glk:          [FAIL][104] ([i915#2842]) -> [PASS][105] +4 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][106] ([i915#2849]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - shard-iclb:         [DMESG-WARN][108] ([i915#2803]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vcs0.html
    - shard-kbl:          [DMESG-WARN][110] ([i915#1610] / [i915#2803]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][112] ([i915#118] / [i915#95]) -> [PASS][113] +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_whisper@basic-normal-all.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@gem_exec_whisper@basic-normal-all.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][114] ([i915#2880]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][116] ([i915#2880]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen:
    - shard-kbl:          [FAIL][118] ([i915#54]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][120] ([i915#79]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][122] ([i915#2598]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][124] ([i915#2055]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][126] ([fdo#109441]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@perf_pmu@rc6-suspend:
    - shard-kbl:          [INCOMPLETE][128] ([i915#155]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@perf_pmu@rc6-suspend.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@perf_pmu@rc6-suspend.html

  * {igt@sysfs_clients@pidname}:
    - shard-glk:          [FAIL][130] -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@sysfs_clients@pidname.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk8/igt@sysfs_clients@pidname.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][132] ([i915#588]) -> [SKIP][133] ([i915#658])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][134] ([i915#1804] / [i915#2684]) -> [WARN][135] ([i915#2681] / [i915#2684])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][136] ([i915#2684]) -> [WARN][137] ([i915#1804] / [i915#2684])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][138] ([i915#2920]) -> [SKIP][139] ([i915#658]) +4 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([i915#2295] / [i915#2426]) -> ([FAIL][144], [FAIL][145], [FAIL][146]) ([i915#2295])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#2295] / [i915#2426] / [i915#2724]) -> ([FAIL][151], [FAIL][152], [FAIL][153]) ([i915#2295] / [i915#2724])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@runner@aborted.html
   [148

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/index.html

--===============7359148319044626473==
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
<tr><td><b>Series:</b></td><td>runner: Fix graceful exit result parsing for dynamic subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/86258/">https://patchwork.freedesktop.org/series/86258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9680_full -&gt; IGTPW_5429_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5429_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_create@create-massive}:<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw4/igt@gem_create@create-massive.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5429_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INCOMPLETE</a> ([i915#794])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw2/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb5/igt@gem_ctx_persistence@engines-cleanup.html">SKIP</a> ([fdo#109271] / [i915#1099])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb3/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb8/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb6/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#2803])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb8/igt@i915_suspend@fence-restore-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb3/igt@i915_suspend@fence-restore-untiled.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-75:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@kms_color@pipe-b-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw4/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb7/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-onscreen.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-move.html">SKIP</a> ([fdo#111825]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> ([fdo#109271]) +38 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +89 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb5/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109278]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw7/igt@kms_sequence@get-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw7/igt@kms_sequence@get-forked.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +50 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@nouveau_crc@pipe-b-source-outp-complete.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb2/igt@sysfs_heartbeat_interval@precise@rcs0.html">SKIP</a> ([fdo#109271]) +73 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw8/igt@sysfs_heartbeat_interval@precise@vcs0.html">SKIP</a> ([fdo#109271]) +112 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb7/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([fdo#109307])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk8/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl7/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-256x256-offscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-hsw8/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-hsw7/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl1/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@sysfs_clients@pidname}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-glk4/igt@sysfs_clients@pidname.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-glk8/igt@sysfs_clients@pidname.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-kbl1/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5429/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#2295])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9680/shard-iclb3/igt@runner@aborted.html">FAIL</a>, [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#2295] / [i915#2426] / [i915#2724]) -&gt; ([FAIL][151], [FAIL][152], [FAIL][153]) ([i915#2295] / [i915#2724])</p>
</li>
</ul>
</li>
</ul>
<p>[148</p>

</body>
</html>

--===============7359148319044626473==--

--===============0960116157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0960116157==--
