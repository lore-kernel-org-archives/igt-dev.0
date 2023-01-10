Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2485107086033861222=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Tue, 10 Jan 2023 02:28:47 -0000
Message-ID: <167331772776.5202.7650412290353628729@emeril.freedesktop.org>
References: <20230107011127.39537-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230107011127.39537-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgRml4IFBN?=
 =?utf-8?q?U_freq_verification_with_SLPC_=28rev7=29?=
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

--===============2485107086033861222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix PMU freq verification with SLPC (rev7)
URL   : https://patchwork.freedesktop.org/series/111282/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12559_full -> IGTPW_8319_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html

Participating hosts (14 -> 10)
------------------------------

  Missing    (4): shard-rkl0 pig-kbl-iris pig-glk-j5005 pig-skl-6260u 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8319_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_pxp@hw-rejects-pxp-context:
    - {shard-dg1}:        [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-17/igt@gem_pxp@hw-rejects-pxp-context.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-17/igt@gem_pxp@hw-rejects-pxp-context.html

  * {igt@kms_chamelium_color@ctm-max}:
    - {shard-tglu-10}:    NOTRUN -> [SKIP][3] +8 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html

  * {igt@kms_chamelium_hpd@hdmi-hpd-storm-disable}:
    - {shard-tglu-9}:     NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * {igt@kms_chamelium_hpd@vga-hpd-fast}:
    - {shard-rkl}:        NOTRUN -> [SKIP][5] +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * {igt@kms_chamelium_hpd@vga-hpd-without-ddc}:
    - {shard-tglu}:       NOTRUN -> [SKIP][6] +15 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  
Known issues
------------

  Here are the changes found in IGTPW_8319_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-glk:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#4613])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@massive:
    - shard-apl:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#4613])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@gem_lmem_swapping@massive.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([i915#7708])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-glk:          NOTRUN -> [FAIL][11] ([i915#3318])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk2/igt@gem_userptr_blits@vma-merge.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rps@engine-order:
    - shard-apl:          [PASS][14] -> [FAIL][15] ([i915#6537])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl3/igt@i915_pm_rps@engine-order.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@i915_pm_rps@engine-order.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3886])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#3886]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [TIMEOUT][18] ([i915#7173])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#2346])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#2346])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#79])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271]) +30 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271]) +21 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#658])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@virtual-idle:
    - {shard-rkl}:        [FAIL][28] ([i915#7742]) -> [PASS][29] +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@drm_fdinfo@virtual-idle.html

  * igt@fbdev@pan:
    - {shard-rkl}:        [SKIP][30] ([i915#2582]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@fbdev@pan.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@fbdev@pan.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - {shard-rkl}:        [SKIP][32] ([i915#3281]) -> [PASS][33] +9 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - {shard-rkl}:        [SKIP][34] ([i915#6252]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-2/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_eio@suspend:
    - {shard-rkl}:        [FAIL][36] ([i915#7052]) -> [PASS][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@gem_eio@suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_eio@suspend.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][38] ([i915#2842]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][40] ([i915#2842]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - {shard-rkl}:        [FAIL][42] ([i915#2842]) -> [PASS][43] +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_reloc@basic-scanout@vcs0:
    - {shard-tglu}:       [SKIP][44] ([i915#3639]) -> [PASS][45] +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@gem_exec_reloc@basic-scanout@vcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-8/igt@gem_exec_reloc@basic-scanout@vcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - {shard-rkl}:        [FAIL][46] ([fdo#103375]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@gem_exec_suspend@basic-s3@smem.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-4/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gem_pwrite@basic-self:
    - {shard-rkl}:        [SKIP][48] ([i915#3282]) -> [PASS][49] +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@gem_pwrite@basic-self.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_pwrite@basic-self.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][50] ([i915#5566] / [i915#716]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk3/igt@gen9_exec_parse@allowed-single.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@valid-registers:
    - {shard-rkl}:        [SKIP][52] ([i915#2527]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@engine-engine-error@bcs0:
    - {shard-rkl}:        [SKIP][54] ([i915#6258]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_hangman@engine-engine-error@bcs0.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - {shard-rkl}:        [SKIP][56] ([i915#4098]) -> [PASS][57] +1 similar issue
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-rkl}:        [SKIP][58] ([i915#1397]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - {shard-dg1}:        [SKIP][60] ([i915#1397]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-14/igt@i915_pm_rpm@dpms-non-lpsp.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-15/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@pm-tiling:
    - {shard-rkl}:        [SKIP][62] ([fdo#109308]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - {shard-rkl}:        [SKIP][64] ([i915#1845] / [i915#4098]) -> [PASS][65] +22 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - {shard-dg1}:        [DMESG-WARN][66] -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-16/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-19/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-apl:          [FAIL][68] ([i915#2346]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
    - shard-glk:          [FAIL][70] ([i915#2346]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          [DMESG-WARN][72] ([i915#180]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - {shard-tglu}:       [SKIP][74] ([i915#1849]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - {shard-rkl}:        [SKIP][76] ([i915#1849] / [i915#4098]) -> [PASS][77] +13 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_properties@plane-properties-legacy:
    - {shard-rkl}:        [SKIP][78] ([i915#1849]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr@cursor_mmap_gtt:
    - {shard-rkl}:        [SKIP][80] ([i915#1072]) -> [PASS][81] +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@kms_psr@cursor_mmap_gtt.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html

  * igt@kms_universal_plane@universal-plane-pipe-b-functional:
    - {shard-rkl}:        [SKIP][82] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - {shard-tglu}:       [SKIP][84] ([i915#7651]) -> [PASS][85] +9 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - {shard-tglu}:       [SKIP][86] ([i915#1845] / [i915#7651]) -> [PASS][87] +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_vblank@pipe-b-wait-busy-hang.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-1/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@perf@gen12-mi-rpc:
    - {shard-rkl}:        [SKIP][88] ([fdo#109289]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@perf@gen12-mi-rpc.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-2/igt@perf@gen12-mi-rpc.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][90] ([i915#1722]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@perf@polling-small-buf.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@perf@polling-small-buf.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-dg1}:        [FAIL][92] ([i915#4349]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-19/igt@perf_pmu@idle@rcs0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-15/igt@perf_pmu@idle@rcs0.html

  
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
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7052]: https://gitlab.freedesktop.org/drm/intel/issues/7052
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7708]: https://gitlab.freedesktop.org/drm/intel/issues/7708
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7113 -> IGTPW_8319
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12559: b4a7d5ac8957c0b894b81d125b15b1ff45eaf5b2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html
  IGT_7113: 15562e123ee6ed88163c7da2ef330dfe9bbd16a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html

--===============2485107086033861222==
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
<tr><td><b>Series:</b></td><td>Fix PMU freq verification with SLPC (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/111282/">https://patchwork.freedesktop.org/series/111282/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12559_full -&gt; IGTPW_8319_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html</p>
<h2>Participating hosts (14 -&gt; 10)</h2>
<p>Missing    (4): shard-rkl0 pig-kbl-iris pig-glk-j5005 pig-skl-6260u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8319_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-17/igt@gem_pxp@hw-rejects-pxp-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-17/igt@gem_pxp@hw-rejects-pxp-context.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_color@ctm-max}:</p>
<ul>
<li>{shard-tglu-10}:    NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@hdmi-hpd-storm-disable}:</p>
<ul>
<li>{shard-tglu-9}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-fast}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_chamelium_hpd@vga-hpd-without-ddc}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> +15 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8319_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@gem_lmem_swapping@massive.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7708">i915#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl3/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@i915_pm_rps@engine-order.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl6/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk8/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl3/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-a-dp-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@virtual-idle:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@drm_fdinfo@virtual-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@drm_fdinfo@virtual-idle.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@fbdev@pan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-2/igt@gem_ctx_persistence@legacy-engines-hang@blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@gem_eio@suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7052">i915#7052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout@vcs0:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@gem_exec_reloc@basic-scanout@vcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3639">i915#3639</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-8/igt@gem_exec_reloc@basic-scanout@vcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@gem_exec_suspend@basic-s3@smem.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-4/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@gem_pwrite@basic-self.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gem_pwrite@basic-self.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk3/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk5/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@bcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_hangman@engine-engine-error@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6258">i915#6258</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_hangman@engine-engine-error@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-14/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-15/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-2/igt@i915_pm_rpm@pm-tiling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109308">fdo#109308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@i915_pm_rpm@pm-tiling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-16/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-19/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">PASS</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-3/igt@kms_psr@cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_psr@cursor_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-b-functional:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-1/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-b-functional.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-3/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy-hang:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-tglu-6/igt@kms_vblank@pipe-b-wait-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-tglu-1/igt@kms_vblank@pipe-b-wait-busy-hang.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-5/igt@perf@gen12-mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-2/igt@perf@gen12-mi-rpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-rkl-4/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-rkl-6/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12559/shard-dg1-19/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/shard-dg1-15/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7113 -&gt; IGTPW_8319</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12559: b4a7d5ac8957c0b894b81d125b15b1ff45eaf5b2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8319: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8319/index.html<br />
  IGT_7113: 15562e123ee6ed88163c7da2ef330dfe9bbd16a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2485107086033861222==--
