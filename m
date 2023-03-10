Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5115802672176736139=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: pallavi.mishra@intel.com
Date: Fri, 10 Mar 2023 19:05:21 -0000
Message-ID: <167847512170.7685.6825993044165014815@emeril.freedesktop.org>
References: <20230224200941.9867-1-pallavi.mishra@intel.com>
In-Reply-To: <20230224200941.9867-1-pallavi.mishra@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5B1/2=2Ci-g-t=5D_i915/sysfs=5Fheartbeat=5Finter?=
 =?utf-8?q?val=3A_Update_test_to_work_with_GuC_submission?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============5115802672176736139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2,i-g-t] i915/sysfs_heartbeat_interval: Update test to work with GuC submission
URL   : https://patchwork.freedesktop.org/series/114842/
State : success

== Summary ==

CI Bug Log - changes from IGT_7185_full -> IGTPW_8576_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8576_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-1/igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - {shard-tglu}:       [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-3/igt@kms_cursor_legacy@torture-move@pipe-b.html

  
Known issues
------------

  Here are the changes found in IGTPW_8576_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-9:       NOTRUN -> [SKIP][4] ([i915#7701])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@device_reset@cold-reset-bound.html

  * igt@drm_mm@all-tests:
    - shard-tglu-9:       NOTRUN -> [SKIP][5] ([i915#6433])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@drm_mm@all-tests.html

  * igt@feature_discovery@display-4x:
    - shard-tglu-10:      NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglu-10:      NOTRUN -> [SKIP][7] ([fdo#109314])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglu-9:       NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-9:       NOTRUN -> [SKIP][11] ([i915#2190])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu-10:      NOTRUN -> [SKIP][12] ([i915#4613])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_pread@exhaustion:
    - shard-tglu-9:       NOTRUN -> [WARN][13] ([i915#2658])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu-10:      NOTRUN -> [SKIP][14] ([i915#4270]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglu-10:      NOTRUN -> [SKIP][15] ([i915#3297]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-9:       NOTRUN -> [SKIP][16] ([i915#3297]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-tglu-9:       NOTRUN -> [SKIP][17] ([fdo#109289])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-tglu-9:       NOTRUN -> [SKIP][18] ([i915#2527] / [i915#2856])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-10:      NOTRUN -> [SKIP][19] ([i915#2527] / [i915#2856]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_hwmon@hwmon-read:
    - shard-tglu-10:      NOTRUN -> [SKIP][20] ([i915#7707])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_hwmon@hwmon-read.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-apl:          NOTRUN -> [FAIL][21] ([i915#7036])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu-10:      NOTRUN -> [SKIP][22] ([fdo#111644] / [i915#1397])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu-9:       NOTRUN -> [SKIP][23] ([fdo#109506])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu-9:       NOTRUN -> [SKIP][24] ([i915#4387])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@hwconfig_table:
    - shard-tglu-9:       NOTRUN -> [SKIP][25] ([i915#6245])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_query@hwconfig_table.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglu-10:      NOTRUN -> [SKIP][26] ([fdo#109303])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu-9:       NOTRUN -> [SKIP][27] ([i915#3826])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-tglu-10:      NOTRUN -> [SKIP][28] ([i915#5286]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-tglu-10:      NOTRUN -> [SKIP][29] ([fdo#111614]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-tglu-9:       NOTRUN -> [SKIP][30] ([fdo#111615] / [i915#1845] / [i915#7651]) +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][31] ([fdo#111615]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#3886])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][33] ([i915#3689] / [i915#6095]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#3886]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][35] ([fdo#111615] / [i915#3689]) +4 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][36] ([i915#3689] / [i915#3886]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu-10:      NOTRUN -> [SKIP][37] ([i915#3689]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
    - shard-tglu-10:      NOTRUN -> [SKIP][38] ([i915#6095])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-tglu-10:      NOTRUN -> [SKIP][39] ([fdo#111827])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-tglu-9:       NOTRUN -> [SKIP][40] ([fdo#111827])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-tglu-9:       NOTRUN -> [SKIP][41] ([i915#7828]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-tglu-10:      NOTRUN -> [SKIP][42] ([i915#7828]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_color@ctm-0-75:
    - shard-tglu-9:       NOTRUN -> [SKIP][43] ([i915#3546])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-tglu-10:      NOTRUN -> [SKIP][44] ([fdo#109274]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-tglu-9:       NOTRUN -> [SKIP][45] ([i915#1845]) +12 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [PASS][46] -> [FAIL][47] ([i915#2346])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-tglu-10:      NOTRUN -> [SKIP][48] ([fdo#109274] / [i915#3637]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-tglu-9:       NOTRUN -> [SKIP][49] ([fdo#109274] / [i915#3637]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [PASS][50] -> [FAIL][51] ([i915#79])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#79]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-tglu-9:       NOTRUN -> [SKIP][54] ([i915#3637]) +6 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-tglu-10:      NOTRUN -> [SKIP][55] ([i915#2587] / [i915#2672])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#7810])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-tglu-9:       NOTRUN -> [SKIP][58] ([i915#1849]) +26 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglu-10:      NOTRUN -> [SKIP][59] ([fdo#109280]) +13 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271]) +39 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-tglu-10:      NOTRUN -> [SKIP][61] ([fdo#110189]) +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          [PASS][62] -> [ABORT][63] ([i915#180])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglu-10:      NOTRUN -> [SKIP][64] ([fdo#109289]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5:
    - shard-tglu-9:       NOTRUN -> [SKIP][65] ([i915#3555]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu-10:      NOTRUN -> [SKIP][66] ([i915#5235]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-tglu-9:       NOTRUN -> [SKIP][67] ([i915#3555] / [i915#6953])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu-9:       NOTRUN -> [SKIP][68] ([i915#6524])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-tglu-10:      NOTRUN -> [SKIP][69] ([i915#658]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr2_dpms:
    - shard-tglu-9:       NOTRUN -> [SKIP][70] ([fdo#110189]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_psr@psr2_dpms.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][71] ([i915#5289])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-tglu-10:      NOTRUN -> [SKIP][72] ([i915#3555]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-tglu-9:       NOTRUN -> [SKIP][73] ([i915#1845] / [i915#7651]) +40 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-tglu-9:       NOTRUN -> [SKIP][74] ([i915#2437])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-10:      NOTRUN -> [SKIP][75] ([i915#2437])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@prime_vgem@basic-userptr:
    - shard-tglu-9:       NOTRUN -> [SKIP][76] ([fdo#109295] / [i915#3301])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@prime_vgem@basic-userptr.html

  * igt@v3d/v3d_create_bo@create-bo-0:
    - shard-tglu-10:      NOTRUN -> [SKIP][77] ([fdo#109315] / [i915#2575])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@v3d/v3d_create_bo@create-bo-0.html

  * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
    - shard-tglu-9:       NOTRUN -> [SKIP][78] ([fdo#109315] / [i915#2575]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html

  * igt@vc4/vc4_perfmon@create-perfmon-exceed:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271]) +14 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html

  * igt@vc4/vc4_perfmon@get-values-invalid-pointer:
    - shard-tglu-10:      NOTRUN -> [SKIP][80] ([i915#2575]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html

  * igt@vc4/vc4_purgeable_bo@mark-purgeable:
    - shard-tglu-9:       NOTRUN -> [SKIP][81] ([i915#2575]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@vc4/vc4_purgeable_bo@mark-purgeable.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-read:
    - {shard-rkl}:        [SKIP][82] ([i915#2582]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@fbdev@unaligned-read.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@fbdev@unaligned-read.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-tglu}:       [FAIL][84] ([i915#6268]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - {shard-rkl}:        [SKIP][86] ([i915#6252]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][88] ([fdo#103375]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][90] ([i915#5784]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-dg1-16/igt@gem_eio@reset-stress.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-dg1-13/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][92] ([i915#2846]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][94] ([i915#2842]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][96] ([i915#2842]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - {shard-tglu}:       [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - {shard-rkl}:        [SKIP][100] ([i915#3281]) -> [PASS][101] +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][102] ([i915#7276]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_partial_pwrite_pread@reads:
    - {shard-rkl}:        [SKIP][104] ([i915#3282]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][106] ([i915#2527]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][108] ([i915#4281]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-rkl}:        [SKIP][110] ([i915#1397]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@fences:
    - {shard-rkl}:        [SKIP][112] ([i915#1849]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@i915_pm_rpm@fences.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@i915_pm_rpm@fences.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - {shard-rkl}:        [SKIP][114] ([i915#1845] / [i915#4098]) -> [PASS][115] +22 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - {shard-tglu}:       [SKIP][116] ([i915#1845]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][118] ([i915#2346]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [FAIL][120] ([i915#2346]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - {shard-tglu}:       [SKIP][122] ([i915#1845] / [i915#7651]) -> [PASS][123] +12 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - {shard-rkl}:        [SKIP][124] ([i915#3955]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - {shard-tglu}:       [SKIP][126] ([i915#1849]) -> [PASS][127] +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][128] ([i915#1849] / [i915#4098]) -> [PASS][129] +12 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - {shard-tglu}:       [SKIP][130] ([i915#1849] / [i915#3558]) -> [PASS][131] +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_psr@sprite_mmap_cpu:
    - {shard-rkl}:        [SKIP][132] ([i915#1072]) -> [PASS][133] +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@kms_psr@sprite_mmap_cpu.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:
    - {shard-rkl}:        [SKIP][134] ([i915#4070] / [i915#4098]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:
    - {shard-tglu}:       [SKIP][136] ([fdo#109274]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html

  * igt@perf@stress-open-close:
    - shard-glk:          [ABORT][138] ([i915#5213]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk1/igt@perf@stress-open-close.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk3/igt@perf@stress-open-close.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7810]: https://gitlab.freedesktop.org/drm/intel/issues/7810
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8151]: https://gitlab.freedesktop.org/drm/intel/issues/8151
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8234]: https://gitlab.freedesktop.org/drm/intel/issues/8234
  [i915#8273]: https://gitlab.freedesktop.org/drm/intel/issues/8273


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7185 -> IGTPW_8576

  CI-20190529: 20190529
  CI_DRM_12827: b794b8d84dc0470ee58467386f41870e81a86580 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html
  IGT_7185: 6707461ddb214bb8a75c5fcf2747941c9d9b11ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html

--===============5115802672176736139==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2,i-g-t] i915/sysfs_heartbeat_interval: Update test to work with GuC submission</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/114842/">https://patchwork.freedesktop.org/series/114842/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7185_full -&gt; IGTPW_8576_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8576_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-1/igt@kms_cursor_crc@cursor-suspend@pipe-c-hdmi-a-1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-3/igt@kms_cursor_legacy@torture-move@pipe-b.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8576_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7701">i915#7701</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_mm@all-tests:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@drm_mm@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_pread@exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gem_userptr_blits@access-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6245">i915#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk5/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7810">i915#7810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl1/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@prime_vgem@basic-userptr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3301">i915#3301</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_create_bo@create-bo-0:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@v3d/v3d_create_bo@create-bo-0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-invalid-perfmon:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk6/igt@vc4/vc4_perfmon@create-perfmon-exceed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@get-values-invalid-pointer:</p>
<ul>
<li>shard-tglu-10:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-10/igt@vc4/vc4_perfmon@get-values-invalid-pointer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-purgeable:</p>
<ul>
<li>shard-tglu-9:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-9/igt@vc4/vc4_purgeable_bo@mark-purgeable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@fbdev@unaligned-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-dg1-16/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-dg1-13/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-2/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gem_partial_pwrite_pread@reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-3/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@i915_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@i915_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-8/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-apl2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3558">i915#3558</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-4/igt@kms_psr@sprite_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_psr@sprite_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-rkl-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-tglu-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-tglu-1/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7185/shard-glk1/igt@perf@stress-open-close.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/shard-glk3/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7185 -&gt; IGTPW_8576</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12827: b794b8d84dc0470ee58467386f41870e81a86580 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8576: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8576/index.html<br />
  IGT_7185: 6707461ddb214bb8a75c5fcf2747941c9d9b11ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============5115802672176736139==--
