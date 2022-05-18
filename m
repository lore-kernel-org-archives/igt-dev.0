Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4909872774666219537=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Wed, 18 May 2022 16:57:07 -0000
Message-ID: <165289302784.21388.14512920657873862731@emeril.freedesktop.org>
References: <20220518115505.207813-1-jouni.hogander@intel.com>
In-Reply-To: <20220518115505.207813-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_selective_fetch_area_calculation_=28rev2=29?=
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

--===============4909872774666219537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for selective fetch area calculation (rev2)
URL   : https://patchwork.freedesktop.org/series/103661/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11673_full -> IGTPW_7129_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7129_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7129_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7129_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk8/igt@gem_eio@in-flight-contexts-immediate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk7/igt@gem_eio@in-flight-contexts-immediate.html

  * {igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf} (NEW):
    - {shard-dg1}:        NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * {igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - {shard-tglu}:       NOTRUN -> [SKIP][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglu-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11673_full and IGTPW_7129_full:

### New IGT tests (5) ###

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - Statuses : 9 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7129_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][8] ([i915#4991])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][9] ([i915#4991])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl6/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][10] ([i915#4991])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][13] ([i915#2846])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][14] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-snb:          [PASS][24] -> [SKIP][25] ([fdo#109271])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109283] / [i915#4877])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_exec_params@no-vebox.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#4613]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@gem_lmem_swapping@verify.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl1/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#4270]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4270])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271]) +179 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#768]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#3297]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3297]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2856]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@gen9_exec_parse@allowed-all.html
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#2527] / [i915#2856]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#5566] / [i915#716])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@gen9_exec_parse@allowed-single.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271]) +179 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb2/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#4281])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#1902])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@i915_pm_lpsp@screens-disabled.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([i915#1902])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@i915_pm_lpsp@screens-disabled.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#5286]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#5286]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-180:
    - shard-glk:          [PASS][52] -> [DMESG-FAIL][53] ([i915#118] / [i915#1888])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#111614]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#110723])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111615]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3689]) +7 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#3886]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#3886]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +9 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#3689] / [i915#3886]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [i915#3886]) +6 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111615] / [i915#3689]) +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3742])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk7/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_chamelium@dp-hpd-with-enabled-mode.html
    - shard-snb:          NOTRUN -> [SKIP][67] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb7/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#3116])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3116] / [i915#3299])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#3359]) +7 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3319]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109279] / [i915#3359]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278]) +30 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x64-random.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#4103])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][81] -> [FAIL][82] ([i915#2346])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][83] -> [FAIL][84] ([i915#2346] / [i915#533])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#533]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dsc@xrgb8888-dsc-compression:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3828])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_dsc@xrgb8888-dsc-compression.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#3828])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_dsc@xrgb8888-dsc-compression.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109274]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109274] / [fdo#111825]) +8 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][91] -> [DMESG-WARN][92] ([i915#180]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2587])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-iclb:         [PASS][94] -> [SKIP][95] ([i915#3701])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-glk:          [PASS][96] -> [FAIL][97] ([i915#1888] / [i915#2546])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109280] / [fdo#111825]) +30 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109280]) +21 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-tglb:         [PASS][100] -> [INCOMPLETE][101] ([i915#1982])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#433])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#3555]) +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_hdr@static-toggle.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#1839]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109289]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109289]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#533])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][108] ([fdo#108145] / [i915#265]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-glk:          NOTRUN -> [FAIL][109] ([fdo#108145] / [i915#265])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][110] ([fdo#108145] / [i915#265])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#3536]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-y.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#3536])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([fdo#111615] / [fdo#112054])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([i915#5176]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#5176]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#5235]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale:
    - shard-glk:          NOTRUN -> [SKIP][117] ([fdo#109271]) +68 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#5235]) +3 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#1911]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109642] / [fdo#111068] / [i915#658])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#658]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_psr2_su@page_flip-p010.html
    - shard-glk:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#658])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk2/igt@kms_psr2_su@page_flip-p010.html
    - shard-iclb:         NOTRUN -> [FAIL][123] ([i915#5939])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
    - shard-apl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#658])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-tglb:         NOTRUN -> [FAIL][125] ([i915#132] / [i915#3467]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][126] -> [SKIP][127] ([fdo#109441])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#109441]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][129] ([fdo#111615] / [i915#5289])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#5030]) +3 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#109309])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109309])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#3555]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-glk:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#2437])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html
    - shard-apl:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#2437])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][136] ([fdo#109271]) +88 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([i915#2530]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-complete.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([i915#2530]) +3 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#109291]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test1_micro:
    - shard-tglb:         NOTRUN -> [SKIP][140] ([fdo#109291]) +5 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@prime_nv_pcopy@test1_micro.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][141] ([i915#5098])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl8/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][142] ([i915#5098])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][143] ([i915#5098])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][144] ([i915#5098])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][145] ([i915#5098])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][146] ([i915#5098])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb5/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@sysfs_clients@sema-10:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([i915#2994]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@sysfs_clients@sema-10.html
    - shard-apl:          NOTRUN -> [SKIP][148] ([fdo#109271] / [i915#2994])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl4/igt@sysfs_clients@sema-10.html
    - shard-glk:          NOTRUN -> [SKIP][149] ([fdo#109271] / [i915#2994])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk9/igt@sysfs_clients@sema-10.html
    - shard-iclb:         NOTRUN -> [SKIP][150] ([i915#2994])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@sysfs_clients@sema-10.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#2994]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - {shard-rkl}:        [SKIP][152] ([i915#2582]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@fbdev@write.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@fbdev@write.html

  * igt@feature_discovery@psr2:
    - {shard-rkl}:        [SKIP][154] ([i915#658]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@feature_discovery@psr2.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@feature_discovery@psr2.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [SKIP][156] ([i915#4525]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][158] ([i915#2842]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [FAIL][160] ([i915#2842]) -> [PASS][161] +1 similar issue
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-snb:          [SKIP][162] ([fdo#109271]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-snb6/igt@gem_exec_flush@basic-uc-pro-default.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-snb7/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][164] ([i915#5566] / [i915#716]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][166] ([i915#454]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@cursor:
    - {shard-rkl}:        [SKIP][168] ([i915#1849]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@i915_pm_rpm@cursor.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@i915_pm_rpm@cursor.html

  * igt@kms_atomic@atomic_plane_damage:
    - {shard-rkl}:        [SKIP][170] ([i915#4098]) -> [PASS][171] +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-1/igt@kms_atomic@atomic_plane_damage.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][172] ([i915#1845] / [i915#4098]) -> [PASS][173] +29 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_color@pipe-b-gamma:
    - {shard-rkl}:        [SKIP][174] ([i915#1149] / [i915#4070] / [i915#4098]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@kms_color@pipe-b-gamma.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_color@pipe-b-gamma.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:
    - {shard-dg1}:        [SKIP][176] ([i915#1836]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-dg1-12/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-16/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - {shard-rkl}:        [SKIP][178] ([fdo#112022] / [i915#4070]) -> [PASS][179] +7 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:
    - {shard-rkl}:        [SKIP][180] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][181] +2 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:
    - {shard-rkl}:        [SKIP][182] ([i915#4070] / [i915#4098]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-iclb:         [FAIL][184] ([i915#5072]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic:
    - {shard-dg1}:        [FAIL][186] -> [PASS][187] +3 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-dg1-12/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - {shard-rkl}:        [SKIP][188] ([fdo#111825] / [i915#4070]) -> [PASS][189] +5 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:
    - {shard-rkl}:        [SKIP][190] ([i915#4098] / [i915#4369]) -> [PASS][191] +4 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:
    - {shard-rkl}:        [SKIP][192] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][193] +3 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][194] ([i915#2122]) -> [PASS][195] +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk9/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          [FAIL][196] ([i915#79]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][198] ([i915#180]) -> [PASS][199] +2 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-glk:          [FAIL][200] ([i915#4911]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - {shard-dg1}:        [SKIP][202] ([i915#5721]) -> [PASS][203] +2 similar issues
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][204] ([i915#1849] / [i915#4098]) -> [PASS][205] +22 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@bad-htotal:
    - {shard-rkl}:        [SKIP][206] ([i915#4278]) -> [PASS][207] +1 similar issue
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_plane@plane-panning-top-left@pipe-b-planes:
    - {shard-rkl}:        [SKIP][208] ([i915#1849] / [i915#3558]) -> [PASS][209] +1 similar issue
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pipe-b-planes.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - {shard-rkl}:        [SKIP][210] ([i915#3558] / [i915#4070]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-y:
    - {shard-rkl}:        [SKIP][212] ([i915#1849] / [i915#3558] / [i915#4070]) -> [PASS][213] +1 similar issue
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.html

  * igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier:
    - {shard-dg1}:        [SKIP][214] -> [PASS][215] +3 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-dg1-12/igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-15/igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [SKIP][216] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@primary_mmap_gtt:
    - {shard-rkl}:        [SKIP][218] ([i915#1072]) -> [PASS][219] +1 similar issue
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-rkl-2/igt@kms_psr@primary_mmap_gtt.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_psr@primary_mmap_gtt.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-glk:          [FAIL][220] ([i915#1888] / [i915#65]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-glk3/igt@kms_rotation_crc@sprite-rotation-180.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk5/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - {shard-dg1}:        [FAIL][222] ([i915#4241]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-dg1-12/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-16/igt@kms_vblank@pipe-c-wait-forked-busy.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][224] ([i915#4525]) -> [DMESG-WARN][225] ([i915#5614])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [DMESG-WARN][226] ([i915#5614]) -> [SKIP][227] ([i915#4525]) +1 similar issue
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][228] ([i915#2852]) -> [FAIL][229] ([i915#2842])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][230] ([i915#2920]) -> [SKIP][231] ([i915#658])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl2/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl6/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl4/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl4/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl7/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl1/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl6/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl8/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl4/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl1/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4886]: https://gitlab.freedesktop.org/drm/intel/issues/4886
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6011]: https://gitlab.freedesktop.org/drm/intel/issues/6011
  [i915#6029]: https://gitlab.freedesktop.org/drm/intel/issues/6029
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6479 -> IGTPW_7129
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11673: 487728f8fae298d04767aa6cf8afea7a41b3e40b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7129: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/index.html
  IGT_6479: 78115aa8c8bcfc7784c7fc8dcaefcc2bce970b99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/index.html

--===============4909872774666219537==
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
<tr><td><b>Series:</b></td><td>Testcases for selective fetch area calculati=
on (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103661/">https://patchwork.freedesktop.org/series/103661/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7129/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11673_full -&gt; IGTPW_7129_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7129_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7129_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7129=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk8/igt@gem_eio@in-flight-contexts-immediate.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/=
shard-glk7/igt@gem_eio@in-flight-contexts-immediate.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf} (NEW):</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-con=
tinuous-exceed-fully-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf} (NEW):</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-fully-sf.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-rkl-1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> +3 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglu-6/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area-big-fb.html">SKIP</a> +3 similar issues</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11673_full and IGTPW_7129_=
full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 9 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7129_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl6/igt@gem_create@create-massive.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991=
">i915#4991</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">=
i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11673/shard-iclb8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/sh=
ard-iclb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11673/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/sha=
rd-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11673/shard-kbl4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-kb=
l1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11673/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-gl=
k7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/sh=
ard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb8/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/48=
77">i915#4877</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_lmem_swapping@parallel-random-ve=
rify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl1/igt@gem_lmem_swapping@parallel-random-ve=
rify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-glk3/igt@gem_lmem_swapping@parallel-random-v=
erify-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@gem_lmem_swapping@verify.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i91=
5#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb6/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@gem_pxp@create-regular-buffer.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4270=
">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +179 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@gem_render_copy@yf-tiled-mc-ccs-to=
-vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/768">i915#768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb7/igt@gem_userptr_blits@access-control.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@gem_userptr_blits@create-destroy-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb4/igt@gen9_exec_parse@allowed-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb1/igt@gen9_exec_parse@allowed-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i=
915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
856">i915#2856</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-apl8/igt@gen9_exec_parse@allowed-single.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-=
apl3/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-snb2/igt@gen9_exec_parse@batch-invalid-lengt=
h.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +179 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#428=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb8/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb3/igt@i915_pm_lpsp@screens-disabled.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902"=
>i915#1902</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk8/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/s=
hard-glk1/igt@kms_big_fb@x-tiled-16bpp-rotate-180.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_big_fb@y-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl8/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-kbl4/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk7/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-snb7/igt@kms_chamelium@dp-hpd-with-enabled-mo=
de.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb8/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3299">i915#3299</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3319">i915#3319</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3359">i915#3359</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x64-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x64=
-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109278">fdo#109278</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-fli=
p-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7129/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl1/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@xrgb8888-dsc-compression:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb1/igt@kms_dsc@xrgb8888-dsc-compression.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
28">i915#3828</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_dsc@xrgb8888-dsc-compression.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/38=
28">i915#3828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@kms_flip@2x-flip-vs-dpms.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fd=
o#109274</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_flip@2x-flip-vs-suspend-interr=
uptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111825">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-=
apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_flip_scaled_crc@flip-32b=
pp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb=
-pgflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7129/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscr=
n-shrfb-pgflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +30 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-sh=
rfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129=
/shard-tglb7/igt@kms_frontbuffer_tracking@psr-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">=
i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_hdr@static-toggle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3=
555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_multipipe_modeset@basic-max-pi=
pe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1839">i915#1839</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-glk4/igt@kms_pipe_crc_basic@disable-crc-afte=
r-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk8/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-b=
asic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb6/igt@kms_plane_lowres@pipe-c-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_plane_lowres@pipe-c-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
36">i915#3536</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_plane_lowres@pipe-c-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-c-edp-1-d=
ownscale-with-modifier:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_plane_scaling@downscale-with-m=
odifier-factor-0-25@pipe-c-edp-1-downscale-with-modifier.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-d=
ownscale-with-modifier:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_plane_scaling@downscale-with-m=
odifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb1/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-=
hdmi-a-2-planes-upscale-downscale:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-glk5/igt@kms_plane_scaling@planes-unity-scal=
ing-downscale-factor-0-25@pipe-b-hdmi-a-2-planes-upscale-downscale.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a>) +68 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i9=
15#1911</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">f=
do#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl7/igt@kms_psr2_su@page_flip-p010.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk2/igt@kms_psr2_su@page_flip-p010.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i9=
15#5939</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl8/igt@kms_psr2_su@page_flip-p010.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@kms_psr@psr2_primary_blt.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915=
#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467"=
>i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard=
-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb4/igt@kms_psr@psr2_suspend.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb8/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb5/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb2/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk3/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl4/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a>) +88 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_micro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-tglb6/igt@prime_nv_pcopy@test1_micro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl8/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb2/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk6/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-kbl6/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb8/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-snb5/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-10:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-tglb3/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-apl4/igt@sysfs_clients@sema-10.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-glk9/igt@sysfs_clients@sema-10.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-iclb8/igt@sysfs_clients@sema-10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7129/shard-kbl7/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@fbdev@write.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@fb=
dev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@feature_discovery@psr2.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl=
-6/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb3/igt@gem_exec_balancer@parallel-balancer.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7129/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/=
shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
129/shard-kbl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-snb6/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7129/shard-snb7/igt@gem_exec_flush@basic-uc-pro-default.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk6/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7129/shard-glk5/igt@gen9_exec_parse@allowed-single.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-iclb=
6/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6=
/igt@i915_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-1/igt@kms_atomic@atomic_plane_damage.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#409=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129=
/shard-rkl-6/igt@kms_atomic@atomic_plane_damage.html">PASS</a> +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen1=
2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_ccs@pipe-b-ccs-on-anot=
her-bo-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-gamma:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@kms_color@pipe-b-gamma.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915=
#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7129/shard-rkl-6/igt@kms_color@pipe-b-gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-dg1-12/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1836">i915#1836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7129/shard-dg1-16/igt@kms_cursor_crc@pipe-b-cursor-64x21-onscreen=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112022">f=
do#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">P=
ASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-128x128-top-edge.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-128x=
128-top-edge.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@kms_cursor_edge_walk@pipe-b-256x256-left-edge=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-b-256x256-l=
eft-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072"=
>i915#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7129/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-dg1-12/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.ht=
ml">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7129/shard-dg1-17/igt@kms_cursor_legacy@cursora-vs-flipa-atomic.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825=
">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7129/shard-rkl-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.h=
tml">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-ytil=
ed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_draw_crc@draw-method-rgb565-mma=
p-cpu-ytiled.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb2101010-render-u=
ntiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_draw_crc@draw-metho=
d-xrgb2101010-render-untiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk9/igt@kms_flip@2x-plain-flip-=
fb-recreate-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7129/shard-glk8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7129/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@c-d=
p1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7129/shard-glk9/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri=
-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5721">i915#5721</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-15/igt@kms_frontbuffer_tracki=
ng@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> +2 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> +22 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4278">i915#4278</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/sh=
ard-rkl-6/igt@kms_invalid_mode@bad-htotal.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_plane@plane-panning-top-left@pipe-b-plane=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3558">i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane@plane-panning-top-left@pip=
e-b-planes.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-4/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/355=
8">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-y:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_plane_multiple@atomic-pipe-b-tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
9">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3558">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7129/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-ti=
ling-y.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscal=
e-with-modifier:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-dg1-12/igt@kms_plane_scaling@upscale-with-modifier-20x2=
0@pipe-d-hdmi-a-1-upscale-with-modifier.html">SKIP</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-dg1-15/igt@kms_plane=
_scaling@upscale-with-modifier-20x20@pipe-d-hdmi-a-1-upscale-with-modifier.=
html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109=
642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068"=
>fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7129/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-rkl-2/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard=
-rkl-6/igt@kms_psr@primary_mmap_gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-glk3/igt@kms_rotation_crc@sprite-rotation-180.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i91=
5#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65"=
>i915#65</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7129/shard-glk5/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-dg1-12/igt@kms_vblank@pipe-c-wait-forked-busy.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4241">i91=
5#4241</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7129/shard-dg1-16/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a></l=
i>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7129/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/56=
14">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7129/shard-iclb3/igt@gem_exec_balancer@parallel-out-fence.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915=
#2852</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7129/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11673/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7129/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11673/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11673/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11673/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11673/shard-apl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11673/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-=
apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7129/shard-apl6/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl8/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7129/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7129/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/shard-apl3/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7129/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6479 -&gt; IGTPW_7129</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11673: 487728f8fae298d04767aa6cf8afea7a41b3e40b @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7129: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7129/index.htm=
l<br />
  IGT_6479: 78115aa8c8bcfc7784c7fc8dcaefcc2bce970b99 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4909872774666219537==--
