Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7897324913679440015=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vikas Srivastava" <vikas.srivastava@intel.com>
Date: Thu, 10 Nov 2022 16:33:53 -0000
Message-ID: <166809803354.16956.13124921108822860487@emeril.freedesktop.org>
References: <20221110053713.892216-1-vikas.srivastava@intel.com>
In-Reply-To: <20221110053713.892216-1-vikas.srivastava@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fexec=5Ffence=3A_Replacing_custom_spinner_with_igt=5F?=
 =?utf-8?q?spin?=
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

--===============7897324913679440015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/gem_exec_fence: Replacing custom spinner with igt_spin
URL   : https://patchwork.freedesktop.org/series/110735/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12364_full -> IGTPW_8079_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8079_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@atomic:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-dg1-12/igt@kms_content_protection@atomic.html

  * igt@kms_invalid_mode@int-max-clock:
    - {shard-rkl}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-3/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - {shard-dg1}:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-dg1-12/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-dg1-18/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_8079_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-snb:          [PASS][5] -> [DMESG-WARN][6] ([i915#5507])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-snb6/igt@device_reset@unbind-reset-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-snb4/igt@device_reset@unbind-reset-rebind.html
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#5507])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl3/igt@device_reset@unbind-reset-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl7/igt@device_reset@unbind-reset-rebind.html
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#5507])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk7/igt@device_reset@unbind-reset-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk1/igt@device_reset@unbind-reset-rebind.html
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#5507])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb1/igt@device_reset@unbind-reset-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb1/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][13] ([i915#4991])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-snb4/igt@gem_create@create-massive.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#280])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_schedule@preempt-user:
    - shard-snb:          NOTRUN -> [SKIP][20] ([fdo#109271]) +19 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-snb7/igt@gem_exec_schedule@preempt-user.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl1/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [INCOMPLETE][22] ([i915#7248])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#3297])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.html

  * igt@i915_module_load@resize-bar:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#6412])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@i915_module_load@resize-bar.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#6412])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb8/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#4281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#5286])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#5286])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#5138])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3886]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109278]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3689] / [i915#6095])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#3689] / [i915#3886])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#3886])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [i915#3886])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#3689]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb2/igt@kms_chamelium@dp-hpd-fast.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk1/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html
    - shard-snb:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-snb6/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl3/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#109274] / [fdo#111825])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109274])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#6375])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2587] / [i915#2672]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#2672]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#2672] / [i915#3555])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109280])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109280] / [fdo#111825])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271]) +8 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +65 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#112054] / [i915#5288])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3536]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#7037])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#658])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk2/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109642] / [fdo#111068] / [i915#658])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#658]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@kms_psr2_su@page_flip-xrgb8888.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-keep-cache:
    - {shard-rkl}:        [SKIP][63] ([i915#3281]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][65] ([i915#2842]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][67] ([i915#2842]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-tglb:         [FAIL][69] ([i915#2842]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fence@basic-wait@bcs0:
    - shard-apl:          [SKIP][71] ([fdo#109271]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl3/igt@gem_exec_fence@basic-wait@bcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl2/igt@gem_exec_fence@basic-wait@bcs0.html
    - shard-glk:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk7/igt@gem_exec_fence@basic-wait@bcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk5/igt@gem_exec_fence@basic-wait@bcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][75] ([i915#2190]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_wc@set-cache-level:
    - {shard-rkl}:        [SKIP][77] ([i915#1850]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@gem_mmap_wc@set-cache-level.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@gem_mmap_wc@set-cache-level.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - {shard-rkl}:        [SKIP][79] ([i915#3282]) -> [PASS][80] +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [DMESG-WARN][81] ([i915#5566] / [i915#716]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gen9_exec_parse@allowed-single.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - {shard-rkl}:        [SKIP][83] ([i915#2527]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@gen9_exec_parse@basic-rejected.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_backlight@fade_with_suspend:
    - {shard-rkl}:        [SKIP][85] ([i915#3012]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-5/igt@i915_pm_backlight@fade_with_suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@i915_pm_backlight@fade_with_suspend.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - {shard-rkl}:        [SKIP][87] ([fdo#109308]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@i915_pm_rpm@drm-resources-equal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][89] ([i915#180]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:
    - shard-apl:          [FAIL][91] ([i915#2521]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:
    - shard-iclb:         [FAIL][93] ([i915#2521]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - {shard-rkl}:        [SKIP][95] ([i915#1845] / [i915#4098]) -> [PASS][96] +17 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][97] ([i915#118] / [i915#5138]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - {shard-rkl}:        [SKIP][99] ([i915#1849] / [i915#4098]) -> [PASS][100] +9 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:
    - {shard-dg1}:        [INCOMPLETE][101] ([i915#7266]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-dg1-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-dg1-18/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][103] ([i915#5235]) -> [PASS][104] +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@cursor_render:
    - {shard-rkl}:        [SKIP][105] ([i915#1072]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-4/igt@kms_psr@cursor_render.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_psr@cursor_render.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - {shard-rkl}:        [SKIP][109] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][111] ([i915#1722]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-rkl-1/igt@perf@polling-small-buf.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - {shard-dg1}:        [FAIL][113] ([i915#5234]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][115] ([i915#6117]) -> [SKIP][116] ([i915#4525])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          [INCOMPLETE][117] ([i915#7248]) -> [WARN][118] ([i915#2658])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@gem_pread@exhaustion.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-tglb:         [INCOMPLETE][119] ([i915#7248]) -> [WARN][120] ([i915#2658])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-tglb5/igt@gem_pread@exhaustion.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          [INCOMPLETE][121] ([i915#7248]) -> [WARN][122] ([i915#2658])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-glk3/igt@gem_pread@exhaustion.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-glk3/igt@gem_pread@exhaustion.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][123] ([i915#658]) -> [SKIP][124] ([i915#588])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][125] ([i915#2920]) -> [SKIP][126] ([i915#658])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][127] ([i915#2920]) -> [SKIP][128] ([fdo#111068] / [i915#658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136]) ([i915#180] / [i915#3002] / [i915#4312])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl7/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl7/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5507]: https://gitlab.freedesktop.org/drm/intel/issues/5507
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
  [i915#7266]: https://gitlab.freedesktop.org/drm/intel/issues/7266


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7050 -> IGTPW_8079
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12364: e8bcb44a50317c067823a983fa2badde97e41fdd @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8079: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/index.html
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/index.html

--===============7897324913679440015==
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
<tr><td><b>Series:</b></td><td>tests/i915/gem_exec_fence: Replacing custom =
spinner with igt_spin</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110735/">https://patchwork.freedesktop.org/series/110735/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8079/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12364_full -&gt; IGTPW_8079_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8079=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-dg1-12/igt@kms_content_protection@atomic.htm=
l">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-rkl-3/igt@kms_invalid_mode@int-max-clock.htm=
l">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-dg1-12/igt@kms_vblank@pipe-b-ts-continuation-modeset-ha=
ng.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8079/shard-dg1-18/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang=
.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8079_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-snb6/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard=
-snb4/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-apl3/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard=
-apl7/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-glk7/igt@device_reset@unbind-reset-rebind.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard=
-glk1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-iclb1/igt@device_reset@unbind-reset-rebind.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shar=
d-iclb1/igt@device_reset@unbind-reset-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5507">i915#5507</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-snb4/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/=
shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@gem_exec_balancer@parallel-context=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/s=
hard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-snb7/igt@gem_exec_schedule@preempt-user.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl1/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl7/igt@gem_pwrite@basic-exhaustion.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7=
248">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb5/igt@gem_userptr_blits@readonly-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb5/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb8/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@=
i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/4281">i915#4281</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk3/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shar=
d-glk6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl7/igt@kms_ccs@pipe-a-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb8/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tile=
d_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_ccs@pipe-b-bad-aux-stride-y_til=
ed_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb2/igt@kms_chamelium@dp-hpd-fast.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-glk1/igt@kms_chamelium@dp-hpd-fast.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-snb6/igt@kms_chamelium@hdmi-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl3/igt@kms_chamelium@vga-hpd-fast.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb5/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs=
-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl3/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-=
apl8/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6375">i915#6375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-glk6/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl1/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-tglb2/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7037">i9=
15#7037</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-glk2/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-iclb6/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">f=
do#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-apl6/igt@kms_psr2_su@page_flip-xrgb8888.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@api_intel_bb@object-reloc-keep-cache.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i9=
15#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_8079/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html">PASS</a> =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
079/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
079/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8079/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@basic-wait@bcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-apl3/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079=
/shard-apl2/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar is=
sue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-glk7/igt@gem_exec_fence@basic-wait@bcs0.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079=
/shard-glk5/igt@gem_exec_fence@basic-wait@bcs0.html">PASS</a> +1 similar is=
sue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-tg=
lb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@set-cache-level:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@gem_mmap_wc@set-cache-level.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1850">i915#1850</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/sh=
ard-rkl-6/igt@gem_mmap_wc@set-cache-level.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads-u=
ncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8079/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-afte=
r-reads-uncached.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl6/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8079/shard-apl6/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@gen9_exec_parse@basic-rejected.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079=
/shard-rkl-5/igt@gen9_exec_parse@basic-rejected.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-5/igt@i915_pm_backlight@fade_with_suspend.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i91=
5#3012</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8079/shard-rkl-6/igt@i915_pm_backlight@fade_with_suspend.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#10=
9308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
079/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_8079/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-apl2/igt@kms_async_flips@alternate-sync-async-flip@pipe=
-b-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8079/shard-apl3/igt@kms_async_flips@alternate-sync-async-=
flip@pipe-b-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb6/igt@kms_async_flips@alternate-sync-async-flip@pip=
e-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2521">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8079/shard-iclb2/igt@kms_async_flips@alternate-sync-asy=
nc-flip@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#=
1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098"=
>i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8079/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> =
+17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-=
180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5138">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8079/shard-glk8/igt@kms_big_fb@x-tiled-max-hw-strid=
e-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbc-1p-offscren-pri-shrfb-draw-pwrite.html">PASS</a> +9 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-dg1-12/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-h=
dmi-a-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/7266">i915#7266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8079/shard-dg1-18/igt@kms_pipe_crc_basic@suspend-re=
ad-crc@pipe-d-hdmi-a-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_8079/shard-iclb6/igt@kms_plane_scaling@planes-downs=
cale-factor-0-5@pipe-a-edp-1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_render:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-4/igt@kms_psr@cursor_render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-rk=
l-6/igt@kms_psr@cursor_render.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079=
/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
5">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8079/shard-rkl-6/igt@kms_universal_plane@cursor-fb-leak-=
pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-rkl-1/igt@perf@polling-small-buf.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-r=
kl-5/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-dg1-18/igt@perf_pmu@all-busy-idle-check-all.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#=
5234</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
079/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_8079/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-apl6/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard=
-apl6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-tglb5/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shar=
d-tglb2/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12364/shard-glk3/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard=
-glk3/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2658">i915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/=
shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_8079/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12364/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_8079/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12364/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12364/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12364/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/sha=
rd-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8079/shard-apl2/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/shard-apl8=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7050 -&gt; IGTPW_8079</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12364: e8bcb44a50317c067823a983fa2badde97e41fdd @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8079: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8079/index.htm=
l<br />
  IGT_7050: 42839a7c2bab78bc6cda8c949d8545606f377735 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============7897324913679440015==--
