Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 06 Jan 2021 01:33:09 -0000
Message-ID: <160989678965.18711.9319029951876142616@emeril.freedesktop.org>
References: <20210105212606.3399854-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210105212606.3399854-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib=3A_Immediately_cancel_a_sp?=
 =?utf-8?q?inner_for_an_expired_timeout?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0615640729=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0615640729==
Content-Type: multipart/alternative;
 boundary="===============2042230383344313724=="

--===============2042230383344313724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib: Immediately cancel a spinner for an expired timeout
URL   : https://patchwork.freedesktop.org/series/85522/
State : success

== Summary ==

CI Bug Log - changes from IGT_5943_full -> IGTPW_5360_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/index.html

New tests
---------

  New tests have been introduced between IGT_5943_full and IGTPW_5360_full:

### New IGT tests (1) ###

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5360_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][1] -> [DMESG-WARN][2] ([i915#1602])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb5/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl6/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#2283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk3/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk4/igt@core_hotunplug@unbind-rebind.html
    - shard-hsw:          NOTRUN -> [DMESG-WARN][7] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [PASS][8] -> [DMESG-WARN][9] ([i915#2283])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [PASS][10] -> [DMESG-WARN][11] ([i915#2283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb6/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#1839])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#1839])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@feature_discovery@display-4x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#658])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-hang@rcs0:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#2410])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb4/igt@gem_ctx_persistence@engines-hang@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@gem_ctx_persistence@engines-hang@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-hsw:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#1099]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [PASS][18] -> [INCOMPLETE][19] ([i915#1037] / [i915#2870])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@gem_eio@in-flight-contexts-10ms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@kms:
    - shard-kbl:          [PASS][20] -> [DMESG-WARN][21] ([i915#165] / [i915#180] / [i915#78])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl3/igt@gem_eio@kms.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl2/igt@gem_eio@kms.html

  * igt@gem_exec_nop@basic-series:
    - shard-glk:          [PASS][22] -> [DMESG-WARN][23] ([i915#118] / [i915#95])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk1/igt@gem_exec_nop@basic-series.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk6/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-hsw:          NOTRUN -> [FAIL][24] ([i915#2389]) +3 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][26] ([fdo#109271]) +54 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_userptr_blits@process-exit-mmap@wc:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#1699]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@gem_userptr_blits@process-exit-mmap@wc.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#110426] / [i915#1704])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@gem_userptr_blits@readonly-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#110426] / [i915#1704])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_render_tiledx_blits:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109289])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@gen3_render_tiledx_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109289]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#112306])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@gen9_exec_parse@bb-chained.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#112306])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][34] -> [FAIL][35] ([i915#1860])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [PASS][36] -> [SKIP][37] ([i915#579])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([i915#579])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#2597])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb1/igt@kms_async_flips@test-time-stamp.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111614]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_chamelium@hdmi-audio.html
    - shard-apl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_chamelium@hdmi-audio.html
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-iclb:         NOTRUN -> [FAIL][47] ([i915#1149] / [i915#315])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@kms_color@pipe-a-ctm-0-75.html
    - shard-tglb:         NOTRUN -> [FAIL][48] ([i915#1149] / [i915#315])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_color@pipe-c-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][49] ([i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_color@pipe-c-degamma.html
    - shard-tglb:         NOTRUN -> [FAIL][50] ([i915#1149])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_color@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-hsw:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][55] ([i915#1319]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][56] ([i915#1319])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109300] / [fdo#111066])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb1/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111828]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109279])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109279]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271]) +53 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109274])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#2587])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2642])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#2642])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#2642])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +11 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          [PASS][69] -> [FAIL][70] ([i915#49])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#533]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#533])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][77] ([i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][78] ([i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][79] ([i915#265])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109441])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][81] -> [SKIP][82] ([fdo#109441]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - shard-kbl:          NOTRUN -> [FAIL][83] ([i915#331])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-glk:          NOTRUN -> [FAIL][84] ([i915#331])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
    - shard-apl:          NOTRUN -> [FAIL][85] ([i915#331])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271]) +33 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109502])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_vrr@flip-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109502])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2437])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#2530])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109291]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109291]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-hsw:          NOTRUN -> [SKIP][93] ([fdo#109271]) +225 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-flow@rcs0}:
    - shard-tglb:         [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-glk:          [FAIL][98] ([i915#2842]) -> [PASS][99] +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html

  * {igt@gem_exec_fair@basic-throttle@rcs0}:
    - shard-iclb:         [FAIL][100] ([i915#2849]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][102] ([i915#2389]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-tglb:         [DMESG-WARN][104] ([i915#2803]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [TIMEOUT][106] ([i915#2795]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb7/igt@gem_vm_create@destroy-race.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gem_vm_create@destroy-race.html

  * igt@i915_suspend@forcewake:
    - shard-iclb:         [DMESG-WARN][108] ([i915#1602]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb3/igt@i915_suspend@forcewake.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@i915_suspend@forcewake.html
    - shard-kbl:          [DMESG-WARN][110] ([i915#1602] / [i915#180]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl4/igt@i915_suspend@forcewake.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@i915_suspend@forcewake.html
    - shard-hsw:          [DMESG-WARN][112] ([i915#2637]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@i915_suspend@forcewake.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw4/igt@i915_suspend@forcewake.html
    - shard-glk:          [DMESG-WARN][114] ([i915#1602] / [i915#2635]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk2/igt@i915_suspend@forcewake.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@i915_suspend@forcewake.html
    - shard-apl:          [DMESG-WARN][116] ([i915#1602] / [i915#2635]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl7/igt@i915_suspend@forcewake.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@i915_suspend@forcewake.html
    - shard-tglb:         [DMESG-WARN][118] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@i915_suspend@forcewake.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@i915_suspend@forcewake.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][120] ([i915#180]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-glk:          [FAIL][122] ([i915#49]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][124] ([fdo#109441]) -> [PASS][125] +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@stress-open-close:
    - shard-glk:          [INCOMPLETE][126] -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk9/igt@perf@stress-open-close.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk5/igt@perf@stress-open-close.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][128] ([i915#2681] / [i915#2684]) -> [WARN][129] ([i915#1804] / [i915#2684])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][130] ([i915#2295] / [i915#2505]) -> ([FAIL][131], [FAIL][132]) ([i915#1436] / [i915#2283] / [i915#2295] / [i915#2505])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#2295] / [i915#2505] / [i915#483]) -> ([FAIL][136], [FAIL][137]) ([i915#2283] / [i915#2295] / [i915#2505] / [i915#483])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl7/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][138], [FAIL][139]) ([i915#2295] / [i915#2724]) -> ([FAIL][140], [FAIL][141]) ([i915#2283] / [i915#2295] / [i915#2724] / [i915#483])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][142], [FAIL][143]) ([i915#2295]) -> ([FAIL][144], [FAIL][145], [FAIL][146]) ([i915#1610] / [i915#2283] / [i915#2295] / [i915#2426])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][147], [FAIL][148]) ([i915#2295] / [k.org#202321]) -> ([FAIL][149], [FAIL][150]) ([i915#2283] / [i915#2295] / [k.org#202321])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk2/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk5/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk4/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][151], [FAIL][152], [FAIL][153]) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][154], [FAIL][155]) ([i915#1602] / [i915#2295] / [i915#2667])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb6/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb5/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedeskt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/index.html

--===============2042230383344313724==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib: Immediately cancel a spinner for an expired timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85522/">https://patchwork.freedesktop.org/series/85522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5943_full -&gt; IGTPW_5360_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5943_full and IGTPW_5360_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_spin_batch@legacy:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5360_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb5/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk3/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb6/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb4/igt@gem_ctx_persistence@engines-hang@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@gem_ctx_persistence@engines-hang@rcs0.html">FAIL</a> ([i915#2410])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@gem_eio@in-flight-contexts-10ms.html">INCOMPLETE</a> ([i915#1037] / [i915#2870])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl3/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl2/igt@gem_eio@kms.html">DMESG-WARN</a> ([i915#165] / [i915#180] / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_nop@basic-series:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk1/igt@gem_exec_nop@basic-series.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk6/igt@gem_exec_nop@basic-series.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@process-exit-mmap@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@gem_userptr_blits@process-exit-mmap@wc.html">SKIP</a> ([i915#1699]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledx_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@gen3_render_tiledx_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw4/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#1860])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb2/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_chamelium@hdmi-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_chamelium@hdmi-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_chamelium@hdmi-audio.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_color@pipe-c-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_color_chamelium@pipe-b-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb1/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-rapid-movement.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([fdo#111825]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +5 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> ([i915#331])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> ([i915#331])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_universal_plane@universal-plane-pipe-a-functional.html">FAIL</a> ([i915#331])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb3/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb8/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedeskt">fdo#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedeskt">fdo#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw6/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +225 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-flow@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-throttle@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb5/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb7/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb3/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb8/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl4/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1602] / [i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw4/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk2/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl7/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@i915_suspend@forcewake.html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb1/igt@i915_suspend@forcewake.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk9/igt@perf@stress-open-close.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk5/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-hsw6/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2505]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-hsw7/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i915#2283] / [i915#2295] / [i915#2505])</p>
</li>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2505] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [i915#2505] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-iclb3/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-apl7/igt@runner@aborted.html">FAIL</a>) ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-apl4/igt@runner@aborted.html">FAIL</a>) ([i915#1610] / [i915#2283] / [i915#2295] / [i915#2426])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-glk5/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-glk2/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5943/shard-tglb5/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5360/shard-tglb5/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2667])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============2042230383344313724==--

--===============0615640729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0615640729==--
